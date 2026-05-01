#!/usr/bin/env bash
# iGarden Security Fix — All-in-One
# يعالج: rotation ESPHome key + git-filter-repo history + final scan
#
# الاستخدام:
#   chmod +x scripts/igarden-security-fix.sh
#   bash scripts/igarden-security-fix.sh [REPO_PATH] [ESPHOME_YAML]
#
# المتطلبات:
#   - git, openssl, python3, pip (لـ git-filter-repo)
#   - ملف ~/.igarden-secrets-to-purge.txt يحوي القيم القديمة (اقرأ التعليمات أدناه)
#
# ⚠️ مهم: السكربت لا يحوي أيّ secrets. يقرأ القيم القديمة من ملف
#     ~/.igarden-secrets-to-purge.txt الذي ينشئه المستخدم خارج الـ repo.
#
# تنسيق ~/.igarden-secrets-to-purge.txt (سطر لكل سرّ):
#   <العنوان>=<القيمة>
# مثال:
#   TELEGRAM_OLD=<bot_id>:<auth_token>
#   ESPHOME_API_OLD=<base64-key>=
#   ESPHOME_OTA_OLD=<32-hex-chars>
#
# المرجع: tasks/rotation-schedule.md

set -euo pipefail

# ───────────── Args ─────────────
REPO_PATH="${1:-$(pwd)}"
ESPHOME_YAML="${2:-}"
SECRETS_FILE="${IGARDEN_SECRETS_FILE:-$HOME/.igarden-secrets-to-purge.txt}"

cd "$REPO_PATH"

# ───────────── Colors ─────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'

info()  { echo -e "${BLUE}ℹ️  $*${NC}"; }
ok()    { echo -e "${GREEN}✅ $*${NC}"; }
warn()  { echo -e "${YELLOW}⚠️  $*${NC}"; }
err()   { echo -e "${RED}❌ $*${NC}" >&2; }
ask()   { read -p "$(echo -e "${YELLOW}❓ $1 [y/N] ${NC}")" -n 1 -r; echo; [[ $REPLY =~ ^[Yy]$ ]]; }

# ============================================================
# STEP 0 — Preflight
# ============================================================
echo ""
info "STEP 0: فحص المتطلبات..."

for cmd in git openssl python3; do
  command -v "$cmd" >/dev/null || { err "$cmd مطلوب"; exit 1; }
done

if ! command -v git-filter-repo >/dev/null; then
  warn "git-filter-repo غير موجود"
  if ask "أثبّته الآن عبر pip؟"; then
    pip install --user git-filter-repo
    export PATH="$HOME/.local/bin:$PATH"
  else
    warn "ستتم تخطّي STEP 2 (history scrub)"
  fi
fi

git rev-parse --git-dir >/dev/null 2>&1 || { err "ليس git repo: $REPO_PATH"; exit 1; }

[ -n "$(git status --porcelain)" ] && { err "العمل غير مُلتزَم. commit/stash أوّلاً."; exit 1; }

# تحقّق من ملف الأسرار
if [ ! -f "$SECRETS_FILE" ]; then
  err "ملف الأسرار غير موجود: $SECRETS_FILE"
  echo ""
  cat <<EOF
أنشئ الملف خارج الـ repo (مثلاً في home):

  cat > $SECRETS_FILE <<'INNER'
  TELEGRAM_OLD=<القيمة الكاملة للـ Telegram token القديم>
  ESPHOME_API_OLD=<القيمة الكاملة لـ api_encryption_key القديم>
  ESPHOME_OTA_OLD=<القيمة الكاملة لـ ota_password القديم>
  INNER

  chmod 600 $SECRETS_FILE

ثم أعد تشغيل السكربت.

⚠️ لا تضع هذا الملف داخل الـ repo!
EOF
  exit 1
fi

chmod 600 "$SECRETS_FILE" 2>/dev/null || true
ok "Preflight OK — repo: $REPO_PATH"
ok "Secrets file: $SECRETS_FILE"

# اقرأ الأسرار القديمة
# shellcheck source=/dev/null
source <(grep -E '^[A-Z_]+=' "$SECRETS_FILE")

# ============================================================
# STEP 1 — Rotate ESPHome keys (live secrets)
# ============================================================
echo ""
info "STEP 1: توليد مفاتيح ESPHome جديدة..."

NEW_API_KEY=$(openssl rand -base64 32)
NEW_OTA_PWD=$(openssl rand -hex 16)

# احفظ في ملف مؤقت محمي
NEW_OUT="$HOME/.igarden-new-secrets-$(date +%Y%m%d-%H%M%S).txt"
umask 077
cat > "$NEW_OUT" <<EOF
# iGarden ESPHome rotated keys — $(date -Iseconds)
# انقل هذه إلى password manager فوراً، ثم احذف هذا الملف.
api_encryption_key: $NEW_API_KEY
ota_password:       $NEW_OTA_PWD
EOF
ok "حُفظت المفاتيح الجديدة في: $NEW_OUT (chmod 600)"

# تحديث ملف YAML إذا أُعطي
if [ -n "$ESPHOME_YAML" ] && [ -f "$ESPHOME_YAML" ]; then
  cp "$ESPHOME_YAML" "${ESPHOME_YAML}.bak"
  python3 - "$ESPHOME_YAML" "$NEW_API_KEY" "$NEW_OTA_PWD" <<'PYEOF'
import sys, re
path, new_api, new_ota = sys.argv[1], sys.argv[2], sys.argv[3]
content = open(path).read()
content = re.sub(r'(api_encryption_key:\s*).*', f'\\1{new_api}', content)
content = re.sub(r'(ota_password:\s*).*', f'\\1{new_ota}', content)
open(path, 'w').write(content)
PYEOF
  ok "حُدِّث: $ESPHOME_YAML (نسخة احتياطية: ${ESPHOME_YAML}.bak)"
  warn "نفّذ الآن: esphome run $ESPHOME_YAML  (OTA flash بالـ password القديمة)"
  warn "بعد التأكد من إعادة الاتصال، احذف ${ESPHOME_YAML}.bak"
else
  warn "لم يُعطَ ESPHOME_YAML — حدّث secrets.yaml يدوياً بالقيم في $NEW_OUT"
fi

# ============================================================
# STEP 2 — Git history scrub
# ============================================================
echo ""
info "STEP 2: مسح الأسرار القديمة من الـ git history..."

if ! command -v git-filter-repo >/dev/null; then
  warn "git-filter-repo غير متوفّر — تخطّي"
else
  REPL_FILE=$(mktemp)
  trap "rm -f $REPL_FILE" EXIT

  # ابنِ ملف الاستبدال من المتغيرات المُحمَّلة
  while IFS='=' read -r name value; do
    [[ "$name" =~ ^[A-Z_]+$ ]] || continue
    [[ -n "$value" ]] || continue
    echo "${value}==>[REDACTED-${name}]" >> "$REPL_FILE"
  done < "$SECRETS_FILE"

  COUNT=$(wc -l < "$REPL_FILE")
  info "سيتم مسح $COUNT pattern من الـ history"

  echo ""
  warn "هذا سيعيد كتابة كل تاريخ git — يتطلّب force-push بعدها."

  if ask "متابعة؟"; then
    BACKUP="../$(basename "$PWD")-backup-$(date +%Y%m%d-%H%M%S).bundle"
    git bundle create "$BACKUP" --all
    ok "Backup كامل في: $BACKUP"

    git filter-repo --replace-text "$REPL_FILE" --force
    ok "History rewrite تم"

    if ask "force-push إلى origin؟"; then
      REMOTE_URL=$(git config --get remote.origin.url 2>/dev/null || echo "")
      if [ -z "$REMOTE_URL" ]; then
        warn "remote origin غير مضبوط — أعد إضافته:"
        echo "  git remote add origin <URL>"
        echo "  git push --force --all && git push --force --tags"
      else
        git push --force --all
        git push --force --tags
        ok "Force-push تم"
      fi
    else
      info "لـ push لاحقاً: git push --force --all && git push --force --tags"
    fi
  else
    info "تم تخطّي history scrub"
  fi
fi

# ============================================================
# STEP 3 — Final scan + .gitignore audit
# ============================================================
echo ""
info "STEP 3: فحص نهائي للملفات..."

FOUND=0
while IFS='=' read -r name value; do
  [[ "$name" =~ ^[A-Z_]+$ ]] || continue
  [[ -n "$value" ]] || continue
  # escape regex metacharacters
  esc=$(printf '%s' "$value" | sed 's/[][\\^$*.|+?(){}]/\\&/g')
  if grep -rln --exclude-dir=.git --exclude-dir=igarden_kb -E "$esc" . 2>/dev/null; then
    err "وجد $name في:"
    grep -rln --exclude-dir=.git --exclude-dir=igarden_kb -E "$esc" . 2>/dev/null
    FOUND=1
  fi
done < "$SECRETS_FILE"

[ $FOUND -eq 0 ] && ok "كل الـ patterns محجوبة في الملفات الحالية"

# .gitignore audit
echo ""
info "فحص .gitignore..."
NEEDED=("secrets.md" "SECRETS.md" ".env" ".env.*" "*.key" "*.pem" "secrets.yaml" "id_rsa" "*_rsa")
for n in "${NEEDED[@]}"; do
  grep -qF "$n" .gitignore 2>/dev/null && ok ".gitignore: $n" || warn ".gitignore: $n مفقود"
done

# ============================================================
# Final report
# ============================================================
echo ""
echo "═══════════════════════════════════════════"
echo "  📋 تقرير نهائي — Security Fix"
echo "═══════════════════════════════════════════"
echo ""
echo "✅ مفاتيح ESPHome جديدة في: $NEW_OUT"
echo "   → انقلها لـ password manager فوراً"
echo "   → احذف الملف بعد النسخ"
echo ""
[ -n "$ESPHOME_YAML" ] && echo "✅ secrets.yaml محدَّث (backup: ${ESPHOME_YAML}.bak)" || echo "⚠️  secrets.yaml يحتاج تحديث يدوي"
echo ""
echo "ما تبقّى يدوياً:"
echo "  1. esphome run <yaml> → OTA flash"
echo "  2. تأكد ESP32 reconnected في HA"
echo "  3. (إذا لم يُنفَّذ) git push --force --all && git push --force --tags"
echo "  4. حدِّث events.md:"
echo "     2026-MM-DD | esp32-tank | api_encryption_key + ota_password rotated [REDACTED]"
echo "  5. حدِّث rotation-schedule.md status: ✅ DONE لـ #2 و #3 و #8"
echo "  6. **احذف $SECRETS_FILE بعد التأكّد من نجاح كل شيء** (لا تبقي القيم القديمة)"
echo ""
echo "🌱 iGarden — ازرع بذكاء"
