# 📦 iGarden HA Stack — خط المنتج التشغيلي الحالي

> **آخر تحديث:** 2026-04-27
> **الحالة:** ✅ المنتج التجاري الفعلي — مُجرَّب في الميدان
> **التصنيف:** المعمارية المرحلة 1 (HA + ESP32 على Pi 5)

---

## 📌 الملخص

**iGarden HA Stack** هو خط المنتج الذي يُسلَّم فعلياً للعملاء حالياً. يعتمد على **Home Assistant Container** على Raspberry Pi 5، مع ESP32 + ESPHome للحساسات والريليهات. هذا الخط هو ما يضمن سرعة النشر (3-5 أيام لكل عميل) ويستفيد من مجتمع HA الضخم.

> هذه الفلسفة (HA كأساس حالي مع Pause لـ FastAPI) هي **القرار المعماري المعتمد بعد نقاش 2026-04-27**. للسياق الكامل والمقارنة بين الخيارات راجع [old/conversations/2026-04-27/02-architecture-evolution.md](../old/conversations/2026-04-27/02-architecture-evolution.md).

---

## 🏗️ النمط المعماري (لكل عميل)

```
┌──────────────────────────────────────────────┐
│  Pi 5 (Hub التحكم)                           │
│  ├── Pi OS Lite 64-bit                       │
│  ├── Docker + docker-compose                 │
│  ├── Home Assistant Container                │
│  │   ├── ESPHome (sensors firmware)          │
│  │   ├── Mosquitto MQTT                      │
│  │   ├── Dashboard "iGarden" (عربي)          │
│  │   └── iGarden Theme (Forest + Lime)       │
│  ├── Chromium Kiosk (cage/Wayland)           │
│  ├── UFW + Fail2ban + SSH key                │
│  └── Daily backups                           │
└──────────────────────────────────────────────┘
                    │
              WiFi + MQTT
                    │
        ┌───────────┴───────────┐
        ▼           ▼           ▼
     ESP32       ESP32       ESP32
     Tank 1     Tank 2     Tank N
     (pH+EC+T° + Relays + Dosers)
```

### الـ Sensor Pattern القياسي (لكل ESP32):
- **ADS1115** (16-bit ADC) للـ pH analog
- **DS18B20** (water temperature) عبر 1-Wire
- **TDS/EC** (UART أو analog)
- **Level sensor** (لكل خزان)
- **8× Relays** (مضخات، محابس، dosers)

> 🔌 مثال GPIO mapping كامل في [infrastructure/esp32-ghulah-tank.md](../infrastructure/esp32-ghulah-tank.md).

---

## 🚀 العملاء الذين يطبّقون هذا الخط

| العميل | الحالة | الجهاز |
|---|---|---|
| 001 — خميس مشيط | ✅ مكتمل | [Pi 5 خميس مشيط](../infrastructure/pi5-customer1-khamis.md) |
| 002 — الغولاء | 🟡 80% | [Pi 5 الغولاء](../infrastructure/pi5-customer2-ghulah.md) + [ESP32 igarden-tank](../infrastructure/esp32-ghulah-tank.md) |
| 003 — الأحساء | ⏳ مخطط | [Master Hub الأحساء](../infrastructure/ahsa-master-hub.md) (Pi 5 + 4× ESP32) |

---

## ✅ مزايا هذا الخط

1. ✅ **مُجرَّب في الميدان** — العميل 001 شغّال شهرين بدون مشاكل
2. ✅ **سرعة النشر** — 3-5 أيام لكل عميل
3. ✅ **مجتمع ضخم** — 250K+ مستخدم نشط لـ HA
4. ✅ **2,000+ integration جاهزة**
5. ✅ **Mobile App جاهز** (HA Companion)
6. ✅ **Lovelace Dashboards** قابلة للتخصيص بـ YAML
7. ✅ **MQTT broker مدمج**
8. ✅ **العقد الحالي يضغط** — 30 يوم، لا وقت لإعادة بناء

## ⚠️ القيود المعروفة

- ⚠️ **HAOS لا يدعم Chromium Kiosk** → استخدم Pi OS + Docker بدلاً من HAOS
- ⚠️ **SD cards عادية تتلف** مع الكتابة المستمرة → خطّط لـ NVMe SSD مستقبلاً
- ⚠️ **Wayland (cage) لا يلتقط input** من USB → مشكلة معروفة في الكيوسك (راجع [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md))
- ⚠️ **Branding محدود** ⭐⭐⭐ (مع Theme فقط، ليس 100% iGarden)
- ⚠️ **Maintenance** ⭐⭐⭐⭐ (community-driven، أفضل من FastAPI)

---

## 🎯 الفلسفة

> **"اختر الأداة المناسبة للمهمة المناسبة."**

iGarden HA Stack هو **الأولوية التشغيلية الحالية**. خط [Smart OS Native](./smart-os-native.md) في وضع Pause مؤقت ويُستكمل بعد 5-10 عملاء على هذا الخط.

---

## 📐 مقارنة بخطوط iGarden الأخرى

| المعيار | HA Stack (هذا) | [iGarden Hub](./igarden-hub.md) | [Smart OS Native](./smart-os-native.md) |
|---|---|---|---|
| **سرعة النشر** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| **التخصيص** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Maintenance** | ⭐⭐⭐⭐ (community) | ⭐⭐⭐ | ⭐ (يدوي) |
| **Branding** | ⭐⭐⭐ (مع Theme) | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **التكلفة الزمنية** | منخفضة | متوسطة | عالية جداً |
| **العميل الراضي اليوم** | ✅ | ❌ | ❌ |

---

## 🔗 ملفات ذات صلة

- [iGarden Hub (CM5 Backend)](./igarden-hub.md)
- [iGarden Smart OS Native (FastAPI)](./smart-os-native.md)
- [iGarden Smart OS Demo (تسويقي)](./demo-igarden-sa.md)
- [العملاء](../customers/)
- [مشروع Master Image](../projects/master-image.md)

---

🌱 **iGarden — ازرع بذكاء**
