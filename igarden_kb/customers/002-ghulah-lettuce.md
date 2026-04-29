# 🥬 العميل 002 — محمية الخس العائم (الغولاء)

> **التاريخ:** 2026-04-27 (توثيق محدّث)
> **النوع:** عميل قيد الإكمال (80%)
> **الحالة:** 🟡 قيد التركيب — يحتاج إكمال
> **الموقع:** الغولاء، شمال جدة

---

## 📌 الملخص

محمية لزراعة الخس العائم (Floating Lettuce / DWC - Deep Water Culture)، تستخدم نظام Raspberry Pi 5 + ESP32 للتحكم في الخزان (pH/EC/حرارة/مضخات/دوسرات).

**الحالة الحالية (2026-04-27):** 80% منجز — يحتاج إكمال 4 مهام تقنية حرجة.

---

## 👤 معلومات العميل

| البند | القيمة |
|---|---|
| **الموقع** | الغولاء (شمال جدة) |
| **نوع الزراعة** | محمية خس عائم (DWC) |
| **القرب من iGarden** | قريب — يسهل الزيارات الميدانية |

---

## 🔧 المعمارية الكاملة

```
┌─────────────────────────────────────────────────────────────┐
│         محمية الخس العائم — الغولاء                         │
│                                                             │
│  ┌──────────────────────────────────────────────────┐      │
│  │  Raspberry Pi 5 (192.168.8.235)                  │      │
│  │  ├── Pi OS Lite 64-bit (Debian 13 Trixie)        │      │
│  │  ├── Docker + docker-compose                     │      │
│  │  ├── Home Assistant Container                    │      │
│  │  │   ├── ESPHome (igarden-tank)                  │      │
│  │  │   ├── Mosquitto MQTT                          │      │
│  │  │   ├── Dashboard "iGarden" (عربي)              │      │
│  │  │   └── iGarden Theme (Forest + Lime)           │      │
│  │  ├── Chromium Kiosk (cage/Wayland)               │      │
│  │  ├── UFW + Fail2ban + SSH key                    │      │
│  │  └── Daily backups (~/backups/)                  │      │
│  └──────────────────────────────────────────────────┘      │
│                          │                                  │
│                    WiFi + MQTT                              │
│                          │                                  │
│  ┌──────────────────────────────────────────────────┐      │
│  │  ESP32 igarden-tank (192.168.8.137)              │      │
│  │  ├── ESPHome firmware                            │      │
│  │  ├── ADS1115 (pH analog → I2C)                   │      │
│  │  ├── DS18B20 (water temp)                        │      │
│  │  ├── TDS BA.012 (UART — قيد الحل)                │      │
│  │  └── 8× Relays (pumps, valves, dosers)           │      │
│  └──────────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────────────┘
```

---

## ⚙️ التفاصيل التقنية الحرجة

### Network:
| الجهاز | IP | الاسم |
|---|---|---|
| Pi 5 | 192.168.8.235 (سابقاً .209 ثم .132) | raspberrypi |
| ESP32 | 192.168.8.137 | igarden-tank |
| WiFi SSID | IGARDEN_EXT | — |

### مستخدمي SSH:
- **Pi 5:** `i` (مع SSH key بدون كلمة مرور)
- **HP EliteBook:** `ali`

### مفاتيح ESPHome:
```
api encryption: [REDACTED — see password manager]
ota password:   [REDACTED — see password manager]
mqtt prefix:    igarden/tank
mqtt user:      mqtt_user
```

### GPIO Mapping (ESP32):
| GPIO | الوظيفة | الجهاز |
|---|---|---|
| 21 | I2C SDA | ADS1115 |
| 22 | I2C SCL | ADS1115 |
| 4 | 1-Wire | DS18B20 (مع 4.7kΩ pullup) |
| 16 | UART RX | TDS BA.012 TX |
| 17 | UART TX | TDS BA.012 RX |
| 27 | Relay 1 | مضخة ري حوض 1 (220V) |
| 14 | Relay 2 | مضخة ري حوض 2 (220V) |
| 12 | Relay 3 | مضخة الخلط (220V) |
| 13 | Relay 4 | محبس كهربائي (24V) |
| 5 | Relay 5 | Doser A |
| 25 | Relay 6 | Doser B |
| 26 | Relay 7 | Doser C |
| 2 | Relay 8 | Doser pH Down |

**ملاحظة:** Doser B/C نُقلت من 16/17 إلى 25/26 لتجنّب تعارض UART.

### ADS1115 Setup:
- **Address:** 0x48
- **A0:** Po من لوحة pH (Atlas/LM358 board)
- **A1:** احتياطي (TDS انتقل لـ UART)
- **A2:** احتياطي
- **A3:** احتياطي

### Sensors المتصلة:
- ✅ pH probe (يقرأ، يحتاج معايرة)
- ✅ DS18B20 water temp (يعمل بشكل ممتاز)
- ⚠️ TDS BA.012 (UART — protocol غير محسوم)
- ❌ Level Transmitter QDY30A (لم يُوصَّل بعد)

---

## 🚨 المهام المفتوحة (الإكمال 20%)

### 🔴 P0 — حرج
- [ ] **معايرة pH** — استخدام محاليل pH 4.0 + 7.0
  - معادلة الحالية في YAML: `(x * 3.5) + 0.0` (تحتاج تصحيح)
  - الجهد عند pH 7.0 لم يُسجَّل بعد
- [ ] **حل قراءة TDS UART** — لوحة BA.012
  - protocol غير معروف (baud rate, frame format)
  - الحل المقترح: `interval:` مع `lambda` لقراءة UART يدوياً
- [ ] **شاشة اللمس + USB devices**
  - Wayland (cage) لا يلتقط input
  - الكيبورد والماوس USB لا يعمل في Kiosk mode

### 🟡 P1 — متوسطة
- [ ] **توسيع SD من 16GB → 64GB**
  - SD ممتلئة 99% (14GB من 15GB)
  - الخطوات: img → flash → gparted resize
- [ ] **توصيل Level Transmitter** (إذا اشتريت 0-3.3V version)
- [ ] **NVMe HAT + SSD** للموثوقية طويلة المدى

### 🟢 P2 — استكمال
- [ ] برمجة أتمتة تسميد ذكية (Crop Recipes)
- [ ] إضافة Cloudflare Tunnel للوصول عن بعد الآمن
- [ ] InfluxDB + Grafana للتحليلات (مستقبلاً)

---

## 📝 الإكمال المطلوب قبل البدء بالأحساء

⚠️ **توصية:** أنهِ هذا العميل قبل الذهاب للأحساء، لأن:
1. الأحساء أكبر بكثير (4 zones بدلاً من 1)
2. أيّ مشكلة هنا = ستتكرر هناك
3. الدروس هنا = تُحسّن عمل الأحساء

---

## 🎯 الدور كـ Master Image

عند إكمال 100%، خذ **img كامل** من SD لتصبح:

```bash
# Master Image لكل عميل قادم
sudo dd if=/dev/sdc of=igarden-master-v1-2026-05-XX.img bs=4M
```

**الفائدة:** كل عميل جديد يأخذ 30 دقيقة بدلاً من 3 أيام.

---

## 🔗 ملفات ذات صلة

- [العميل 003 — الأحساء](./003-ahsa-rayana.md)
- [بنية Pi 5 #1](../infrastructure/pi5-customer2-ghulah.md)
- [Master Image Plan](../operations/master-image-strategy.md)

---

🌱 **iGarden — ازرع بذكاء**
