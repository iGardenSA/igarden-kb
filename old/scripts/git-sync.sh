#!/bin/bash
# git-sync.sh — دفع تحديثات Knowledge Base لـ GitHub
# الاستخدام: ./git-sync.sh "وصف ما حدث"

set -e

# الانتقال لجذر KB (relative to script location)
KB_DIR="$(dirname "$(realpath "$0")")/.."
cd "$KB_DIR"

# التحقق من إن git مهيّأ
if [ ! -d ".git" ]; then
    echo "❌ هذا المجلد ليس git repo بعد"
    echo "💡 شغّل أولاً: ./scripts/init-repo.sh"
    exit 1
fi

# رسالة الـ commit (من المعطى أو افتراضي)
COMMIT_MSG="${1:-تحديث Knowledge Base — $(date +%Y-%m-%d)}"

# عرض ما تغيّر
echo "📋 الملفات المتغيّرة:"
git status --short

echo ""
read -p "هل تريد المتابعة؟ (y/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ تم إلغاء العملية"
    exit 1
fi

# Add + Commit + Push
git add .
git commit -m "$COMMIT_MSG"
git push origin main

echo ""
echo "✅ تم دفع التحديثات بنجاح"
echo "🌐 https://github.com/iGardenSA/igarden-kb"
