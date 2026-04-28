# 🖥️ Pi 5 — العميل 002 (الغولاء)

> **آخر تحديث:** 2026-04-27
> **الحالة:** 🟡 80% منجز — يحتاج إكمال (راجع [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md))
> **الموقع الفعلي:** محمية الخس العائم، الغولاء (شمال جدة)

---

## 📌 الدور

**Hub التحكم** لمحمية الخس العائم. يشغّل HA Container ويتحكّم بـ ESP32 igarden-tank عبر MQTT (راجع [esp32-ghulah-tank.md](./esp32-ghulah-tank.md)).

---

## 🔧 المواصفات التقنية

| البند | القيمة |
|---|---|
| **اللوحة** | Raspberry Pi 5 |
| **IP** | 192.168.8.235 (سابقاً .209 ثم .132) |
| **Hostname** | raspberrypi |
| **WiFi SSID** | IGARDEN_EXT |
| **OS** | Pi OS Lite 64-bit (Debian 13 Trixie) |
| **Container Runtime** | Docker + docker-compose |
| **مستخدم SSH** | `i` (مع SSH key بدون كلمة مرور) |
| **SD Card** | 16GB حالياً (ممتلئة 99% — مهمة توسيع لـ 64GB في [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md)) |

---

## 🐳 الـ Stack المشغَّل

```
Pi OS Lite
├── Docker + docker-compose
├── Home Assistant Container
│   ├── ESPHome (igarden-tank)
│   ├── Mosquitto MQTT
│   ├── Dashboard "iGarden" (عربي)
│   └── iGarden Theme (Forest + Lime)
├── Chromium Kiosk (cage/Wayland)
├── UFW + Fail2ban + SSH key
└── Daily backups (~/backups/)
```

> ⚠️ **مشكلة معروفة:** Wayland (cage) لا يلتقط input من الكيبورد/الماوس USB في Kiosk mode — تتبَّع الحل في [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md).

---

## 📦 خط المنتج

هذا الجهاز يطبّق **iGarden HA Stack** — راجع [products/ha-stack-product.md](../products/ha-stack-product.md) للنمط المعماري المشترك.

---

## 💾 الدور كـ Master Image

عند إكمال 100%، يؤخذ img كامل من SD ليصبح Master Image لكل عميل قادم. التفاصيل في [projects/master-image.md](../projects/master-image.md).

---

## 🔗 ملفات ذات صلة

- [العميل 002 (الغولاء)](../customers/002-ghulah-lettuce.md)
- [ESP32 igarden-tank](./esp32-ghulah-tank.md)
- [مشروع إكمال 002](../projects/002-ghulah-completion.md)
- [مشروع Master Image](../projects/master-image.md)
- [خط منتج HA Stack](../products/ha-stack-product.md)

---

🌱 **iGarden — ازرع بذكاء**
