# 🚧 مشروع: Master Image لـ Pi 5

> **آخر تحديث:** 2026-04-27
> **الحالة:** ⏳ معتمد، ينتظر إكمال [002](./002-ghulah-completion.md) أولاً
> **الأولوية:** 🟡 P1 — هذا الشهر

---

## 📌 الهدف

عند إكمال 100% من تركيب [العميل 002 (الغولاء)](../customers/002-ghulah-lettuce.md)، أخذ **img كامل من SD card** ليصبح Master Image قابل للنسخ على كل عميل قادم.

**الفائدة:** كل عميل جديد يأخذ **30 دقيقة** بدلاً من **3 أيام** للنشر.

---

## 🛠️ الإجراء المخطط

```bash
# Master Image لكل عميل قادم
sudo dd if=/dev/sdc of=igarden-master-v1-2026-05-XX.img bs=4M
```

---

## 📋 المتطلبات

- ✅ نظام عميل 002 مكتمل 100% — راجع [002-ghulah-completion.md](./002-ghulah-completion.md)
- ✅ NVMe HAT + SSD مفضّل (للموثوقية طويلة المدى)
- ✅ مساحة تخزين على [HP EliteBook](../infrastructure/hp-elitebook-ali.md) للاحتفاظ بالـ image

---

## 🎯 الفائدة الاستراتيجية

- 🔁 سرعة نشر العميل 003 (الأحساء) وما بعده
- 💼 إعداد **Customer Config Layer** لتسهيل النسخ بين العملاء
- 📈 يمكّن iGarden من قبول 5-10 عملاء على [HA Stack](../products/ha-stack-product.md) خلال شهور بدلاً من سنة

---

## 🔗 ملفات ذات صلة

- [مشروع إكمال 002 (المتطلب)](./002-ghulah-completion.md)
- [مشروع تركيب الأحساء (المستفيد)](./003-ahsa-installation.md)
- [خط منتج HA Stack](../products/ha-stack-product.md)
- [Pi 5 الغولاء (مصدر الـ image)](../infrastructure/pi5-customer2-ghulah.md)

---

🌱 **iGarden — ازرع بذكاء**
