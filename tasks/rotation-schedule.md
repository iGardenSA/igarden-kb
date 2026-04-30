# 🗓️ جدول تدوير الأسرار — iGarden

> **آخر تحديث:** 2026-04-29
> **القاعدة:** عند إكمال أيّ بند → احذفه من هنا + أضف حدث في `events.md` بصيغة `YYYY-MM-DD | <entity> | <secret> rotated [REDACTED]`

---

## 🔴 P0 — فوراً (مفاتيح مكشوفة في الـ repo history)

### 1. Telegram Bot Token
- **الكيان:** `telegram-bot`
- **التعرّض:** ~24-48 ساعة في الـ repo public
- **الأثر إذا اختُرق:** سيطرة كاملة على البوت + إرسال رسائل لكل المستخدمين
- **المدّة المقدّرة:** 10 دقائق
- **الـ Workflow:** BotFather → Revoke → New token → n8n credential → Test
- **التبعيّات:** لا
- **الحالة:** ⏳ قيد التنفيذ (اتّبع الدليل في الردّ السابق)

### 2. ESPHome — `api_encryption_key`
- **الكيان:** `esp32-tank`
- **التعرّض:** ~24-48 ساعة (مكشوف في `infrastructure/pi5-customer2-ghulah.md` history)
- **الأثر إذا اختُرق:** التحكم بـ ESP32 igarden-tank عبر HA API (نفس LAN)
- **المدّة المقدّرة:** 30 دقيقة (يحتاج OTA flash)
- **الـ Workflow:**
  1. `openssl rand -base64 32` → مفتاح جديد
  2. حدّث ESPHome `secrets.yaml` على Pi 5 الغولاء
  3. `esphome run igarden-tank.yaml` (OTA flash بـ password القديمة)
  4. تحقّق: HA → Settings → Devices → ESP32 reconnected
  5. password manager + events.md
- **التبعيّات:** يجب أن يكون OTA password القديم ما زال صحيحاً

### 3. ESPHome — `ota_password`
- **الكيان:** `esp32-tank`
- **التعرّض:** ~24-48 ساعة
- **الأثر إذا اختُرق:** flash firmware عشوائي على ESP32 (تخريب)
- **المدّة المقدّرة:** 15 دقيقة (نفس OTA flash مع #2)
- **الـ Workflow:** نفس #2 — يُنفّذ في **نفس** OTA flash بترتيب: change `api_encryption_key` فقط أوّلاً، تأكّد من الاتصال، ثم change `ota_password`
- **التبعيّات:** **يُنفّذ بعد** #2 لتجنّب فقدان كلا الوصولين معاً

---

## 🟡 P1 — هذا الأسبوع (مكشوف في رسائل Claude، **وقائي**)

### 4. Anthropic API Key (`igarden-telegram-bot`)
- **الكيان:** `anthropic-api`
- **التعرّض:** **لم يُكشف** في الـ repo (وقائي)
- **المدّة:** 5 دقائق
- **الـ Workflow:** Console → Create new → n8n update → Test → Disable old (الدليل في الردّ السابق)
- **توصية إضافية:** فعّل Spend Limit `$50/month` بعد rotation

### 5. PostgreSQL Password (DB `igarden_data`)
- **الكيان:** `cm5-osfan` (postgres)
- **التعرّض:** **لم يُكشف** في الـ repo (مذكور في رسالة لـ Claude فقط)
- **الأثر إذا اختُرق:** قراءة/كتابة بيانات الحساسات + كل n8n credentials المشفّرة
- **المدّة:** 20 دقيقة
- **الـ Workflow:**
  ```bash
  ssh igarden@192.168.8.102
  NEW_PG_PASS=$(openssl rand -base64 32)
  
  # 1. غيّر الـ password
  docker exec -it igarden-postgres psql -U igarden -d postgres \
    -c "ALTER USER igarden WITH PASSWORD '$NEW_PG_PASS';"
  
  # 2. حدّث n8n credential (UI: Credentials → PostgreSQL)
  # 3. أعد تشغيل n8n container
  docker restart n8n
  
  # 4. اختبر workflow Sensor Simulator
  ```
- **التبعيّات:** يجب تحديث **كل** n8n credentials التي تستخدم PostgreSQL

### 6. Mosquitto Password (user `igarden-sensors`)
- **الكيان:** `cm5-osfan` (mosquitto)
- **التعرّض:** **لم يُكشف** في الـ repo
- **الأثر إذا اختُرق:** نشر/قراءة MQTT topics → التحكم بكل الحساسات والـ relays
- **المدّة:** 30 دقيقة
- **الـ Workflow:**
  ```bash
  ssh igarden@192.168.8.102
  NEW_MQTT_PASS=$(openssl rand -base64 24)
  
  # 1. CM5 — غيّر في mosquitto passwd
  sudo mosquitto_passwd /etc/mosquitto/passwd igarden-sensors
  # (أدخل NEW_MQTT_PASS)
  sudo systemctl reload mosquitto
  
  # 2. Pi 5 الغولاء — حدّث ESPHome secrets.yaml + OTA flash
  ssh i@192.168.8.235
  cd ~/igarden/esphome
  # عدّل secrets.yaml: mqtt_password = NEW_MQTT_PASS
  esphome run igarden-tank.yaml
  
  # 3. n8n MQTT credential (UI)
  ```
- **التبعيّات:**
  - يستلزم **تحديث ESPHome firmware** في الميدان (الغولاء) — يفضل عند زيارة موقعية
  - أيّ workflow في n8n يستخدم MQTT credential سيتوقف حتى التحديث

### 7. n8n Basic Auth (user `igarden`)
- **الكيان:** `cm5-osfan` (n8n)
- **التعرّض:** **لم يُكشف** في الـ repo
- **الأثر إذا اختُرق:** دخول n8n UI → سيطرة على workflows + credentials
- **المدّة:** 10 دقائق
- **الـ Workflow:**
  ```bash
  # على CM5
  NEW_N8N_PASS=$(openssl rand -base64 24)
  docker exec n8n sh -c "echo 'N8N_BASIC_AUTH_PASSWORD=$NEW_N8N_PASS' >> /home/node/.n8n/.env"
  docker restart n8n
  # خزّن NEW_N8N_PASS في password manager
  ```

---

## 🟢 P2 — لاحقاً (مخاطر منخفضة، لكن مفيد)

### 8. ESP32 AP Fallback Password
- **الكيان:** `esp32-tank`
- **التعرّض:** ~24-48 ساعة في الـ repo
- **الأثر إذا اختُرق:** يحتاج المخترق وصولاً فيزيائياً للـ ESP32 + WiFi معطّل (سيناريو نادر)
- **المدّة:** يُنفّذ مع #2 + #3 في **نفس OTA flash** (zero extra time)
- **الـ Workflow:** عدّل `secrets.yaml` → `ap_fallback_password` → reflash

### 9. n8n Encryption Key
- **الكيان:** `cm5-osfan` (n8n)
- **التعرّض:** **لم يُكشف**
- **⚠️ خطر:** تغيير المفتاح **يُلغي صلاحية كل credentials المشفّرة** في n8n DB
- **الـ Workflow:**
  ```
  1. تصدير كل credentials من UI
  2. وقف n8n
  3. غيّر N8N_ENCRYPTION_KEY في .env
  4. n8n start فارغ
  5. أعد إنشاء كل credential يدوياً
  ```
- **التوصية:** **لا تُدوَّر** إلا عند migration كامل (مثلاً نقل n8n لـ VPS) — التكلفة لا تستحق

### 10. SSH Keys
- **الكيان:** `pi5-customer2`, `cm5-osfan`
- **التعرّض:** المفاتيح الخاصة على EliteBook فقط — لم تُكشف
- **التوصية:** rotate كل سنة، أو عند فقدان جهاز
- **المدّة:** 15 دقيقة لكل جهاز

---

## 📋 الترتيب الموصى به للتنفيذ

```
الجلسة 1 (30 دقيقة، عن بعد):
├── #1 Telegram bot token       ← مكشوف
├── #4 Anthropic API key        ← وقائي + يفعّل spend limit
└── #7 n8n basic auth           ← مكشوف للـ LAN

الجلسة 2 (1 ساعة، تحتاج وصول للـ CM5):
├── #5 PostgreSQL password
└── #6 Mosquitto password — جزء CM5 فقط (يكسر workflows مؤقتاً)

الجلسة 3 (زيارة موقعية للغولاء، 1 ساعة):
├── #2 + #3 + #8 ESPHome triple rotation (OTA flash واحد)
└── #6 Mosquitto password — جزء Pi 5 (تكملة)

مؤجَّل لـ migration:
└── #9 n8n encryption key
```

---

## 🧹 (اختياري) Git History Scrub

بعد إكمال rotation، يمكن مسح المفاتيح القديمة من history (لمنع scanning bots لاحقاً):

```bash
pip install git-filter-repo
cd ~/igarden-kb

# أنشئ ملف replacements.txt:
cat > /tmp/replacements.txt <<'EOF'
7798622043:AAHS7XMWvXzrpTvpNrqB4ELKee__ucG85lE==>[REDACTED]
Lc5+NNXoaOu9y1/rpOA+odCGDjMzp3Zzy879af3tz7w===>[REDACTED]
c21a718a835f2344623a8b2238540436==>[REDACTED]
EOF

git filter-repo --replace-text /tmp/replacements.txt --force
git push --force origin claude/session-report-knowledge-base-l66cl
```

> ⚠️ Force-push يكسر forks/clones. إذا الـ repo ما زال شخصياً (لا forks)، آمن.
> ⚠️ بعد التدوير، history scrub ليس ضرورياً — المفاتيح القديمة ميتة. هذه الخطوة "تنظيف فقط".

---

## 📊 التتبّع

| # | السرّ | الأولوية | الحالة | تاريخ التدوير |
|---|---|:---:|:---:|---|
| 1 | Telegram bot token | 🔴 P0 | ✅ DONE | 2026-04-30 |
| 2 | ESPHome api_encryption_key | 🔴 P0 | ⬜ لم يبدأ | — |
| 3 | ESPHome ota_password | 🔴 P0 | ⬜ لم يبدأ | — |
| 4 | Anthropic API key | 🟡 P1 | ✅ DONE | 2026-04-30 |
| 5 | PostgreSQL password | 🟡 P1 | ⬜ لم يبدأ | — |
| 6 | Mosquitto password | 🟡 P1 | ⬜ لم يبدأ | — |
| 7 | n8n basic auth | 🟡 P1 | ⬜ لم يبدأ | — |
| 8 | ESP32 AP fallback | 🟢 P2 | ⬜ لم يبدأ | — |
| 9 | n8n encryption key | 🟢 P2 | ⏸️ مؤجَّل | — |
| 10 | SSH keys | 🟢 P2 | ⬜ لم يبدأ | — |

---

🌱 **iGarden — ازرع بذكاء**
