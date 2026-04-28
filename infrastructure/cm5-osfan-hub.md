# 🖥️ CM5 — iGarden Hub (عسفان)

> **آخر تحديث:** 2026-04-27
> **الحالة:** 🟡 30% منجز — وضع "Pause خفيف" (R&D، ليس أولوية حالية)
> **الموقع الفعلي:** محطة عسفان

---

## 📌 الدور

**Backend مركزي** لإدارة بيانات حساسات متعددة العملاء — بنية تحتية للتحليلات والأتمتة. مرشّح لاحقاً ليكون أساس `app.igarden.sa` (Customer Portal).

---

## 🔧 المواصفات التقنية

| البند | القيمة |
|---|---|
| **اللوحة** | Compute Module 5 (CM5) |
| **IP** | 192.168.8.21 |
| **WiFi SSID** | IGARDEN_EXT |
| **OS** | Pi OS Lite |
| **Container Runtime** | Docker + docker-compose |

---

## 🐳 الـ Stack المشغَّل

النظام يطبّق منتج **iGarden Hub** — راجع [products/igarden-hub.md](../products/igarden-hub.md) للتفاصيل المعمارية الكاملة.

ملخّص الخدمات:
- ✅ n8n (Workflow Automation)
- ✅ PostgreSQL + TimescaleDB
- ✅ Portainer (Container Management)
- ✅ Mosquitto MQTT (systemd، ليس Docker)

### حالة التشغيل (2026-04-27):
- ✅ 4 خدمات Docker شغّالة
- ✅ PostgreSQL credential يعمل
- ✅ Workflow simulator مستورد (محاكاة 4 حساسات كل 5 دقائق)
- ⏳ MQTT credential (لم يكتمل)
- ⏳ Execute Workflow الأول (لم يُنفّذ)

---

## 🎯 الدور الاستراتيجي

- **R&D Lab** — اختبار البنية التحتية
- **Future Cloud Backend** — لاحقاً قد يخدم `app.igarden.sa`
- **محاكاة 24/7** — لاختبار scenarios قبل التطبيق الميداني

---

## 🔗 ملفات ذات صلة

- [منتج iGarden Hub](../products/igarden-hub.md)
- [Pi 5 FastAPI Native (نفس الموقع)](./pi5-fastapi-native.md)

---

🌱 **iGarden — ازرع بذكاء**
