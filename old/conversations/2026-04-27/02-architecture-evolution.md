# 🏗️ تطور المعمارية — 3 مشاريع متسلسلة

> **التاريخ:** 2026-04-27 (نقاش معماري)
> **النوع:** توثيق معماري + قرار استراتيجي
> **الحالة:** ✅ مفهوم + معتمد

---

## 📌 الملخص التنفيذي

iGarden مرّت بـ **3 مراحل تطوّر معماري** خلال 2026، ليست مشاريع متضاربة بل **تطوّر مدروس** بناءً على دروس كل مرحلة. كل مرحلة بنت فوق الأخرى.

---

## 🗺️ خريطة التطوّر

```
أبريل 2026 ──────────────────────────────────────────────►

  [1] ESP32 + HA      [2] iGarden Hub    [3] Native FastAPI
  على Pi 5            على CM5            على Pi 5
  ─────────────       ─────────────       ──────────────
  المختبر الأولي      البنية التحتية       المنتج النهائي
  (Proof of Concept)  (Backend Core)      (iGarden Smart OS)
       │                    │                    │
       └────────────────────┴────────────────────┘
                            │
                            ▼
                   نفس المشروع، 3 مراحل
```

---

## 🟢 المرحلة 1: HA + ESP32 على Pi 5

### الهدف:
إثبات أن الفكرة قابلة للتنفيذ تقنياً

### التقنيات:
- **OS:** Pi OS Lite + Docker
- **التحكم:** Home Assistant Container
- **الأجهزة:** ESP32 + ADS1115 + DS18B20
- **التواصل:** ESPHome → MQTT → HA
- **الواجهة:** Lovelace dashboard (عربي مخصّص)
- **التخزين:** SD 32GB → 64GB

### ما تم إنجازه:
- ✅ HA على Pi 5 (192.168.8.235)
- ✅ ESP32 igarden-tank (192.168.8.137)
- ✅ ESPHome YAML كامل لـ pH/EC/Temp/8 relays
- ✅ Dashboard "iGarden" عربي
- ✅ Chromium Kiosk على شاشة DSI
- ✅ NSخ احتياطي يومي + الأمان (UFW + Fail2ban)

### الدروس المستخلصة:
- ✅ HA + ESPHome = خيار قوي للتركيب السريع
- ✅ Docker bind mounts ضرورية لمنع ضياع البيانات
- ⚠️ HAOS لا يدعم Chromium Kiosk → Pi OS أفضل
- ⚠️ SD cards عادية تتلف مع الكتابة المستمرة → NVMe SSD مستقبلاً

### القرار النهائي:
**هذه المعمارية تخدم العميل 002 (الغولاء) و003 (الأحساء) والمستقبل القريب.**

---

## 🟡 المرحلة 2: iGarden Hub على CM5

### الهدف:
بناء Backend مركزي لإدارة بيانات حساسات متعددة العملاء

### التقنيات:
- **OS:** Pi OS Lite + Docker
- **الـ Stack:**
  - n8n (Workflow Automation)
  - PostgreSQL + TimescaleDB
  - Portainer (Container Management)
  - Mosquitto MQTT (systemd, ليس Docker)
- **الجهاز:** CM5 (192.168.8.21) في عسفان

### ما تم إنجازه:
- ✅ 4 خدمات Docker شغّالة
- ✅ PostgreSQL credential يعمل
- ✅ Workflow simulator مستورد (محاكاة 4 حساسات كل 5 دقائق)
- ⏳ MQTT credential (لم يكتمل)
- ⏳ Execute Workflow الأول (لم يُنفّذ)

### الدور الاستراتيجي:
- **R&D Lab** — اختبار البنية التحتية
- **Future Cloud Backend** — لاحقاً قد يخدم app.igarden.sa
- **محاكاة 24/7** — لاختبار scenarios

### الحالة:
🟡 **في وضع "Pause خفيف"** — يعمل في الخلفية لكن ليس أولوية الأن.

---

## 🔴 المرحلة 3: iGarden Smart OS Native (FastAPI)

### الهدف:
بناء **منتج تجاري مخصّص بالكامل** بـ Brand iGarden 100%

### التقنيات:
- **OS:** Pi OS Lite (بدون Docker، بدون HA)
- **Backend:** FastAPI + SQLAlchemy + SQLite
- **Frontend:** HTML/CSS/JS vanilla (10 صفحات)
- **Tests:** pytest + freezegun (208 tests passing)

### ما تم إنجازه (Phases):
| المرحلة | الحالة | التفاصيل |
|---|---|---|
| Phase 1: Foundation | ✅ مكتمل | بنية المشروع، DB، API skeleton |
| Phase 2: Hardware Layer | ✅ مكتمل | 6 sensors + actuators + Mock mode |
| Phase 3 Session A | ✅ مكتمل | Scenario Engine Foundation |
| Alerts System | ✅ مكتمل | Kill Switch + Cooldown + HA stub |
| Phase 3 Session B (Actions) | ⏳ قيد التنفيذ | 14 قراراً معمارياً معتمد |
| Phase 3 Session C (Engine) | 🔴 لم يبدأ | Duration + Cooldown logic |
| Phase 3 Session D (DB+API) | 🔴 لم يبدأ | Integration tests |
| Phase 4: MQTT + HA | 🔴 لم يبدأ | Auto-Discovery |
| Phase 5: Frontend Wiring | 🔴 لم يبدأ | Live updates + Charts |

### الإحصائيات:
- 📁 1,196 سطر React (Frontend الديمو)
- 🐍 FastAPI كامل (Phase 1+2)
- 🧪 208 unit tests passing
- 💰 ~$8-10 من رصيد Anthropic API استُهلك
- 💰 $24 متبقٍ في الرصيد

---

## 🤔 السؤال الكبير: أي معمارية للعملاء القادمين؟

### القرار المعتمد بعد النقاش (2026-04-27):

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  🎯 الأولوية الحالية: HA Container (المرحلة 1)               │
│                                                             │
│  ✅ مُجرَّب على عميل 001 (شعير - خميس مشيط)                  │
│  ✅ يعمل على عميل 002 (خس - الغولاء) — 80%                  │
│  ✅ سيُستخدم لعميل 003 (الأحساء)                             │
│                                                             │
│  ⏸️ FastAPI Native: Pause مؤقت                              │
│     - لا تتوقف، لكن لا تستثمر فيه وقتاً ضاغطاً                │
│     - يُستكمل بعد 5-10 عملاء على HA                          │
│                                                             │
│  💡 CM5 Hub: يستمر كـ R&D                                   │
│     - محاكاة + اختبار scenarios                              │
│     - أساس لـ app.igarden.sa مستقبلاً                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### المبررات:

#### لماذا HA Container كأساس حالي؟
1. ✅ **مُجرَّب في الميدان** (شعير + الخس)
2. ✅ **سرعة النشر** (3-5 أيام لكل عميل)
3. ✅ **مجتمع ضخم** (250K+ مستخدم نشط)
4. ✅ **2,000+ integration جاهزة**
5. ✅ **Mobile App جاهز** (HA Companion)
6. ✅ **Lovelace Dashboards** قابلة للتخصيص بـ YAML
7. ✅ **العقد الحالي يضغط** — 30 يوم، لا وقت لإعادة بناء

#### لماذا Pause لـ FastAPI؟
1. ❌ **يحتاج 3-6 أشهر** لإكمال Phases 4 + 5
2. ❌ **Maintenance burden** عالٍ (كل ميزة نكتبها بأيدينا)
3. ❌ **لا قيمة تجارية فورية** للعميل
4. ⚠️ **خطر "Architecture Sprawl"** — كثرة المعماريات بدون منتج

---

## 🌟 الفلسفة الجوهرية

> **"اختر الأداة المناسبة للمهمة المناسبة."**

| السيناريو | الأداة |
|---|---|
| نظام عميل واحد سريع | HA Container ⭐ |
| عميل بحاجة لميزة فريدة جداً | HA + Custom Add-on |
| Backend مركزي لـ analytics | n8n + PostgreSQL على CM5 |
| منتج SaaS مستقبلي | FastAPI Native (لاحقاً) |
| Marketing/Sales | Next.js على Vercel (الديمو) |

**iGarden ليس "نظام واحد" — بل توليفة من الأنظمة الصحيحة.**

---

## 📊 مقارنة سريعة

| المعيار | HA Container | n8n Stack | FastAPI Native |
|---|---|---|---|
| **سرعة النشر** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| **التخصيص** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Maintenance** | ⭐⭐⭐⭐ (community) | ⭐⭐⭐ | ⭐ (كل شيء يدوي) |
| **Branding** | ⭐⭐⭐ (مع Theme) | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **التكلفة الزمنية** | منخفضة | متوسطة | عالية جداً |
| **العميل الراضي اليوم** | ✅ | ❌ | ❌ |

---

## 📝 المهام المفتوحة

- [ ] توثيق Master Image Pi 5 لإعادة الاستخدام
- [ ] بناء "Customer Config Layer" لتسهيل النسخ بين العملاء
- [ ] إكمال FastAPI Phase 3 Session B (في الخلفية)
- [ ] تشغيل n8n workflow أول مرة على CM5
- [ ] دمج بيانات CM5 → app.igarden.sa مستقبلاً

---

## 🔗 ملفات ذات صلة

- [العميل 002 — الغولاء](../customers/002-ghulah-lettuce.md)
- [العميل 003 — الأحساء](../customers/003-ahsa-rayana.md)
- [بنية CM5 Hub](../infrastructure/cm5-osfan-hub.md)
- [بنية Pi 5 FastAPI](../infrastructure/pi5-fastapi-native.md)

---

🌱 **iGarden — ازرع بذكاء**
