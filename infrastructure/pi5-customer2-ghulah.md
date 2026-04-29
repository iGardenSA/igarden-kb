# 🍓 البنية التحتية — Pi 5 العميل 002 (الغولاء)

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** بنية تحتية ميدانية (Edge Device)
> **الحالة:** 🟡 تشغيلي 80% — يحتاج إكمال 4 مهام
> **المرتبط بالعميل:** [العميل 002 — محمية الخس العائم](../customers/002-ghulah-lettuce.md)

---

## 📌 الملخص

Raspberry Pi 5 يعمل كـ **Edge Hub** لمحمية الخس العائم في الغولاء. يستضيف Home Assistant Container ويتواصل مع ESP32 عبر MQTT لقراءة الحساسات والتحكم بـ 8 relays. هذا الجهاز هو **النموذج المرجعي (Reference Implementation)** لكل تركيب HA Container قادم.

---

## 🌐 معلومات الشبكة

| العنصر | القيمة | ملاحظات |
|---|---|---|
| **Pi 5 IP** | `192.168.8.235` | كان `.209` ثم `.132` — مُثبَّت الآن عبر DHCP reservation |
| **ESP32 IP** | `192.168.8.137` | `igarden-tank` |
| **WiFi SSID** | `IGARDEN_EXT` | شبكة المحمية |
| **Hostname (Pi)** | `raspberrypi` | لم يُغيَّر (للسرعة) |
| **Hostname (ESP)** | `igarden-tank` | يطابق device_name في ESPHome |

---

## 🔐 وصول SSH

| البند | القيمة |
|---|---|
| **User** | `i` |
| **Password auth** | معطّل |
| **Key path (laptop)** | `~/.ssh/igarden_pi` |
| **أمر الاتصال** | `ssh -i ~/.ssh/igarden_pi i@192.168.8.235` |
| **Sudo** | `i` في sudoers بدون كلمة مرور |

> ⚠️ **مُهم:** الـ key في `~/.ssh/igarden_pi` على HP EliteBook فقط. لازم نسخة احتياطية في password manager.

---

## 🧱 Stack البرمجي

```
┌─────────────────────────────────────────────────────┐
│  Pi OS Lite 64-bit (Debian 13 Trixie)               │
│  ├── Docker + docker-compose                        │
│  │   └── Home Assistant Container                   │
│  │       ├── ESPHome Add-on                         │
│  │       ├── Mosquitto MQTT                         │
│  │       ├── Theme: iGarden (Forest + Lime)         │
│  │       └── Dashboard "iGarden" عربي               │
│  ├── Chromium Kiosk (cage / Wayland)                │
│  ├── UFW (firewall)                                 │
│  ├── Fail2ban                                       │
│  └── Backups يومية → ~/backups/                     │
└─────────────────────────────────────────────────────┘
```

---

## 🔑 ESPHome — Credentials و Topics

```yaml
# secrets.yaml (لا يُرفع لـ Git)
api_encryption_key: "[REDACTED — see password manager]"
ota_password:       "[REDACTED — see password manager]"
mqtt_user:          "mqtt_user"
mqtt_password:      "***"   # في password manager
mqtt_prefix:        "igarden/tank"
```

| المتغير | القيمة |
|---|---|
| **Device name** | `igarden-tank` |
| **MQTT prefix** | `igarden/tank` |
| **Discovery prefix** | `homeassistant` (default) |
| **OTA enabled** | ✅ |

---

## 🔌 GPIO Mapping (ESP32)

### I2C / 1-Wire / UART

| GPIO | الوظيفة | الجهاز |
|---|---|---|
| 21 | I2C SDA | ADS1115 |
| 22 | I2C SCL | ADS1115 |
| 4  | 1-Wire | DS18B20 (مع 4.7kΩ pullup) |
| 16 | UART RX | TDS BA.012 TX |
| 17 | UART TX | TDS BA.012 RX |

### Relays (8-channel)

| GPIO | Relay | الوظيفة | الجهد |
|---|---|---|---|
| 27 | 1 | مضخة ري حوض 1 | 220V AC |
| 14 | 2 | مضخة ري حوض 2 | 220V AC |
| 12 | 3 | مضخة الخلط | 220V AC |
| 13 | 4 | محبس كهربائي | 24V DC |
| 5  | 5 | Doser A (Nutrient A) | 12V DC |
| 25 | 6 | Doser B | 12V DC |
| 26 | 7 | Doser C | 12V DC |
| 2  | 8 | Doser pH Down | 12V DC |

> 🔧 **تعديل مهم:** Doser B/C نُقلت من GPIO 16/17 إلى 25/26 لتجنّب تعارض UART (المخصّصة لـ TDS).

---

## 📡 ADS1115 (Analog → I2C)

| البند | القيمة |
|---|---|
| **Address** | `0x48` |
| **A0** | Po من لوحة pH (Atlas / LM358 board) |
| **A1** | احتياطي (TDS انتقل لـ UART) |
| **A2** | احتياطي |
| **A3** | احتياطي |
| **Gain** | 4.096V (default) |
| **Sample rate** | 128 SPS |

---

## 🌡️ الحساسات — حالة كل واحد

| الحساس | الحالة | ملاحظات |
|---|---|---|
| **pH probe** (Atlas) | ⚠️ يقرأ، يحتاج معايرة | المعادلة الحالية: `(x * 3.5) + 0.0` — تقريبية |
| **DS18B20** (water temp) | ✅ يعمل ممتاز | استقرار + دقة عالية |
| **TDS BA.012** (UART) | ⚠️ protocol غير محسوم | baud rate / frame format غير معروف |
| **Level Transmitter** QDY30A | ❌ لم يُوصَّل | الحالي 4-20mA — يحتاج 0-3.3V version |

---

## 🛡️ الأمان والموثوقية

| المكوّن | الإعداد |
|---|---|
| **UFW** | الافتراضي = deny incoming. مفتوح: 22 (SSH), 8123 (HA), 1883 (MQTT LAN) |
| **Fail2ban** | sshd jail نشط. ban time = 1h |
| **SSH** | password auth معطّل. key only |
| **Backups** | يومياً 03:00 → `~/backups/` (HA + ESPHome configs) |
| **Restart policy** | كل containers على `unless-stopped` |

---

## 💾 التخزين — مشكلة قائمة

```
SD Card: 16GB (Class 10)
├── مستخدم: 14GB / 15GB (99%)
└── المساحة المتاحة: <1GB
```

⚠️ **حرج:** SD ممتلئة → خطر فشل الكتابة → فقدان البيانات.

**الخطة:**
1. تصوير الـ SD الحالي → `igarden-customer002-2026-04-XX.img`
2. Flash إلى SD 64GB جديدة
3. `gparted resize` للـ rootfs
4. اختبار boot
5. (مستقبل) ترقية إلى NVMe SSD HAT

---

## 🚨 المهام المفتوحة

### 🔴 P0 — حرج (قبل الانتقال للأحساء)
- [ ] **معايرة pH** بمحاليل قياسية 4.0 + 7.0 → تحديث المعادلة في YAML
- [ ] **حل قراءة TDS UART** — تجريب `interval:` + `lambda` لقراءة يدوية
- [ ] **شاشة اللمس + USB devices** — Wayland (cage) لا يلتقط input
- [ ] **توسيع SD من 16GB → 64GB**

### 🟡 P1 — متوسطة
- [ ] توصيل Level Transmitter QDY30A (بعد شراء نسخة 0-3.3V)
- [ ] NVMe HAT + SSD للموثوقية
- [ ] أتمتة تسميد ذكية (Crop Recipes للخس)

### 🟢 P2 — مستقبل
- [ ] Cloudflare Tunnel للوصول عن بعد الآمن
- [ ] InfluxDB + Grafana للتحليلات
- [ ] أخذ Master Image بعد إكمال 100%

---

## 🎯 الدور كـ Master Image

عند إكمال جميع P0، هذا الجهاز يصبح **القالب المرجعي** لكل عميل قادم على HA:

```bash
# Master Image
sudo dd if=/dev/sdc of=igarden-master-v1-YYYY-MM-DD.img bs=4M status=progress
gzip igarden-master-v1-YYYY-MM-DD.img
```

تفاصيل الاستراتيجية: [`operations/master-image-strategy.md`](../operations/master-image-strategy.md)

---

## 🔗 ملفات ذات صلة

- [العميل 002 — محمية الخس العائم](../customers/002-ghulah-lettuce.md)
- [العميل 003 — الأحساء (نفس البنية، 4× scale)](../customers/003-ahsa-rayana.md)
- [قرار HA Container](../architecture/ha-vs-fastapi-decision.md)
- [دليل Onboarding عميل جديد](../operations/customer-onboarding.md)

---

🌱 **iGarden — ازرع بذكاء**
