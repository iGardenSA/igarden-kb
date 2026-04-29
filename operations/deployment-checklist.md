# ✅ Deployment Checklist — تركيب ميداني

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** Operations Checklist
> **الاستخدام:** قبل / أثناء / بعد كل تركيب ميداني

---

## 📌 الملخص

قائمة عملية مُختصرة (printable) للتأكد من جاهزية كل تركيب. تُستخدم بالتوازي مع [`customer-onboarding.md`](./customer-onboarding.md) (الذي يشرح "ماذا" و"لماذا"). هذا الملف هو "متى تُؤشِّر".

---

## 📦 قبل السفر — في عسفان (T-3 أيام)

### الأجهزة
- [ ] Master Hub Pi 5 جاهز (Master Image flashed)
- [ ] Hostname مخصّص: `igarden-{customer-slug}`
- [ ] Secrets محدّثة (API key + OTA + MQTT prefix)
- [ ] HA Theme + Lovelace dashboards مخصّصة للعميل
- [ ] ESP32(s) مفلوشة بـ ESPHome firmware (واحد لكل zone)
- [ ] جميع الـ probes معايرة مبدئياً في عسفان
- [ ] قطع غيار: 1× ESP32 + 1× pH probe + 1× sensor + 1× SD

### الاختبار قبل الشحن
- [ ] الـ Pi يقوم خلال ≤ 60 ثانية
- [ ] HA يفتح على `http://<pi-ip>:8123`
- [ ] جميع MQTT topics تستقبل بيانات
- [ ] جميع الـ relays تستجيب من Lovelace
- [ ] اختبار 24 ساعة بدون reboot/hang
- [ ] HA Companion App مربوطة باختبار

### الوثائق
- [ ] Operating Manual بالعربية مطبوع (30-40 صفحة)
- [ ] Wiring Diagram احترافي مطبوع
- [ ] نسخة من العقد + ملاحق
- [ ] أرقام دعم + WhatsApp مباشرة على الغلاف

### الشحن
- [ ] الأجهزة معبّأة في صناديق مبطّنة
- [ ] UPS منفصل (لا يُشحن مع البطاريات داخل Pi case)
- [ ] Flash drive فيه نسخة احتياطية من SSH keys + secrets
- [ ] قائمة محتويات الشحنة مكتوبة + موقّعة

---

## 🚛 يوم الوصول — على الموقع

### قبل البدء بالعمل
- [ ] جولة على الموقع مع العميل
- [ ] تأكيد جاهزية: تسوية الأرض ✓ / كهرباء ✓ / ماء ✓ / WiFi ✓
- [ ] قياس قوة WiFi في كل zone (يجب ≥ -70 dBm)
- [ ] صور قبل البدء (للأرشيف + Marketing)

### تركيب Master Hub
- [ ] الموقع: غرفة تحكم مكيّفة + بعيدة عن الرطوبة
- [ ] UPS موصول قبل الـ Pi
- [ ] الشاشة 7" مثبّتة بزاوية 90° (قابلة للتعديل)
- [ ] الـ Pi داخل صندوق IP54 على الأقل
- [ ] الكابلات مرتبة بـ cable ties + label

### تركيب ESP32(s) لكل zone
- [ ] الصندوق IP65 (المواقع الرطبة)
- [ ] ESP32 + ADS1115 على PCB (لا breadboard في الميدان)
- [ ] الكابلات: signal + power منفصلة (مسافة ≥ 5 سم)
- [ ] Earth ground متّصل بالـ chassis
- [ ] Probes موضوعة في الخزان بثبات (لا تتأرجح)

---

## ⚙️ التشغيل الأول

### الشبكة
- [ ] Pi متصل بـ WiFi المحلي
- [ ] DHCP reservation للـ Pi (IP ثابت)
- [ ] جميع ESP32 ظاهرة في HA → Devices
- [ ] MQTT broker شغّال (`docker logs mosquitto`)

### الحساسات
- [ ] **pH** يقرأ في النطاق 0-14 (ليس NaN ولا 0.0 ثابت)
- [ ] **EC/TDS** يقرأ في النطاق المعقول لمحلول Hoagland
- [ ] **Water temp** يطابق ميزان حرارة يدوي ±0.5°C
- [ ] **Level sensor** يستجيب لتغيّر مستوى الماء

### Relays
- [ ] كل relay يُشغَّل ويُطفأ من Lovelace (8 × zone)
- [ ] Doser pumps تضخّ بكميات صحيحة
- [ ] Mixer pump يدور في الاتجاه الصحيح
- [ ] Solenoid valve يفتح/يغلق
- [ ] Submersible pump 220V يعمل بدون vibration غير طبيعي

### الأمان
- [ ] **Kill Switch** (relay master) يقطع كل الطاقة
- [ ] Fuse box حسب الـ rated current
- [ ] Earth leakage protector للـ 220V

---

## 🎯 المعايرة (نصف يوم)

### pH
- [ ] محلول pH 7.0 → سجّل الجهد (V₇)
- [ ] محلول pH 4.0 → سجّل الجهد (V₄)
- [ ] حدّث `calibrate_linear` في YAML
- [ ] OTA flash للـ ESP32
- [ ] إعادة الاختبار بنفس المحاليل (يجب يقرأ ±0.1)

### EC
- [ ] محلول 1.413 mS/cm
- [ ] تأكيد القراءة ±0.05

### Doser pumps
- [ ] قياس مدة الـ pulse لـ 1ml (لكل pump)
- [ ] حفظ في `configuration.yaml`

### Level sensors
- [ ] خزان فارغ → سجّل القيمة
- [ ] خزان ممتلئ → سجّل القيمة
- [ ] حدّث الـ scale

---

## 🤖 Automations

- [ ] Scenario: "pH أقل من 5.5 → ضخ pH Up لمدة X ثانية"
- [ ] Scenario: "EC أقل من 1.0 → ضخ Nutrient A+B"
- [ ] Scenario: "Tank level < 30% → فتح المحبس + إنذار"
- [ ] Notification: HA Companion يعمل
- [ ] Notification: email/SMS (اختياري)
- [ ] **Kill Switch** يُفعَّل عند: انقطاع MQTT > 5 دقائق

---

## 🌐 التحكم عن بعد

- [ ] **Tailscale** مثبّت + مرتبط بحساب iGarden
  ```bash
  curl -fsSL https://tailscale.com/install.sh | sh
  sudo tailscale up
  ```
- [ ] الـ Pi ظاهر في Tailscale admin console
- [ ] اختبار الوصول من شبكة 4G خارجية
- [ ] HA Companion App على هاتف العميل عبر Tailscale

---

## 👨‍🏫 التدريب + التسليم

### التدريب (1-2 ساعة)
- [ ] جولة على Lovelace dashboard
- [ ] كيف يقرأ بيانات الحساسات
- [ ] كيف يُشغّل/يُطفئ relays يدوياً
- [ ] كيف يقرأ الـ logs / notifications
- [ ] **ماذا يفعل عند الطوارئ** (kill switch + اتصال بـ iGarden)
- [ ] HA Companion على هاتف العميل + اختبار

### التسليم
- [ ] نموذج تسليم رسمي موقّع
- [ ] استلام دفعة 10% النهائية
- [ ] صور + فيديو 360° للنظام
- [ ] فيديو شهادة عميل قصير (للـ Marketing)
- [ ] تسليم: مفاتيح SSH (مغلّفة) + كلمات السر للعميل

---

## 📞 ما بعد التسليم — أول 7 أيام

- [ ] اتصال يومي صباحي (5 دقائق)
- [ ] مراقبة Tailscale dashboard
- [ ] مراجعة بيانات الحساسات يومياً
- [ ] تسجيل أي تنبيه أو سلوك غير متوقّع

---

## 📞 أول 30 يوم — ضمن صيانة الـ 60 يوم

- [ ] زيارة موقعية واحدة
- [ ] ضبط scenarios بناءً على بيانات حقيقية
- [ ] تحديث Operating Manual إذا ظهر شيء جديد
- [ ] feedback مكتوب من العميل
- [ ] اقتراح عقد صيانة شهري

---

## 🚨 ما يجب **عدم** نسيانه

| الخطأ | النتيجة |
|---|---|
| تركيب بدون UPS | bricked Pi عند انقطاع كهرباء |
| pH probe بدون معايرة | بيانات خاطئة → أتمتة خاطئة → موت محصول |
| MQTT بدون auth | أيّ شخص في الشبكة يتحكم |
| SSH password auth مفعّل | اختراق من 4G |
| لا backup للـ secrets | فقدان الوصول لـ ESP32 → reflash يدوي |
| لا Tailscale | لا دعم عن بعد → سفر متكرّر |

---

## 🔗 ملفات ذات صلة

- [دليل Onboarding الكامل](./customer-onboarding.md)
- [Master Image Strategy](./master-image-strategy.md)
- [Pi 5 العميل 002 — البنية المرجعية](../infrastructure/pi5-customer2-ghulah.md)

---

🌱 **iGarden — ازرع بذكاء**
