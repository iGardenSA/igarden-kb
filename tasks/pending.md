# 📋 المهام المؤجَّلة — iGarden

> **آخر تحديث:** 2026-05-01
> **الصيغة:** كل مهمة لها priority + entity مرتبط + سياق مختصر + ربط بـ events.md
> **المبدأ:** إذا اكتملت مهمة → تُحذف من هنا + تُضاف كحدث في events.md
> **الاستراتيجية الناظمة:** Proof-First → Positioning → MMP — راجع [`../decisions/2026-04-30-strategy-pivot.md`](../decisions/2026-04-30-strategy-pivot.md)

---

## 📅 الجدول الزمني للأسبوع الأول

| اليوم | المهمة الرئيسية |
|---|---|
| الجمعة 1 مايو | KB sync + رفع خطاب التقسيط + تدوير الـ tokens + بدء أعمال customer-002 |
| السبت 2 مايو | الاشتراك في 3 مصادر AI Daily + معايرة pH + إرسال Solar RFQ |
| الأحد 3 مايو | أول AI Daily Brief @21:00 + حل TDS UART + متابعة سعيد على ZATCA |
| الإثنين 4 مايو | AI Daily @21:00 + توسيع SD card |
| الثلاثاء 5 مايو | AI Daily @21:00 + حل شاشة اللمس + تجهيز مواد سنبلة |
| الأربعاء 6 مايو | AI Daily @21:00 + البروفة النهائية للعرض |
| الخميس 7 مايو | AI Daily @21:00 + ⭐ **عرض سنبلة (Phase-2 expansion offer)** |
| الجمعة 8 مايو | 🔁 أول مراجعة أسبوعية لـ AI Daily |

---

## 🔴 P0 — يبدأ 2026-05-01 (هذا الأسبوع)

### `ai-daily-routine` — الاشتراك في المصادر الثلاثة ⏰ **السبت 2026-05-02 (10 دقائق)**

> 🔗 راجع [`../ai-daily/README.md`](../ai-daily/README.md) — لا تُضِف مصادر إضافية قبل أسبوعين

- [ ] الاشتراك في **Ben's Bites** — https://bensbites.com
- [ ] إضافة **Anthropic News** كـ bookmark/RSS — https://www.anthropic.com/news
- [ ] الاشتراك في **The Rundown AI** — https://www.therundown.ai
- [ ] استخدام بريد `info@igarden.sa` لجميع الاشتراكات
- [ ] حفظ قالب الموجز في تطبيق Notes (موجود أيضاً في `ai-daily/README.md`)
- [ ] اختبار منبّه Android 21:00 ليلة السبت (لم يُختبر بعد)

### `ai-daily-routine` — أول مراجعة أسبوعية ⏰ **الجمعة 2026-05-08**

- [ ] تخصيص 30 دقيقة لمراجعة موجزات الأسبوع
- [ ] أي مصدر كان الأكثر فائدة؟
- [ ] ما يستحق التحويل لمهمة في `tasks/pending.md`؟
- [ ] إضافة أحداث في `events.md` (entity: `ai-daily-routine`)

### `installment-request` — رفع خطاب تقسيط VAT Q1 2026 ⏰ **2026-05-01**

> 📎 المبلغ: 18,285.31 ريال — راجع `igarden-vat` في events.md

- [ ] تنزيل كشف الراجحي للأشهر الثلاثة (Q1 2026) من تطبيق الراجحي
- [ ] الدخول لبوابة ZATCA → خطة التقسيط لضريبة القيمة المضافة (الخطوة 4: الملخص)
- [ ] رفع المرفقات: خطاب التقسيط (PDF) + كشف الراجحي Q1
- [ ] مراجعة جدول الأقساط في الخطوة 3 (3-6 أشهر مقترحة، دفعة معجلة 10-25%)
- [ ] تأكيد التعهد + التسليم
- [ ] تسجيل: `2026-05-01 | installment-request | letter submitted to ZATCA — schedule [...]`

### `secrets-leak` — تدوير الـ tokens المسرَّبة 🚨 **فوراً**

> راجع تفاصيل خطوات التدوير في [`SECRETS.md.example`](../SECRETS.md.example)

- [ ] **Anthropic API key** (`igarden-telegram-bot`) — Anthropic Console → revoke + إعادة إصدار + تحديث n8n
- [ ] **Telegram Bot Token** (`@igarden_sa_bot`) — BotFather `/revoke` + إعادة إصدار + setWebhook
- [ ] **ESPHome `api_encryption_key` + `ota_password`** (customer-002) — re-flash ESP32
- [ ] **PostgreSQL password** (CM5) + تحديث n8n credential
- [ ] **Mosquitto password** (`igarden-sensors`) + re-flash ESP32
- [ ] **n8n Basic Auth password**
- [ ] **ESP32 AP fallback password**

> ⚠️ **n8n Encryption Key** مكشوف لكن **لا تدوّره** قبل re-encrypting credentials في n8n DB يدوياً.

### `customer-002` — إكمال 15% المتبقي

> 🔗 راجع [`../customers/002-ghulah-lettuce.md`](../customers/002-ghulah-lettuce.md)

- [ ] **معايرة pH** بمحاليل قياسية 4.0 + 7.0
- [ ] **حل قراءة TDS UART** (BA.012 protocol — baud rate + frame format)
- [ ] **توسيع SD 16GB → 64GB** (ممتلئة 99%)
- [ ] **حل شاشة اللمس + USB devices** (Wayland/cage)

### `zatca` — موعد 31 مايو 2026

- [ ] إكمال tax return 2025 (القوائم المالية الرسمية)
- [ ] تسليم للمحاسب القانوني + سعيد
- [ ] طلب من سعيد: صورة من إقرار VAT Q1 2026 المعتمد + سند سداد الزكاة (2,114.01 ريال) + رقم مرجعي تأكيدي

### `sunbulah` — تحضيرات قبل 7 مايو ⭐

> 🔗 العرض = Phase-2 expansion offer (NOT intro pitch). راجع [`../decisions/2026-04-30-strategy-pivot.md`](../decisions/2026-04-30-strategy-pivot.md)

- [ ] طباعة Compliance Dashboard على A3 ملوّن (3 نسخ)
- [ ] فيديو خميس مشيط (60 ثانية) — Case Study
- [ ] أرقام عميل 001 على ورقة A4
- [ ] قراءة عقد customer-002 المُحدّث بـ Opus 4.7

### `gosi` + `partnership-activation` — نظامي قبل تفعيل الشراكة

> 🔗 راجع [`../infrastructure/gosi-mudad-qiwa.md`](../infrastructure/gosi-mudad-qiwa.md) + [`../decisions/2026-04-30-partnership.md`](../decisions/2026-04-30-partnership.md)

- [ ] تسجيل المنشأة في GOSI بأثر رجعي + الموظفين (علي، أيمن، محمد الأسد، أنس)
- [ ] تحديث السجل التجاري بالشركاء الجدد (50/25/25 — رأس المال 100,000 يبقى كما هو)
- [ ] صياغة + توثيق عقد الشراكة لدى الكاتب العدل
- [ ] تسجيل في **مدد** + ربط ملفات الرواتب
- [ ] تحديث ملف **قوى** + الالتزام بنطاقات السعودة
- [ ] عقود عمل رسمية (الموظفون + الشركاء العاملون)
- [ ] توثيق عقد الإيجار على نظام **إيجار**

---

## 🟡 P1 — أسبوعين (8 – 14 مايو)

### `solar-rfq` — عروض الطاقة الشمسية لـ customer-002

> 🔗 راجع [`../projects/solar-rfq-2026-05.md`](../projects/solar-rfq-2026-05.md)

- [ ] البحث عن 3-5 شركات NRRC-licensed في الغربية
- [ ] إرسال RFQ + Comparison Sheet
- [ ] متابعة استلام العروض (مهلة 14 يوم)
- [ ] جدولة زيارات ميدانية
- [ ] اختيار شريك + توقيع Subcontractor Agreement (10-15% commission + API access)

### `master-image` — Pi5 v1.0

- [ ] أخذ Master Image من customer-002 بعد الإكمال
- [ ] رفع Google Drive + External SSD
- [ ] سكربت `customize-pi.sh` لتخصيص hostname + secrets
- [ ] قالب `templates/zone-template.yaml`

### `n8n` — إكمال البنية

- [ ] MQTT credential
- [ ] أول Execute Workflow E2E (Mosquitto → n8n → PostgreSQL)
- [ ] Schema migrations لـ `sensor_readings` hypertable
- [ ] PostgreSQL backups → Google Drive يومياً

### `customer-004` — فرصة بندر بن لادن

> 🔗 راجع [`../customers/004-binladen.md`](../customers/004-binladen.md)

- [ ] إعداد عرض احترافي PDF (محمية 7×8 + استنبات شعير + طاقة شمسية 30ك.و)
- [ ] طلب دفعة دراسة/تصميم لاختبار الالتزام
- [ ] جدولة زيارة المقر

### `partnership-kamal` — اتفاقية مكتوبة

> 🔗 راجع [`../partnerships/kamal-shajri.md`](../partnerships/kamal-shajri.md)

- [ ] صياغة الاتفاقية: عمولة إحالة 10-15% + أجور تركيب منفصلة + بند عدم تجاوز
- [ ] توقيع قبل بدء أي مشروع تنفيذي مشترك (خاصة بن لادن)

### `qoyod` — تحول النظام المحاسبي

> 🔗 قرار: اعتماد Qoyod كنظام يومي (راجع `future-system` events)

- [ ] فتح حساب Qoyod (~99 ريال/شهر)
- [ ] ربط بنك الراجحي للأعمال + ZATCA Phase 2
- [ ] تأهيل عبدالله: تدريب على إدخال الفواتير يومياً
- [ ] جدولة مراجعة شهرية مع سعيد

---

## 🟢 P2 — مجدول لـ 2026-05-16 (AI Daily Phase 2)

### `ai-daily-routine` — الانتقال إلى n8n على CM5

> 🔗 راجع [`../ai-daily/README.md`](../ai-daily/README.md) قسم prompt الفلترة

- [ ] مراجعة تجربة الأسبوعين (2026-05-02 → 2026-05-15)
- [ ] تصميم n8n workflow على CM5:
  - RSS Aggregator node (5–7 مصادر)
  - Claude API node (Sonnet 4.6) للفلترة بالعربي
  - Telegram node لإرسال الموجز على @igarden_sa_bot
  - Google Drive node للأرشفة
- [ ] إضافة معايير الفلترة الشخصية (مبنية على بيانات الأسبوعين)

---

## 🟢 P2 — 22 مايو → 5 يونيو (MMP)

> Minimum Marketable Product — 3 features في 15 يوم عمل
> 🔗 راجع `mmp` في events.md + [`../decisions/2026-04-30-strategy-pivot.md`](../decisions/2026-04-30-strategy-pivot.md)

### `mmp-feature-1` — Water Compliance Report PDF (5 أيام)

- [ ] PDF template (مبني على dashboard.html)
- [ ] n8n workflow: PostgreSQL → KPIs → PDF
- [ ] إرسال تلقائي Telegram + Email
- [ ] اختبار على بيانات customer-002 + توقيع SHA256

### `mmp-feature-2` — Threshold Alerts + Sensor Log (3 أيام)

- [ ] تعريف 12 threshold (pH, EC, TDS, ...)
- [ ] جدول `compliance_events` في PostgreSQL
- [ ] Telegram bot: "آخر تنبيه" + "تقرير اليوم"

### `mmp-feature-3` — Saudi GAP Pre-Audit Checklist (7 أيام)

- [ ] دراسة معايير سعودي جاب الـ 14
- [ ] Dashboard تفاعلي على Vercel
- [ ] محتوى لكل بند (شرح + خطوات + تكلفة)

---

## 🔵 P3 — يونيو (التموضع الرسمي + التسويق)

### `mewa-positioning`

- [ ] تسجيل iGarden في منصة نما
- [ ] لقاء فرع MEWA الغربية
- [ ] استفسار صندوق التنمية الزراعية (اعتماد المورّدين)
- [ ] تسجيل في منشآت

### `marketing`

- [ ] رفع Case Study #1 (customer-002) على igarden.sa
- [ ] LinkedIn: 4 منشورات أسبوعية
- [ ] التقدم لهاكاثونات/مسابقات زراعة ذكية

### `ai-daily-routine` — التطوير المتقدم

- [ ] PR تلقائي على repo `igarden-kb` للعناصر القابلة للتنفيذ
- [ ] mini-dashboard على `igarden.sa/internal/ai-radar`

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
