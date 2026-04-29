# 🚀 دليل تركيب عميل جديد على HA Container

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** Operations Playbook
> **المسؤول:** علي + الفريق الفني
> **الإصدار المرجعي:** بناءً على عميل 002 (الغولاء)

---

## 📌 الملخص

دليل **من 0 إلى 100** لتركيب عميل جديد على معمارية HA Container. يفترض استخدام Master Image (راجع [`master-image-strategy.md`](./master-image-strategy.md)) لاختصار الزمن من 3 أيام إلى ~30 دقيقة Pi setup.

---

## 🗺️ الـ Workflow الكامل (4 أسابيع نموذجياً)

```
الأسبوع 1: التحضير + شراء الأجهزة
الأسبوع 2: التجهيز في عسفان + اختبار 48 ساعة
الأسبوع 3: التركيب الميداني
الأسبوع 4: المعايرة + التدريب + التسليم
```

---

## 📋 المرحلة 0: قبل التوقيع

### تقييم العميل
- [ ] زيارة موقعية أو مكالمة فيديو
- [ ] قياس المساحة + عدد المناطق (zones)
- [ ] تأكيد توفّر: كهرباء + ماء + WiFi مستقر
- [ ] فهم نوع الزراعة (DWC / Dutch Bucket / NFT / ...)

### العقد
- [ ] صياغة العقد (راجع نموذج عميل 003 كمرجع)
- [ ] BOM (Bill of Materials) مفصّل + سعر
- [ ] ضمانات: 24 شهر للنظام، 12 شهر للتحكم، 60 يوم صيانة
- [ ] جدول دفعات: 40% / 25% / 25% / 10%
- [ ] التزامات العميل مكتوبة (تسوية أرض، WiFi، إلخ)

---

## 📦 المرحلة 1: التحضير (الأسبوع 1)

### شراء الأجهزة
استخدم BOM template — تكييف حسب عدد الـ zones.

**Master Hub (واحد لكل عميل):**
- [ ] Pi 5 (8GB RAM)
- [ ] 64GB SD card (Class 10) **أو** NVMe SSD HAT + SSD
- [ ] 7" DSI Touch Screen
- [ ] UPS (لحماية من انقطاع الكهرباء)
- [ ] Industrial enclosure (IP65 إذا الموقع رطب)

**لكل Zone:**
- [ ] ESP32 DevKit مع Terminal Block
- [ ] ADS1115 (16-bit ADC)
- [ ] DS18B20 (water temp)
- [ ] pH probe + lab board (Atlas / LM358)
- [ ] EC/TDS probe (UART أو analog)
- [ ] Level Sensor (0-3.3V version!)
- [ ] Doser pumps × 3 (12V)
- [ ] Mixer pump × 1 (12V)
- [ ] Solenoid valve × 1 (24V)
- [ ] Submersible pump (220V) — يختار العميل القدرة
- [ ] Relay module 8-channel
- [ ] Power supplies (12V + 24V)
- [ ] Wiring + cable glands

### التحضير الرقمي
- [ ] إنشاء ملف عميل في `customers/00X-name.md`
- [ ] حجز IP محلي للـ Pi (DHCP reservation أو static)
- [ ] إعداد ESPHome `secrets.yaml` خاص بالعميل (api_key + ota_password جديدة)
- [ ] تخصيص MQTT prefix → `igarden/{customer-slug}/`
- [ ] إعداد Lovelace dashboard template للعميل

---

## 🛠️ المرحلة 2: التجهيز في عسفان (الأسبوع 2)

### Pi 5 — من Master Image
- [ ] Flash Master Image على SD card (راجع [`master-image-strategy.md`](./master-image-strategy.md))
- [ ] أول boot:
  ```bash
  sudo raspi-config        # تغيير hostname → igarden-{customer}
  sudo systemctl restart docker
  cd ~/igarden && docker compose up -d
  ```
- [ ] تخصيص HA configuration للعميل (zones + entities)
- [ ] استيراد ESPHome YAML للـ ESP32(s)
- [ ] اختبار Lovelace dashboard

### ESP32(s) — لكل zone
- [ ] Flash ESPHome firmware (`igarden-{customer}-tank-{N}.yaml`)
- [ ] اختبار اتصال MQTT
- [ ] اختبار قراءة كل sensor فردياً
- [ ] اختبار كل relay فردياً (نقر يدوي من Lovelace)

### اختبار 48 ساعة متواصل
- [ ] تشغيل النظام كاملاً في عسفان
- [ ] محاكاة سيناريوهات: pH خارج النطاق، انقطاع MQTT، إعادة تشغيل Pi
- [ ] التحقق من: لا فقدان بيانات، لا hang، الـ dashboard لا يتجمد

### الحزم للشحن
- [ ] قطع غيار احتياطية (1 ESP32، 1 pH probe، 1 sensor)
- [ ] مفاتيح SSH على flash drive (نسخة احتياطية)
- [ ] طباعة Operating Manual (30-40 صفحة عربي)
- [ ] طباعة Wiring Diagram احترافي

---

## 🚛 المرحلة 3: التركيب الميداني (الأسبوع 3)

### قبل السفر
- [ ] تأكيد جاهزية الموقع (تسوية، كهرباء، ماء، WiFi)
- [ ] حجز تذاكر / ترتيب نقل
- [ ] إخطار العميل بتاريخ الوصول

### في الموقع
- [ ] الأعمال الإنشائية (بالتوازي مع الفريق المحلي)
- [ ] تركيب أحواض / خطوط / خزانات
- [ ] تركيب Master Hub في غرفة التحكم (UPS + شاشة)
- [ ] تركيب ESP32(s) لكل zone في صناديق IP65
- [ ] تمديد الكابلات (signal + power منفصلة)
- [ ] توصيل Pi بـ WiFi المحلي + اختبار الاتصال
- [ ] التأكد من قراءة جميع الحساسات في HA

---

## 🎯 المرحلة 4: المعايرة + التسليم (الأسبوع 4)

### المعايرة
- [ ] **pH probe** بمحاليل قياسية:
  - pH 7.0 → سجّل الجهد (V₇)
  - pH 4.0 → سجّل الجهد (V₄)
  - حدّث المعادلة في ESPHome YAML:
    ```yaml
    filters:
      - calibrate_linear:
          - !lambda 'return V₇;' -> 7.0
          - !lambda 'return V₄;' -> 4.0
    ```
- [ ] **EC probe** بمحلول 1.413 mS/cm
- [ ] **Doser pumps** — مدّة الـ pulse لـ 1ml (لكل pump)
- [ ] **Level sensors** — full / empty calibration

### Automations
- [ ] Scenarios أساسية (raise pH، EC threshold، tank refill)
- [ ] Notifications (HA Companion + email/SMS اختياري)
- [ ] Kill Switch (إيقاف كل الـ pumps عند خطر)

### التحكم عن بعد
- [ ] **Tailscale** على Pi (مجاني للـ personal)
  ```bash
  curl -fsSL https://tailscale.com/install.sh | sh
  sudo tailscale up
  ```
- [ ] إضافة الـ Pi لشبكة Tailscale الخاصة بـ iGarden
- [ ] اختبار الوصول من خارج الموقع

### التدريب
- [ ] جلسة تدريب 1-2 ساعة مع المشغّل المحلي
- [ ] تثبيت HA Companion على هاتف العميل
- [ ] مراجعة Operating Manual معه
- [ ] أرقام طوارئ + نموذج تذكرة دعم

### التسليم
- [ ] checklist كامل (راجع [`deployment-checklist.md`](./deployment-checklist.md))
- [ ] توقيع نموذج التسليم النهائي
- [ ] صور + فيديو للنظام (للـ portfolio + LinkedIn)
- [ ] طلب تقييم شفهي مصوّر (للـ marketing)

---

## 📞 ما بعد التسليم

### أول أسبوع (دعم مكثّف)
- [ ] الاتصال يومياً (التأكد من راحة العميل)
- [ ] مراقبة عن بعد عبر Tailscale
- [ ] حل أي مشكلة فوراً

### أول شهر (ضمن صيانة الـ 60 يوم)
- [ ] زيارة موقعية واحدة على الأقل
- [ ] مراجعة بيانات الحساسات + ضبط scenarios
- [ ] جمع feedback مكتوب من العميل

### بعد 60 يوم
- [ ] عرض **عقد صيانة شهري** (300-500 ريال)
- [ ] استخدام العميل كـ **Reference Site** لعملاء جدد
- [ ] case study للموقع + LinkedIn

---

## 🎁 معايير الجودة لكل تركيب

| المعيار | القياس |
|---|---|
| زمن التركيب الكلي | ≤ 4 أسابيع |
| Uptime أوّل شهر | ≥ 99% |
| دقة قراءة pH | ±0.1 |
| دقة قراءة EC | ±0.05 mS/cm |
| استجابة العميل عند الطوارئ | ≤ 4 ساعات |

---

## 🔗 ملفات ذات صلة

- [استراتيجية Master Image](./master-image-strategy.md)
- [Deployment Checklist](./deployment-checklist.md)
- [Pi 5 العميل 002 — البنية المرجعية](../infrastructure/pi5-customer2-ghulah.md)
- [قرار HA Container](../architecture/ha-vs-fastapi-decision.md)
- [العميل 003 — مثال على عقد كبير](../customers/003-ahsa-rayana.md)

---

🌱 **iGarden — ازرع بذكاء**
