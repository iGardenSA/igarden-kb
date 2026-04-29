# 🧭 iGarden Knowledge Base — INDEX

> **آخر تحديث:** 2026-04-29
> **الإصدار:** v1.1
> **مبدأ الاستخدام:** ابدأ كل محادثة Claude بـ "اقرأ INDEX.md" → ستعرف الخريطة كاملة.

---

## 👤 المالك

- **الاسم:** علي محمد غنيمة
- **الدور:** Founder & CEO، iGarden
- **الشركة:** Intelligent Garden Co. — CR 4030579637
- **البريد:** info@igarden.sa
- **الموقع:** https://igarden.sa

---

## 🖥️ Tech Environment

| الجهاز | IP | الدور |
|---|---|---|
| HP EliteBook 840 (Linux Mint 22, user: ali) | — | محطة العمل |
| Pi 5 (user: i) — الغولاء | `192.168.8.235` | Edge — HA Container للعميل 002 |
| CM5 (user: igarden) — عسفان | `192.168.8.102` (سابقاً `.21`) | Hub — n8n + PostgreSQL + Mosquitto + Cloudflare Tunnel |

---

## 📊 الحالة الحالية

- ✅ **Knowledge Base** على GitHub: `iGardenSA/igarden-kb`
- ✅ **Telegram Bot** شغّال: `@igarden_sa_bot`
- ✅ **Cloudflare Tunnel** على CM5 (Healthy، DNS معلّق)
- 🟡 **Smart OS Phase 3/5** — 208 unit tests passing — **Pause رسمي**
- 🟡 **Pitch Sunbolah** — 16 slides جاهزة
- 🟡 **العميل 002 (الغولاء)** — 80% منجز
- 🔴 **العميل 003 (الأحساء)** — العقد ضُوعف، ينتظر تحليل بـ Opus 4.7

---

## 📁 خريطة الملفات

### 🧠 Core
- [`README.md`](./README.md) — كيف تستخدم الـ KB
- [`SESSIONS.md`](./SESSIONS.md) — سجل جلسات سريع
- [`INDEX.md`](./INDEX.md) — هذا الملف

### 👥 Customers
- [`customers/001-khamis-mushait.md`](./customers/001-khamis-mushait.md) — العميل 001 (شعير)
- [`customers/002-ghulah-lettuce.md`](./customers/002-ghulah-lettuce.md) — العميل 002 (الخس - الغولاء) 🟡
- [`customers/003-ahsa-rayana.md`](./customers/003-ahsa-rayana.md) — العميل 003 (الأحساء) 🚨

### 🖧 Infrastructure
- [`infrastructure/pi5-customer2-ghulah.md`](./infrastructure/pi5-customer2-ghulah.md) — Pi 5 الغولاء (مرجعي)
- [`infrastructure/cm5-osfan-hub.md`](./infrastructure/cm5-osfan-hub.md) — CM5 عسفان
- [`infrastructure/pi5-fastapi-native.md`](./infrastructure/pi5-fastapi-native.md) — Pi 5 FastAPI ⏸️

### 🏗️ Architecture
- [`architecture/three-projects-evolution.md`](./architecture/three-projects-evolution.md) — المعماريات الثلاث (مرجع)
- [`architecture/ha-vs-fastapi-decision.md`](./architecture/ha-vs-fastapi-decision.md) — قرار HA vs FastAPI

### 🎯 Decisions
- [`decisions/2026-04-27-major-decisions.md`](./decisions/2026-04-27-major-decisions.md) — 9 قرارات كبرى من جلسة HQ2

### 🛠️ Operations
- [`operations/customer-onboarding.md`](./operations/customer-onboarding.md) — دليل تركيب عميل جديد (0→100)
- [`operations/master-image-strategy.md`](./operations/master-image-strategy.md) — استراتيجية Master Image
- [`operations/deployment-checklist.md`](./operations/deployment-checklist.md) — checklist التركيب الميداني

### 💬 Conversations (الأرشيف)
- [`conversations/2026-04-27/`](./conversations/2026-04-27/) — جلسة HQ2 (4 ملفات)
  - `01-demo-deployment.md`
  - `02-architecture-evolution.md`
  - `03-claude-models-strategy.md`
  - `04-knowledge-base-strategy.md`
- [`conversations/2026-04-29/`](./conversations/2026-04-29/) — جلسة Telegram + Tunnel
  - `full-session-report.md`

### 🔧 Scripts
- [`scripts/init-repo.sh`](./scripts/init-repo.sh)
- [`scripts/git-sync.sh`](./scripts/git-sync.sh)
- [`scripts/new-conversation.sh`](./scripts/new-conversation.sh)

---

## 🚦 المهام المفتوحة الكبرى

### 🔴 P0
- [ ] إكمال P0 لعميل 002 (pH cal، TDS UART، شاشة، SD)
- [ ] قراءة عقد الأحساء المضاعف بـ Opus 4.7
- [ ] تأكيد IP الفعلي لـ Pi5 FastAPI (تعارض مع 002؟)

### 🟡 P1
- [ ] أخذ Master Image v1.0 (بعد إكمال 002)
- [ ] حل DNS الدائم لـ `n8n.igarden.sa`
- [ ] MQTT credential في n8n + Execute Workflow الأول

### 🟢 P2
- [ ] WhatsApp Bot (بعد استقرار Telegram)
- [ ] MQTT حساسات → n8n → KB (تيليمتري تلقائي)
- [ ] استئناف FastAPI Native (بعد 5-10 عملاء HA)
- [ ] هيكل `osfan-station/experiments/`

---

## 🤖 كيف يستخدم Claude هذا الـ KB

### في Claude.ai
```
"اقرأ https://raw.githubusercontent.com/iGardenSA/igarden-kb/main/INDEX.md"
```

### في Claude Code (على CM5)
```bash
cd /opt/igarden-kb
claude
# → "ابدأ بقراءة INDEX.md"
```

### في Telegram Bot
البوت يستفيد من Claude API + يقرأ الـ KB عبر raw GitHub URLs.

---

🌱 **iGarden — ازرع بذكاء**
