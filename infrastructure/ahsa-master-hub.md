# 🖥️ Master Hub — العميل 003 (الأحساء) [مخطط]

> **آخر تحديث:** 2026-04-27
> **الحالة:** ⏳ مخطط — الأجهزة في الطريق (وصول متوقع ~2026-05-04)
> **الموقع الفعلي المستقبلي:** مزرعة الريانة العضوية، الأحساء

---

## 📌 الدور

**Hub التحكم المركزي** لمزرعة الريانة العضوية. يتحكّم في 4 zones (4× ESP32 Tank 1-4) عبر MQTT، ويعرض لوحة تحكم على شاشة لمس 7" مركزية.

---

## 🔧 المواصفات المخططة

### Master Hub:
| البند | القيمة |
|---|---|
| **اللوحة** | Pi 5 (8GB RAM) |
| **الشاشة** | 7" DSI Touch |
| **التخزين** | 64GB SD أو NVMe SSD HAT |
| **OS** | Pi OS Lite + Docker |
| **الحماية الكهربائية** | UPS |
| **الحاوية** | Industrial enclosure (IP65) |

### الـ Stack:
يطبّق **iGarden HA Stack** (راجع [products/ha-stack-product.md](../products/ha-stack-product.md)) مع:
- HA Container (iGarden Theme)
- ESPHome Add-on
- Mosquitto MQTT
- 4 Lovelace Dashboards (Master Overview + Tank 1-4 تفصيلي)

---

## 🔌 الـ 4 ESP32 Zones

كل zone (Tank) فيه:
- **1× ESP32 DevKit** (مع Terminal Block)
- **1× ADS1115** (16-bit ADC للـ pH/EC analog)
- **1× DS18B20** (water temperature)
- **1× pH Probe** + board
- **1× EC/TDS Probe** (UART أو analog)
- **1× Level Sensor**
- **3× Doser pumps**
- **1× Mixer pump**
- **1× Solenoid valve** (24V)
- **1× Submersible pump** 0.5HP (220V) + Electronic timer

### MQTT Topics المخططة:
```
ihsa-farm/tank1/{ph,ec,temp,...}
ihsa-farm/tank2/{ph,ec,temp,...}
ihsa-farm/tank3/{ph,ec,temp,...}
ihsa-farm/tank4/{ph,ec,temp,...}
```

---

## 🌐 التحكم عن بعد

**الحل المعتمد:** Tailscale VPN (مجاني) + HA local access — بدلاً من Nabu Casa Cloud (~$5/شهر).

---

## 🔗 ملفات ذات صلة

- [العميل 003 (الأحساء)](../customers/003-ahsa-rayana.md)
- [مشروع تركيب الأحساء](../projects/003-ahsa-installation.md)
- [خط منتج HA Stack](../products/ha-stack-product.md)
- [Pi 5 الغولاء (المرجع المعماري)](./pi5-customer2-ghulah.md)
- [ESP32 igarden-tank (المرجع)](./esp32-ghulah-tank.md)

---

🌱 **iGarden — ازرع بذكاء**
