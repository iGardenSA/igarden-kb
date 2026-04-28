# 🥬 العميل 002 — محمية الخس العائم (الغولاء)

> **التاريخ:** 2026-04-27 (توثيق محدّث)
> **النوع:** عميل قيد الإكمال (80%)
> **الحالة:** 🟡 قيد التركيب — يحتاج إكمال 20% المتبقية

---

## 📌 الملخص

محمية لزراعة الخس العائم (Floating Lettuce / DWC — Deep Water Culture)، تستخدم نظام iGarden HA Stack للتحكم في الخزان (pH/EC/حرارة/مضخات/دوسرات).

---

## 👤 معلومات العميل

| البند | القيمة |
|---|---|
| **الموقع** | الغولاء (شمال جدة) |
| **نوع الزراعة** | محمية خس عائم (DWC) |
| **القرب من iGarden** | قريب — يسهل الزيارات الميدانية |

---

## 🔧 المعمارية والبنية التحتية

النظام يعتمد على **iGarden HA Stack** (Pi 5 + HA Container + ESP32 igarden-tank).

- **Pi 5 (Hub التحكم):** راجع [infrastructure/pi5-customer2-ghulah.md](../infrastructure/pi5-customer2-ghulah.md)
- **ESP32 igarden-tank:** راجع [infrastructure/esp32-ghulah-tank.md](../infrastructure/esp32-ghulah-tank.md)
- **خط المنتج:** راجع [products/ha-stack-product.md](../products/ha-stack-product.md)

---

## 🎯 الدور الاستراتيجي

- 🔁 **النظام المرجع** للعميل 003 (الأحساء) — نفس المعمارية بحجم أكبر
- 🧪 **مختبر الدروس** — أيّ مشكلة هنا = ستتكرر في الأحساء، لذا يجب الإغلاق قبل البدء بالأحساء
- 💾 **مصدر Master Image** — عند 100% يؤخذ img كامل لإعادة الاستخدام (راجع [projects/master-image.md](../projects/master-image.md))

---

## 📋 حالة المشروع

تتبَّع حالة الإكمال (المعايرة، حل TDS UART، شاشة اللمس، توسيع SD، إلخ.) في:

- [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md)

---

## 🔗 ملفات ذات صلة

- [مشروع إكمال 002](../projects/002-ghulah-completion.md)
- [Pi 5 الغولاء](../infrastructure/pi5-customer2-ghulah.md)
- [ESP32 igarden-tank](../infrastructure/esp32-ghulah-tank.md)
- [خط منتج HA Stack](../products/ha-stack-product.md)
- [العميل 003 — الأحساء](./003-ahsa-rayana.md)

---

🌱 **iGarden — ازرع بذكاء**
