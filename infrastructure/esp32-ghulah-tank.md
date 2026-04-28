# 🔌 ESP32 — igarden-tank (الغولاء)

> **آخر تحديث:** 2026-04-27
> **الحالة:** 🟡 يعمل، يحتاج معايرة pH + حل قراءة TDS UART
> **الموقع الفعلي:** محمية الخس العائم، الغولاء — متصل بـ [Pi 5 الغولاء](./pi5-customer2-ghulah.md) عبر MQTT

---

## 📌 الدور

وحدة الاستشعار والتحكم الميداني. تقرأ pH/TDS/درجة حرارة الماء وتشغّل 8 ريليهات (مضخات، محابس، dosers) لخزان الخس العائم.

---

## 🔧 المواصفات التقنية

| البند | القيمة |
|---|---|
| **اللوحة** | ESP32 DevKit |
| **Hostname** | igarden-tank |
| **IP** | 192.168.8.137 |
| **WiFi SSID** | IGARDEN_EXT |
| **Firmware** | ESPHome (مُدار من HA على Pi 5) |
| **MQTT prefix** | `igarden/tank` |
| **MQTT user** | `mqtt_user` |

### مفاتيح ESPHome:
```
api encryption: Lc5+NNXoaOu9y1/rpOA+odCGDjMzp3Zzy879af3tz7w=
ota password:   c21a718a835f2344623a8b2238540436
```

> ⚠️ هذه المفاتيح حسّاسة — تظهر هنا للتوثيق التشغيلي فقط. يجب نقلها لاحقاً لـ KeePassXC والإشارة إليها بمرجع.

---

## 🔌 GPIO Mapping

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

> **ملاحظة:** Doser B/C نُقلت من 16/17 إلى 25/26 لتجنّب تعارض UART.

---

## 🧪 ADS1115 Setup

| البند | القيمة |
|---|---|
| **Address** | 0x48 |
| **A0** | Po من لوحة pH (Atlas/LM358 board) |
| **A1** | احتياطي (TDS انتقل لـ UART) |
| **A2** | احتياطي |
| **A3** | احتياطي |

---

## 🎛️ الحساسات المتصلة

| الحساس | الحالة | ملاحظات |
|---|---|---|
| pH probe | ✅ يقرأ، يحتاج معايرة | المعادلة الحالية في YAML: `(x * 3.5) + 0.0` (تحتاج تصحيح). الجهد عند pH 7.0 لم يُسجَّل بعد. |
| DS18B20 (water temp) | ✅ يعمل بشكل ممتاز | — |
| TDS BA.012 (UART) | ⚠️ protocol غير محسوم | baud rate وframe format غير معروفين. الحل المقترح: `interval:` مع `lambda` لقراءة UART يدوياً. |
| Level Transmitter QDY30A | ❌ لم يُوصَّل بعد | بانتظار شراء نسخة 0-3.3V |

> 📋 المهام المفتوحة لإكمال هذه الوحدة موجودة في [projects/002-ghulah-completion.md](../projects/002-ghulah-completion.md).

---

## 🔗 ملفات ذات صلة

- [Pi 5 الغولاء (Hub التحكم)](./pi5-customer2-ghulah.md)
- [العميل 002 (الغولاء)](../customers/002-ghulah-lettuce.md)
- [مشروع إكمال 002](../projects/002-ghulah-completion.md)
- [خط منتج HA Stack](../products/ha-stack-product.md)

---

🌱 **iGarden — ازرع بذكاء**
