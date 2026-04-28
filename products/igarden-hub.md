# 📦 iGarden Hub — Backend مركزي (CM5 Stack)

> **آخر تحديث:** 2026-04-27
> **الحالة:** 🟡 R&D — وضع "Pause خفيف"، يعمل في الخلفية
> **التصنيف:** المعمارية المرحلة 2

---

## 📌 الملخص

**iGarden Hub** هو خط Backend مركزي لإدارة بيانات حساسات متعددة العملاء وأتمتة workflows. مرشّح ليكون الأساس التقني لـ `app.igarden.sa` (Customer Portal) مستقبلاً.

> للسياق المعماري الكامل (HA → Hub → FastAPI كـ 3 مراحل تطوّر) راجع [old/conversations/2026-04-27/02-architecture-evolution.md](../old/conversations/2026-04-27/02-architecture-evolution.md).

---

## 🐳 الـ Stack

| الخدمة | الدور | طريقة التشغيل |
|---|---|---|
| **n8n** | Workflow Automation | Docker |
| **PostgreSQL + TimescaleDB** | تخزين بيانات الحساسات الزمنية | Docker |
| **Portainer** | Container Management UI | Docker |
| **Mosquitto MQTT** | Broker للحساسات | systemd (ليس Docker) |

---

## 🖥️ الجهاز المستضيف

النشر الحالي على **CM5 في عسفان**: راجع [infrastructure/cm5-osfan-hub.md](../infrastructure/cm5-osfan-hub.md) للتفاصيل التشغيلية.

---

## 🎯 الدور الاستراتيجي

- **R&D Lab** — اختبار البنية التحتية للـ multi-tenant
- **Future Cloud Backend** — أساس `app.igarden.sa` لاحقاً
- **محاكاة 24/7** — workflow simulator يحاكي 4 حساسات كل 5 دقائق لاختبار scenarios

---

## ⏸️ سبب الـ Pause

- لا قيمة تجارية فورية للعميل المباشر
- العملاء الحاليون يعملون على [HA Stack](./ha-stack-product.md) — لا حاجة لـ Hub لإغلاق العقود الحالية
- الأولوية: إكمال عميل 002 + تركيب 003 قبل العودة لتطوير الـ Hub

---

## 📝 المهام المفتوحة (للاستكمال لاحقاً)

- [ ] إكمال MQTT credential
- [ ] تشغيل أول Execute Workflow
- [ ] دمج بيانات CM5 → `app.igarden.sa` مستقبلاً

---

## 🔗 ملفات ذات صلة

- [CM5 الجهاز المستضيف](../infrastructure/cm5-osfan-hub.md)
- [خط منتج HA Stack (الحالي التشغيلي)](./ha-stack-product.md)
- [iGarden Smart OS Native](./smart-os-native.md)

---

🌱 **iGarden — ازرع بذكاء**
