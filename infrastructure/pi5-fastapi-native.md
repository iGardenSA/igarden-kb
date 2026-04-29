# 🐍 البنية التحتية — Pi 5 iGarden Smart OS Native (FastAPI)

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** R&D — منتج تجاري مستقبلي
> **الحالة:** ⏸️ Pause رسمي (يستأنف بعد 5-10 عملاء HA)
> **المرجع:** [قرار HA vs FastAPI](../architecture/ha-vs-fastapi-decision.md)

---

## 📌 الملخص

محاولة بناء **منتج iGarden 100% بدون اعتماد على Home Assistant**: FastAPI + SQLAlchemy + SQLite على Pi 5 native (بدون Docker، بدون HA). الهدف بعيد المدى: SaaS / منتج قابل للترخيص. **حالياً متوقّف بناءً على قرار 2026-04-27** لصالح تركيز الموارد على HA Container للعملاء.

---

## ⚠️ تنبيه: IP يحتاج تأكيد

| البند | القيمة | حالة |
|---|---|---|
| **IP المُسجَّل** | `192.168.8.235` | ⚠️ **نفس IP العميل 002 (الغولاء)** |

> 🚨 هذا تعارض ظاهري. الاحتمالات:
> 1. **نفس Pi فعلاً** — تم تشغيل FastAPI على نفس Pi العميل 002 كـ R&D، ثم نُقل/أُوقف.
> 2. **Pi مختلف** — IP لم يُحدَّث في الوثائق.
> 3. **بيئة مؤقتة** — IP قديم من تجربة سابقة.
>
> **مهمة P0:** تأكيد الحالة الفعلية في محادثة لاحقة (SSH للجهاز + `hostname` + `ip a`).

---

## 📂 موقع المشروع

```
/opt/igarden/
├── app/
│   ├── main.py              ← FastAPI entry
│   ├── api/                 ← Routers
│   ├── core/                ← Config, DB, security
│   ├── hardware/            ← Sensor + actuator drivers
│   ├── scenarios/           ← Scenario Engine
│   ├── alerts/              ← Kill Switch + cooldown
│   └── frontend/            ← HTML/CSS/JS vanilla (10 صفحات)
├── tests/                   ← 208 unit tests passing
├── data/
│   └── igarden.db           ← SQLite
└── requirements.txt
```

---

## 🧱 Stack البرمجي

| الطبقة | التقنية |
|---|---|
| **OS** | Pi OS Lite (بدون Docker) |
| **Runtime** | Python 3.13 (system python) |
| **Web framework** | FastAPI |
| **ORM** | SQLAlchemy |
| **DB** | SQLite (محلي، single-file) |
| **Tests** | pytest + freezegun |
| **Frontend** | HTML/CSS/JS vanilla — لا framework |
| **Process manager** | (مخطّط) systemd unit |

> 🎯 **مبدأ التصميم:** صفر اعتمادات خارجية. لا Docker، لا HA، لا cloud. كل شيء محلي ومن أوّل سطر كود.

---

## 📊 حالة المراحل (Phases)

| المرحلة | الوصف | الحالة |
|---|---|---|
| **Phase 1: Foundation** | بنية المشروع + DB + API skeleton | ✅ مكتمل |
| **Phase 2: Hardware Layer** | 6 sensors + actuators + Mock mode | ✅ مكتمل |
| **Phase 3 — Session A** | Scenario Engine Foundation | ✅ مكتمل |
| **Alerts System** | Kill Switch + Cooldown + HA stub | ✅ مكتمل |
| **Phase 3 — Session B** | Actions (14 قراراً معمارياً معتمد) | ⏳ قيد التنفيذ — متوقّف |
| **Phase 3 — Session C** | Engine (Duration + Cooldown logic) | 🔴 لم يبدأ |
| **Phase 3 — Session D** | DB + API integration tests | 🔴 لم يبدأ |
| **Phase 4** | MQTT + HA Auto-Discovery | 🔴 لم يبدأ |
| **Phase 5** | Frontend Wiring (Live updates + Charts) | 🔴 لم يبدأ |

---

## 🧪 الاختبارات

```
208 unit tests passing ✅
─────────────────────────
- Hardware drivers (mock mode)
- Scenario engine foundation
- Alerts system
- Kill switch logic
- Cooldown windows
- HA stub integration
```

**الأدوات:**
- `pytest` — runner
- `freezegun` — تجميد الوقت لاختبار cooldowns
- `pytest-cov` — تغطية

---

## ⏸️ سبب الـ Pause

من قرار 2026-04-27:

| السبب | التفصيل |
|---|---|
| **Time to value** | يحتاج 3-6 أشهر لإكمال Phases 4+5 — لا قيمة تجارية فورية |
| **Maintenance burden** | كل ميزة نكتبها بأيدينا (مقابل HA: community + 2,000 integration) |
| **Architecture sprawl** | المعماريات تتكاثر بدون منتج مكتمل واحد |
| **العقد الضاغط** | الأحساء 30 يوم — لا وقت لإعادة بناء |

تفاصيل كاملة: [`architecture/ha-vs-fastapi-decision.md`](../architecture/ha-vs-fastapi-decision.md)

---

## 🟢 شروط الاستئناف

يستأنف العمل النشط على FastAPI Native عند تحقّق **كل** هذه الشروط:

- [ ] 5-10 عملاء على HA Container (validation ميداني كافٍ)
- [ ] Master Image لـ HA مستقر ومُجرَّب
- [ ] Cash flow يسمح بـ R&D خالص (3-6 أشهر بدون عائد)
- [ ] قرار strategic بأن iGarden سينتج SaaS (ليس فقط تركيبات)

---

## 🚨 المهام المفتوحة

### 🔴 P0 (قبل أيّ استئناف)
- [ ] **تأكيد IP الفعلي** للجهاز (نفس Pi 002 أم مختلف؟)
- [ ] **تصوير الـ disk** كـ checkpoint قبل الـ pause الرسمي
- [ ] **توثيق state الحالي** بالتفصيل (commit hash، DB schema، tests passing)

### 🟢 P2 (عند الاستئناف)
- [ ] إكمال Phase 3 Session B (Actions)
- [ ] Phase 3 Session C (Engine)
- [ ] Phase 3 Session D (DB+API tests)
- [ ] Phase 4 (MQTT + HA Auto-Discovery)
- [ ] Phase 5 (Frontend wiring + charts)

---

## 💰 ملخص الاستهلاك

| البند | القيمة |
|---|---|
| **رصيد Anthropic API المُستهلك** | ~$8-10 (حتى 2026-04-27) |
| **رصيد متبقٍ** | $24 |
| **عدد unit tests** | 208 (passing) |
| **سطور Frontend (React الديمو)** | 1,196 — منفصل، يعيش على Vercel |

---

## 🔗 ملفات ذات صلة

- [قرار HA vs FastAPI المفصّل](../architecture/ha-vs-fastapi-decision.md)
- [تطوّر المعماريات الـ 3](../architecture/three-projects-evolution.md)
- [Pi 5 العميل 002 (HA Container — البديل المعتمد)](./pi5-customer2-ghulah.md)

---

🌱 **iGarden — ازرع بذكاء**
