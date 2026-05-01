# 📋 المهام المؤجَّلة — iGarden

> **آخر تحديث:** 2026-05-01
> **الصيغة:** كل مهمة لها priority + entity مرتبط + سياق مختصر + ربط بـ events.md
> **المبدأ:** إذا اكتملت مهمة → تُحذف من هنا + تُضاف كحدث في events.md

---

## 🔴 P0 — حرج (يوقف الإنتاج أو الميدان)

### `regulatory-compliance` — استكمال الوضع النظامي 🚨 **متأخّر**

> ⚠️ **تاريخ تفعيل الشراكة المستهدف كان 2026-04-01** — اليوم 2026-05-01، أي أن الشراكة فُعِّلت منذ ~30 يوماً وهذه البنود لم تُغلق بعد. أي تأخير إضافي يعرّض الشركة لمخالفات نظامية + مشاكل توثيق دخول الشركاء.

- [ ] **فحص حالة iGarden في الجهات الحكومية** (المسؤول: علي)
  - مدد (منصة حماية الأجور)
  - قوى (وزارة الموارد البشرية)
  - GOSI (التأمينات الاجتماعية)
  - البلدية (الرخصة التجارية ساريّة؟)
  - الدفاع المدني (شهادة السلامة للورشة)
  - 📌 المخرج: تقرير مختصر لكل جهة (الحالة، تاريخ الانتهاء، الإجراء المطلوب)
- [ ] **إعداد عقود عمل رسمية للموظفين الحاليين** (عكاش + عبدالله + أي موظف آخر)
  - صيغة موحّدة عبر منصة قوى
  - توثيق الراتب + البدلات + ساعات العمل
- [ ] **توثيق عقد إيجار الورشة** رسمياً عبر شبكة إيجار
- [ ] **تحديث سجل المالكين/الشركاء** عند دخول علي وأيمن
  - تعديل عقد التأسيس لدى وزارة التجارة
  - تحديث الحصص + الصلاحيات
  - ربط بـ `decisions/` (قرار تفعيل الشراكة)
- [ ] **إعداد سجلات جرد نظامية** للمخزون + الأصول الثابتة
  - مخزون قطع IoT (ESP32, sensors, Pi 5/CM5, …)
  - أصول الورشة (أدوات، أجهزة، أثاث)
  - تسعير ابتدائي لكل بند (cost basis للشراكة)
- [ ] **إعداد مسير رواتب نظامي عبر مدد** بدلاً من التحويل اليدوي

> 📌 بعد إغلاق كل بند: حدث في `events.md` بصيغة `2026-MM-DD | regulatory | <البند> مكتمل`.

---

### `secrets-leak-warning` — تدوير الـ tokens المسرَّبة 🚨 **فوراً**

> ⚠️ هذه المهمة لا تنتظر — الـ tokens مكشوفة الآن (في تقارير محادثات + git history سابقة).

- [x] ~~**Anthropic API key (`igarden-telegram-bot`)**~~ ✅ ROTATED 2026-04-30
- [x] ~~**Telegram Bot Token (`@igarden_sa_bot`)**~~ ✅ ROTATED 2026-04-30
- [ ] **ESPHome `api_encryption_key` + `ota_password`** (للعميل 002) — مكشوفان في git history + chat report
  - `openssl rand -base64 32` لـ api key الجديد
  - `openssl rand -hex 16` لـ ota password الجديد
  - حدّث `secrets.yaml` على Pi 5 العميل 002
  - re-flash ESP32 بـ encryption key الجديد
  - سجّل: `2026-04-?? | customer-002 | ESP32 api_encryption_key + ota_password rotated [REDACTED]`
- [ ] **PostgreSQL password (CM5 — `igarden_data` / user `igarden`)** — مكشوف في chat report
  - `docker exec igarden-postgres psql -U postgres -c "ALTER USER igarden WITH PASSWORD '...';"`
  - حدّث n8n credentials لـ PostgreSQL
  - سجّل: `2026-04-?? | cm5 | PostgreSQL password rotated [REDACTED]`
- [ ] **Mosquitto password (`igarden-sensors`)** — مكشوف في chat report
  - تحديث `/etc/mosquitto/passwd` على CM5
  - تحديث n8n MQTT credential
  - تحديث ESP32 firmware (re-flash) — يمسّ كل الأجهزة المتصلة بـ Mosquitto
  - سجّل: `2026-04-?? | cm5 | Mosquitto password rotated [REDACTED]`
- [ ] **n8n Basic Auth password** — مكشوف في chat report
  - تحديث `N8N_BASIC_AUTH_PASSWORD` env في n8n container + restart
  - سجّل: `2026-04-?? | n8n | Basic Auth password rotated [REDACTED]`
- [ ] **ESP32 AP fallback password** — مكشوف في chat report
  - `openssl rand -base64 12`
  - تحديث `secrets.yaml` على Pi 5 العميل 002
  - re-flash ESP32
  - سجّل: `2026-04-?? | customer-002 | ESP32 AP fallback password rotated [REDACTED]`

> ⚠️ **n8n Encryption Key مكشوف أيضاً** — لكن **لا تدوّره** قبل re-encrypting كل credentials في n8n DB يدوياً (وإلّا ستفقد كل الـ credentials). قرار عمل لاحق.

> 📌 بعد التدوير: حدّث `SECRETS.md.example` إذا تغيّرت سياسة، وقدّر الحاجة لـ `git filter-repo` لمسح history.

### `secrets-incident` — إجراءات إضافية بعد التدوير

- [ ] **T-SEC-004 — Paranoid sweep:** فحص شامل لـ git history للأسرار التي قد تكون فاتتنا
  ```bash
  # adapt patterns حسب الحاجة
  git log --all -p | grep -iE "(password|secret|token|api[_-]?key|sk-ant-|ghp_|AIza)" | sort -u
  # أو استخدم: trufflehog filesystem . أو gitleaks detect
  ```
- [ ] **T-SEC-007 — أنشئ `/incidents/2026-04-29-secrets-leak/`** بعد إكمال rotation:
  - `disclosure.md` (الـ timeline من `secrets-incident` entity)
  - `rotation-log.md` (سجل كل مفتاح تم تدويره)
  - `postmortem.md` (السبب الجذري + الإجراءات الوقائية)
- [ ] **T-SEC-008 — أنشئ `/security/`** للسياسات طويلة المدى:
  - `access-matrix.md` (من يصل إلى ماذا)
  - `secrets-inventory.md` (جرد كامل بدون قيم)
  - `incident-response.md` (playbook لأيّ تسريب مستقبلي)

### `master-doc` — تحديث v1.0 → v1.5 في Project Knowledge

> ⚠️ Master Doc في Project Knowledge ما زال v1.0 — لا يحوي:
> Timeline 2024-2025-2026، Tagline "ازرع بذكاء"، التموضع "ننفّذ · نُوطّن · نُطوّر"،
> الركائز الثلاث، iGarden Tower داخل Hydroponics، عسفان (بدلاً من 5 محميات)،
> ADRs T009-T014، Hybrid AI Architecture.

> 🆕 **تحديث 2026-04-26 (BLOCK-010):** أُنتج Master Doc **v2.0** (2,684 سطر / 28 قسم) + Tech Appendix v3.0 — يستبدل خطّة v1.5.

- [ ] **T-DOC-001:** رفع Master Doc v2.0 إلى Project Knowledge + حذف v1.0
- [ ] **T-DOC-002:** رفع Tech Appendix v3.0 إلى Project Knowledge
- [ ] **T-DOC-003:** رفع PROJECT_STATE.md (إن استمرّ كقناة موازية لـ events.md) أو حذفه إن استبدل كلياً

### `gemini-gem` — تجهيز

- [ ] **T-OPS-001:** لصق Gemini Gem Instructions v2.0 في صفحة الـ Gem (3 صيغ متاحة: TXT/MD/DOCX)

### `meetings` — مكالمات واجتماعات الأسبوع 🔴

- [ ] **T-MTG-001:** مكالمة محمد الكثيري — **الأحد** (لا تؤجَّل)
- [ ] **T-MTG-002:** اتصال محاسب قانوني (GOSI) — الأحد/الإثنين
- [ ] **T-MTG-003:** محادثة م. ريم — هذا الأسبوع
- [ ] **T-MTG-004:** اجتماع شراكاتي ثلاثي — الخميس
- [ ] **T-MTG-005:** استشارة محامي IP (تسجيل العلامة)
- [ ] **T-MTG-006:** استشارة محامي عمل
- [ ] **T-MTG-007:** جلسة مع سعيد لإغلاق الأرقام المالية
- [ ] **T-MTG-008:** ملف الموظفين والرواتب (قادم منفصلاً)
- [ ] **T-MTG-009:** ملف الاشتراكات الشهرية (قادم منفصلاً)

### `briefs` — أسئلة معلَّقة

- [ ] **T-DOC-004:** قرار الـ 3 Briefs — تحديث أم استخدام كما هي؟ (السؤال طُرح ولم يُجَب)

### `ai-daily-routine` — تنفيذ الروتين اليومي (يبدأ 2026-05-02)

**🔴 P0 — السبت 2026-05-02 (10 دقائق):**
- [ ] **T-AI-001:** الاشتراك في Ben's Bites (https://bensbites.com) — بريد `info@igarden.sa`
- [ ] **T-AI-002:** Anthropic News bookmark/RSS (https://www.anthropic.com/news)
- [ ] **T-AI-003:** الاشتراك في The Rundown AI (https://www.therundown.ai)
- [ ] **T-AI-004:** حفظ قالب الموجز اليومي في Notes أو KB
- [ ] **T-AI-005:** اختبار المنبّه (21:00) ليلة السبت

**🟡 P1 — خلال الأسبوع 2026-05-03 → 2026-05-08:**
- [ ] **T-AI-006:** اختيار RSS reader (Feedly / Inoreader / Reeder) — اختياري
- [ ] **T-AI-007:** أول 5 موجزات يومية (الأحد-الخميس)
- [ ] **T-AI-008:** أول مراجعة أسبوعية الجمعة 2026-05-08

**🟢 P2 — مراجعة 2026-05-16:**
- [ ] **T-AI-009:** مراجعة تجربة الأسبوعين
- [ ] **T-AI-010:** تصميم n8n workflow (RSS → Claude filter → Telegram + Drive)
- [ ] **T-AI-011:** صياغة prompt الفلترة بالعربي (مبني على بيانات الأسبوعين)

**🔵 P3 — مستقبلي:**
- [ ] **T-AI-012:** PR تلقائي على repo `igarden-kb` للعناصر القابلة للتنفيذ
- [ ] **T-AI-013:** mini-dashboard على `igarden.sa/internal/ai-radar`

---

### `week-2026-W18` — مهام الأسبوع (محفوظة 2026-04-30)

- [ ] **T-WK-001 — Telegram Bot KB integration:** ربط البوت بقاعدة معرفة iGarden (System Prompt أو GitHub raw URLs)
- [ ] **T-WK-002 — منصة المناقصات الحكومية:** بدء التسجيل/التصفح
- [ ] **T-WK-003 — إقرار ZATCA:** قبل **31 مايو 2026** (deadline حرج)
- [ ] **T-WK-004 — مراجعة Pitch سنبلة:** الجمعة 1 مايو 2026
- [ ] **T-WK-005 — إصلاح locale warnings** على igarden-hub
- [ ] **T-WK-006 — vision-hub:** إضافته لـ Tailscale + Cloudflare Tunnel
- [ ] **T-WK-007 — متابعة Tailscale Trial:** 14 يوم من 2026-04-30 → ينتهي ~2026-05-14 — قرار: Free tier أم Pro؟

### `info@igarden.sa` — Single Point of Failure 🟡

- [ ] **T-SEC-009 — تخفيف خطر `info@igarden.sa` كنقطة فشل وحيدة**
  - حالياً مرتبط بـ: GitHub، Vercel، Cloudflare، Anthropic، Anyone-with-recovery
  - الخطر: اختراق هذا الإيميل = وصول كامل لكل الأنظمة
  - الإجراءات المقترحة:
    1. تفعيل 2FA قوي (hardware key أو authenticator)
    2. إيميل recovery منفصل (مثل `recovery@igarden.sa`)
    3. مراجعة دورية لـ "Connected apps" في Google Workspace
    4. (اختياري) إيميلات منفصلة per-service: `billing@`, `tech@`, `ops@`

---

### `vercel-account` — تجديد Vercel Pro Trial 🟡 P0/P1 حدودي

> ⏰ **deadline: 2026-05-07** — اليوم 2026-04-29، باقي ~8 أيام.

- [ ] قرار: ترقية إلى Pro paid plan ($20/شهر) أم العودة لـ Hobby (مجاني)؟
- [ ] إذا Hobby: نقل demo.igarden.sa + igarden.sa إلى free tier (يفقد بعض ميزات Pro)
- [ ] إذا Pro: تفعيل بطاقة دفع، تأكيد billing email = info@igarden.sa
- [ ] /schedule reminder agent مُعدّ ليفحص يوم 2026-05-05

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

### ~~`cloudflare-tunnel` / `dns`~~ ✅ محلول 2026-04-30

> **الحل المعتمد:** شراء domain جديد `igarden.work` ($8.20/سنة) على Cloudflare native DNS — تجنّب الحاجة لنقل nameservers `igarden.sa` من Vercel.
> - `n8n.igarden.work` → `garden-hub:5678` (webhook ثابت)
> - `api.igarden.work` → `garden-hub:8000` (للـ FastAPI لاحقاً)
> - cloudflared الآن systemd service (ليس Docker)

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
| 🔴 P0 | 23 | علي (نظامي) + الفريق |
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
