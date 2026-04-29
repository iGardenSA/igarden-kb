# 🏗️ المعماريات الثلاث في iGarden — مرجع دائم

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** مرجع معماري (long-term reference)
> **الحالة:** ✅ معتمد
> **مصدر تاريخي:** [`conversations/2026-04-27/02-architecture-evolution.md`](../conversations/2026-04-27/02-architecture-evolution.md)

---

## 📌 المبدأ الجوهري

> **iGarden ليس "نظام واحد" — بل توليفة من ثلاث معماريات لكل منها دور محدّد.**
> اختر الأداة المناسبة للمهمة، لا تستخدم الأقوى لكل شيء.

---

## 🗺️ الخريطة الواحدة

```
                       ┌──────────────────┐
                       │  iGarden Stack   │
                       └────────┬─────────┘
        ┌───────────────────────┼───────────────────────┐
        ▼                       ▼                       ▼
   ┌─────────┐            ┌──────────┐            ┌──────────┐
   │   [1]   │            │   [2]    │            │   [3]    │
   │ HA على  │            │ CM5 Hub  │            │ FastAPI  │
   │  Pi 5   │            │ (n8n+PG) │            │  Native  │
   └─────────┘            └──────────┘            └──────────┘
   ميدان العملاء         R&D + Backend            منتج SaaS مستقبلي
   (Production)          (مستقبل app.igarden.sa)   (Pause حالياً)
```

---

## 🟢 [1] HA Container على Pi 5 — منتج العملاء

### الدور
**الأداة الميدانية الافتراضية لكل تركيب لدى عميل.**

### المكوّنات
| الطبقة | التقنية |
|---|---|
| OS | Pi OS Lite 64-bit |
| Containers | Docker + docker-compose |
| Core | Home Assistant Container |
| Add-ons | ESPHome + Mosquitto MQTT |
| UI | Lovelace (Theme: iGarden Forest+Lime) + Chromium Kiosk |
| Hardware | Pi 5 + ESP32 + ADS1115 + DS18B20 + 8× relays |

### نقاط القوة
- ✅ **سرعة النشر:** 3-5 أيام للعميل (مقارنة بأشهر للبدائل)
- ✅ **مجتمع ضخم:** 250K+ مستخدم نشط، 2,000+ integration جاهزة
- ✅ **Mobile App جاهز:** HA Companion (iOS + Android)
- ✅ **مجرَّب ميدانياً:** عملاء 001، 002، 003

### نقاط الضعف
- ⚠️ Branding محدود (مع Theme + Custom dashboard يصبح مقبولاً)
- ⚠️ HAOS لا يدعم Chromium Kiosk → Pi OS Lite + Docker هو الحل
- ⚠️ SD cards عادية تتلف مع الكتابة المستمرة → NVMe SSD مستقبلاً

### متى تُستخدم
> **كل عميل جديد حتى رقم 10**، ثم يُعاد التقييم.

### المرجع
- بنية مرجعية: [`infrastructure/pi5-customer2-ghulah.md`](../infrastructure/pi5-customer2-ghulah.md)
- قرار الاعتماد: [`architecture/ha-vs-fastapi-decision.md`](./ha-vs-fastapi-decision.md)

---

## 🟡 [2] CM5 Hub — البنية المركزية

### الدور
**مختبر R&D + خادم backend مستقبلي لـ `app.igarden.sa`.**

### المكوّنات
| الطبقة | التقنية |
|---|---|
| OS | Pi OS Lite 64-bit |
| Containers | Docker (n8n + PostgreSQL/TimescaleDB + Portainer) |
| MQTT | Mosquitto على systemd (ليس Docker) |
| Hardware | Compute Module 5 في عسفان |

### الاستخدامات الفعلية
- 🧪 **محاكاة 24/7** لبيانات الحساسات (workflow simulator)
- 🧪 **اختبار scenarios** قبل نشرها للعملاء
- 📊 **Time-series DB** (TimescaleDB) لتجميع بيانات متعددة العملاء (مستقبلاً)
- 🤖 **Telegram Bot + Claude API** (مُضاف في 2026-04-29)

### نقاط القوة
- ✅ **منفصل عن العملاء** — تجارب بدون إيقاف الإنتاج
- ✅ **n8n قوي للأتمتة** — Webhook + Cron + LLM nodes
- ✅ **TimescaleDB ممتاز للحساسات** — hypertables + compression

### نقاط الضعف
- ⚠️ **ليس على المسار الحرج** — يسهل تأجيل صيانته
- ⚠️ **MQTT credential في n8n لم يكتمل** (حالة 2026-04-27)
- ⚠️ DNS لـ `app.igarden.sa` لم يُربط (Vercel nameservers لا Cloudflare)

### متى تُستخدم
- اليوم: R&D + محاكاة + bots
- 6 أشهر: تجميع بيانات حساسات متعددة العملاء
- سنة: محرّك `app.igarden.sa` (لوحة تحكم العميل عن بعد)

### المرجع
- بنية مرجعية: [`infrastructure/cm5-osfan-hub.md`](../infrastructure/cm5-osfan-hub.md)
- تحديث 2026-04-29: [`conversations/2026-04-29/full-session-report.md`](../conversations/2026-04-29/full-session-report.md)

---

## 🔴 [3] FastAPI Native — المنتج المستقبلي

### الدور
**منتج iGarden 100% مخصّص (Brand كامل، صفر اعتمادات خارجية).**

### المكوّنات
| الطبقة | التقنية |
|---|---|
| OS | Pi OS Lite (بدون Docker) |
| Backend | FastAPI + SQLAlchemy + SQLite |
| Frontend | HTML/CSS/JS vanilla (10 صفحات) |
| Tests | pytest + freezegun (208 tests passing) |

### نقاط القوة (المحتملة)
- ✅ **Branding 100% iGarden** — لا اعتماد على HA UI
- ✅ **تخصيص لا حدود له** — كل سطر تحت سيطرتنا
- ✅ **خفيف جداً** — لا overhead Docker / HA

### نقاط الضعف (الحالية)
- ❌ **3-6 أشهر متبقّية** لإكمال Phases 4 + 5
- ❌ **Maintenance burden عالٍ** — كل ميزة بأيدينا
- ❌ **لا قيمة تجارية فورية** للعميل

### الحالة
> ⏸️ **Pause رسمي** — يستأنف بعد 5-10 عملاء HA + cash flow كافٍ.

### المرجع
- بنية مرجعية: [`infrastructure/pi5-fastapi-native.md`](../infrastructure/pi5-fastapi-native.md)
- مبررات الـ Pause: [`architecture/ha-vs-fastapi-decision.md`](./ha-vs-fastapi-decision.md)

---

## 📊 جدول الاختيار السريع

| السيناريو | الأداة المناسبة |
|---|---|
| نظام عميل واحد سريع للتركيب | **HA Container** ⭐ |
| عميل بحاجة لميزة فريدة جداً | HA + Custom Add-on |
| محاكاة + اختبار scenarios | **CM5 Hub** (n8n) |
| Backend مركزي لـ analytics | **CM5 Hub** (PostgreSQL/Timescale) |
| Telegram/WhatsApp Bot | **CM5 Hub** (n8n + Claude API) |
| منتج SaaS قابل للترخيص | FastAPI Native (لاحقاً) |
| Marketing / Sales / Demo | Next.js على Vercel (مستقل) |

---

## 📐 مصفوفة المقارنة

| المعيار | HA Container | CM5 Hub | FastAPI Native |
|---|:---:|:---:|:---:|
| **سرعة النشر** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| **التخصيص** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Maintenance** | ⭐⭐⭐⭐ (community) | ⭐⭐⭐ | ⭐ (يدوي) |
| **Branding** | ⭐⭐⭐ (Theme) | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **التكلفة الزمنية** | منخفضة | متوسطة | عالية جداً |
| **Time-to-revenue** | فوري | متوسّط | بعيد |

---

## 🎯 القاعدة الذهبية

```
┌──────────────────────────────────────────────────────────┐
│                                                          │
│  للعملاء اليوم:        HA Container                       │
│  للأتمتة والـ R&D:      CM5 Hub                          │
│  للمستقبل البعيد:       FastAPI Native (Pause)            │
│                                                          │
│  لا تخلط الأدوات. كل واحدة لها مكانها.                    │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

---

## 🔗 ملفات ذات صلة

- [قرار HA vs FastAPI المفصّل](./ha-vs-fastapi-decision.md)
- [القرارات الكبرى — 2026-04-27](../decisions/2026-04-27-major-decisions.md)
- [Pi 5 العميل 002 — البنية المرجعية لـ HA](../infrastructure/pi5-customer2-ghulah.md)
- [CM5 Hub — البنية المرجعية](../infrastructure/cm5-osfan-hub.md)
- [Pi 5 FastAPI Native — البنية المرجعية](../infrastructure/pi5-fastapi-native.md)

---

🌱 **iGarden — ازرع بذكاء**
