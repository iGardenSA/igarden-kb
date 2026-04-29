# 📋 المهام المؤجَّلة — iGarden

> **آخر تحديث:** 2026-04-29
> **الصيغة:** كل مهمة لها priority + entity مرتبط + سياق مختصر + ربط بـ events.md
> **المبدأ:** إذا اكتملت مهمة → تُحذف من هنا + تُضاف كحدث في events.md

---

## 🔴 P0 — حرج (يوقف الإنتاج أو الميدان)

### `secrets-leak-warning` — تدوير الـ tokens المسرَّبة 🚨 **فوراً**

> ⚠️ هذه المهمة لا تنتظر — الـ tokens مكشوفة الآن (في تقارير محادثات + git history سابقة).

- [ ] **Anthropic API key (`igarden-telegram-bot`)** — مكشوف في تقرير محادثة 2026-04-29
  - Anthropic Console → Settings → API Keys → revoke
  - أنشئ مفتاحاً جديداً
  - حدّث n8n HTTP node credentials
  - سجّل: `2026-04-?? | anthropic-api | key rotated [REDACTED]` في events.md
- [ ] **Telegram Bot Token (`@igarden_sa_bot`)** — مكشوف في تقرير محادثة + git history
  - BotFather → `/revoke`
  - أعِد إصدار token جديد
  - حدّث n8n Telegram credentials
  - أعِد setWebhook
  - سجّل: `2026-04-?? | telegram-bot | token rotated [REDACTED]` في events.md
- [ ] **ESPHome `api_encryption_key` + `ota_password`** (للعميل 002) — مكشوفان في git history
  - `openssl rand -base64 32` لـ api key الجديد
  - `openssl rand -hex 16` لـ ota password الجديد
  - حدّث `secrets.yaml` على Pi 5 العميل 002
  - re-flash ESP32 بـ encryption key الجديد
  - سجّل: `2026-04-?? | esp32-tank | api_encryption_key + ota_password rotated [REDACTED]`

> 📌 بعد التدوير: حدّث `SECRETS.md.example` إذا تغيّرت سياسة، وقدّر الحاجة لـ `git filter-repo` لمسح history.

### `customer-002` — إكمال الغولاء قبل الذهاب للأحساء
- [ ] **معايرة pH** بمحاليل قياسية 4.0 + 7.0
- [ ] **حل قراءة TDS UART** (BA.012 protocol غير محسوم)
- [ ] **شاشة اللمس + USB devices** (Wayland/cage لا يلتقط input)
- [ ] **توسيع SD من 16GB → 64GB** (SD ممتلئة 99%)

### `customer-003` — عقد الأحساء المضاعف
- [ ] **قراءة العقد الجديد بـ Opus 4.7** ومقارنته بالأصلي
- [ ] **تحديث BOM + الميزانية** (احتمال تضاعف القيمة إلى ~124,200 ريال)
- [ ] **تحديث الجدول الزمني** بناءً على المضاعفة

### `pi5-fastapi` — تأكيد الـ IP
- [ ] **SSH للجهاز** + `hostname` + `ip a` لتأكيد IP الفعلي
- [ ] حل تعارض ظاهري مع `pi5-ghulah` (نفس IP `192.168.8.235`)

---

## 🟡 P1 — مهم (يحسّن الموثوقية أو السرعة)

### `cloudflare-tunnel` / `dns` — حل دائم لـ webhook
- [ ] **سكربت auto-update لـ webhook URL** عند كل restart cloudflared
  - يقرأ URL الجديد من logs
  - يحدّث `WEBHOOK_URL` في n8n
  - يعيد setWebhook لـ Telegram
- [ ] **DNS دائم** لـ `n8n.igarden.sa`
  - الخيارات:
    1. نقل nameservers من Vercel إلى Cloudflare (يكسر الموقع مؤقتاً)
    2. subdomain على `pages.dev` كحل وسط
    3. الإبقاء على trycloudflare + سكربت auto-update

### `n8n` — إكمال البنية
- [ ] **MQTT credential** في n8n (يحرّر workflow Sensor Simulator)
- [ ] **Execute Workflow الأول** end-to-end (Mosquitto → n8n → PostgreSQL)
- [ ] **Schema migrations** للـ `sensor_readings` hypertable
- [ ] **Backups دورية** لـ PostgreSQL → Google Drive

### `customer-002` — Master Image
- [ ] **أخذ Master Image v1.0** بعد إكمال جميع P0 لعميل 002
- [ ] **رفع على Google Drive** + نسخة على External SSD
- [ ] **سكربت `customize-pi.sh`** لتخصيص hostname + secrets
- [ ] **`templates/zone-template.yaml`** قابل للنسخ

---

## 🟢 P2 — مفيد (يضيف ميزة لكن غير ضاغط)

### `kb` — هيكل التجارب
- [ ] بناء هيكل `osfan-station/experiments/`
- [ ] قالب `EXP-XXX.md` لكل تجربة
- [ ] قنوات إدخال: Claude Web، Telegram Bot، MQTT، Vision AI

### `telegram-bot` — تعميق
- [ ] **Multi-user routing** (علي/أيمن/عكاش/عبدالله — صلاحيات مختلفة)
- [ ] **Vision** — استقبال صور النباتات → Claude Vision → KB
- [ ] **MQTT bridge** — البوت يستعلم عن حالة الحساسات الحيّة

### `whatsapp-bot` — بعد استقرار Telegram
- [ ] حساب WhatsApp Business
- [ ] webhook + n8n integration
- [ ] نفس الـ workflow (Claude API)

### `pi5-ghulah` — تحسينات
- [ ] توصيل Level Transmitter QDY30A (نسخة 0-3.3V)
- [ ] NVMe HAT + SSD للموثوقية
- [ ] Cloudflare Tunnel للوصول عن بعد الآمن
- [ ] InfluxDB + Grafana للتحليلات

---

## 🔵 P3 — مستقبل (للخطط الأبعد)

### `sensors-pipeline` — MQTT → KB تلقائي
- [ ] MQTT حساسات الميدان → n8n → PostgreSQL/TimescaleDB
- [ ] استخراج تلقائي للأحداث الشاذة → events.md

### `vision-ai` — Pi 5 → KB
- [ ] كاميرا على Pi 5 → captures دورية
- [ ] Claude Vision API → تحليل صحة النبات
- [ ] نتائج → events.md + tasks/pending.md

### `pi5-fastapi` — استئناف
- [ ] Phase 3 Session B (Actions)
- [ ] Phase 3 Session C (Engine)
- [ ] Phase 3 Session D (DB+API)
- [ ] Phase 4 (MQTT + HA Auto-Discovery)
- [ ] Phase 5 (Frontend wiring)
- > الشرط: 5-10 عملاء HA مستقرّين أوّلاً

### `kb` — Layer 2 + Layer 3
- [ ] Layer 2: سكربت `claude curate` على CM5
- [ ] Layer 3: MCP Server مخصّص + Knowledge Graph
- [ ] (محتمل) منتج SaaS منفصل

---

## 📊 التوزيع الحالي

| الأولوية | عدد المهام | المسؤول الافتراضي |
|---|---|---|
| 🔴 P0 | 12 | علي |
| 🟡 P1 | 8 | علي + أيمن |
| 🟢 P2 | 11 | الفريق |
| 🔵 P3 | 6 | لاحقاً |

---

## 🔄 الـ workflow

عند إكمال مهمة:
1. **احذف السطر** من هذا الملف
2. **أضف حدث في events.md** بصيغة:
   ```
   YYYY-MM-DD | <entity> | <ما تم>
   ```
3. **commit** بنفس النمط

---

🌱 **iGarden — ازرع بذكاء**
