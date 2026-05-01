# 🌱 iGarden Knowledge Base

> **قاعدة معرفية مركزية لشركة iGarden — ازرع بذكاء**
> **آخر تحديث:** 2026-05-01 (راجع `events.md` للحصول على آخر حدث فعلي بأيّ entity)
> **مصدر الحقيقة:** [`events.md`](./events.md) — كل سطر = حدث بتاريخه الفعلي

نظام معرفي حيّ يحفظ كل قرار، تركيب، عميل، وقرار تقني في شركة iGarden. الهدف: **عدم تكرار الشرح من الصفر في كل محادثة Claude جديدة**.

---

## ⚠️ تحذير: الـ caching يمكن يخدعك

محرّكات web fetch (Claude.ai، Gemini، إلخ) تخزّن نسخة من raw URLs لساعات أحياناً.
**إذا قال أيّ AI "آخر تحديث X" وأنت تعرف أنه أحدث:**

### 🔧 استخدم URL مع cache-buster

```
https://raw.githubusercontent.com/iGardenSA/igarden-kb/main/events.md?t=YYYYMMDDHH
```
بدّل `YYYYMMDDHH` بالساعة الحالية لإجبار fetch جديد.

### 🔧 أو استخدم commit-pinned URL (الأقوى)

```
https://raw.githubusercontent.com/iGardenSA/igarden-kb/<commit-sha>/events.md
```
احصل على آخر sha من: https://github.com/iGardenSA/igarden-kb/commits/main

### 🔧 أو اطلب من Claude صراحةً

> "أعد تحميل https://raw.githubusercontent.com/iGardenSA/igarden-kb/main/events.md؟t=now وتجاهل أيّ نسخة قديمة"

---

## 🚦 الحالة الحالية (snapshot)

| العنصر | الحالة | تاريخ آخر تحديث |
|---|---|---|
| GitHub repo `iGardenSA/igarden-kb` | ✅ Public | 2026-04-28 |
| Telegram Bot `@igarden_sa_bot` | ✅ شغّال عبر `n8n.igarden.work` | 2026-04-30 |
| Anthropic API key + Telegram token | ✅ ROTATED 2026-04-30 | 2026-04-30 |
| ESPHome keys rotation | 📌 محوَّلة لـ Notion (زيارة الغولاء) | 2026-05-01 |
| Cloudflare Tunnel على `igarden.work` | ✅ دائم (systemd service) | 2026-04-30 |
| Tailscale Tailnet (3/5 أجهزة) | ✅ شغّال | 2026-04-30 |
| `igarden.sa` Production | ✅ منشور | 2026-04-30 |
| AI Daily Routine (21:00 يومي) | ✅ معتمد | 2026-05-01 |
| العميل 002 (الغولاء) | 🟡 85% — يحتاج زيارة موقعية | 2026-04-30 |
| العميل 003 (الأحساء) — عقد مضاعف | 🚨 ينتظر تحليل Opus 4.7 | 2026-04-29 |
| العميل 004 (بندر بن لادن) | 🟡 فرصة جديدة قيد التقييم | 2026-04-30 |
| iGarden Smart OS Native (FastAPI) | ⏸️ Pause | 2026-04-27 |
| ZATCA Q1 2026 deadline | ⏰ **2026-05-31** | — |
| Sunbolah pitch review | ⏰ **2026-05-07** | — |

> 🔍 **للحصول على آخر حالة لأي كيان:**
> ```bash
> grep "^[0-9-]* | <entity> " events.md | tail -1
> ```

---

## 📁 الهيكل

```
igarden-kb/
├── README.md                    ← هذا الملف
├── INDEX.md                     ← الفهرس الكامل
├── events.md                    ← 🔥 Source of Truth — السجل الزمني
├── SESSIONS.md                  ← سجل جلسات سريع
│
├── customers/                   ← العملاء
│   ├── 001-khamis-mushait.md
│   ├── 002-ghulah-lettuce.md
│   └── 003-ahsa-rayana.md
│
├── infrastructure/              ← البنية التحتية
│   ├── cm5-hub.md               ← CM5 (n8n + PG + Mosquitto + Tunnel)
│   ├── pi5-customer2-ghulah.md  ← Pi 5 الميداني المرجعي
│   └── pi5-fastapi-native.md    ← FastAPI Native (Pause)
│
├── architecture/                ← المعماريات
│   ├── three-projects-evolution.md
│   └── ha-vs-fastapi-decision.md
│
├── decisions/                   ← القرارات الاستراتيجية
│   └── 2026-04-27-major-decisions.md
│
├── operations/                  ← العمليات اليومية
│   ├── customer-onboarding.md
│   ├── master-image-strategy.md
│   └── deployment-checklist.md
│
├── projects/                    ← مشاريع جانبية
│   ├── telegram-bot.md
│   └── cloudflare-tunnel.md
│
├── tasks/                       ← المهام المؤجَّلة
│   └── pending.md
│
├── conversations/               ← أرشيف المحادثات الخام
│   ├── 2026-04-27/
│   └── 2026-04-29/
│
└── scripts/                     ← أتمتة
    ├── init-repo.sh
    ├── git-sync.sh
    └── new-conversation.sh
```

---

## 🚀 كيفية الاستخدام

### في Claude.ai (محادثة جديدة)

ابدأ بهذه الجملة:

```
اقرأ هذين الملفين أولاً:
- https://raw.githubusercontent.com/iGardenSA/igarden-kb/main/README.md
- https://raw.githubusercontent.com/iGardenSA/igarden-kb/main/events.md
```

Claude سيقرأ الـ snapshot من README + كل السجل الزمني من events.md، ويبدأ المحادثة بسياق كامل.

### في Claude Code على CM5

```bash
ssh igarden@192.168.8.102
cd ~/igarden-kb
claude
# → "ابدأ بقراءة README.md و events.md"
```

### من الجوال (Termux)

```bash
~/sync-kb.sh        # git pull + rclone sync gdrive:iGarden-KB
```

### من Telegram

أرسل أيّ سؤال إلى `@igarden_sa_bot` — البوت يستفيد من Claude API ويرد بسياق iGarden.

---

## 📅 المنهج: Event-Sourced KB

**القاعدة الذهبية:** كل معلومة لها **تاريخ الحدث الفعلي** (متى وقع)، وليس تاريخ الكتابة.

### الصيغة في `events.md`

```
YYYY-MM-DD | entity | event description
```

### مثال

```
2026-04-29 | cm5 | IP changed: .21 → .102
2026-04-29 | telegram-bot | @igarden_sa_bot activated
```

### قواعد الكتابة
1. **حدث جديد لكيان موجود →** أضف سطراً في القسم نفسه (لا تحذف القديم)
2. **الأحدث = الحقيقة الحالية**
3. **القديم يبقى للأرشيف** (يفيد لتتبع التطوّر)
4. **لا تكرّر** الأحداث الموجودة

### لإضافة حدث جديد بسرعة

1. حدّد التاريخ الفعلي (متى حصل، ليس اليوم)
2. حدّد entity (cm5, customer-002, telegram-bot، إلخ)
3. اكتب الحدث في سطر واحد
4. `git add events.md && git commit -m "event: <entity> - <summary>"`

---

## 🔄 الـ Workflow اليومي

```
محادثة Claude
    ↓
تحديثات في events.md + ملفات معنية
    ↓
git push (يدوياً أو عبر سكربت)
    ↓
GitHub repo iGardenSA/igarden-kb
    ↓
[تلقائياً 22:00] rclone sync → Google Drive
```

---

## 🛡️ النسخ الاحتياطي

- **Cloud 1:** GitHub repo `iGardenSA/igarden-kb` (public، مع version control)
- **Cloud 2:** Google Drive `iGarden-KB/` (يومياً 22:00 عبر Termux)
- **Local 1:** HP EliteBook `~/iGarden_KB/`
- **Local 2:** CM5 `~/igarden-kb/` (مع Claude Code)
- **Local 3:** الجوال `~/igarden-kb/` (Termux)

---

## 🔐 الأسرار (لا تُحفظ هنا)

❌ **لا** يحوي هذا الـ repo:
- API keys (Anthropic، Telegram bot tokens، Cloudflare keys)
- ESPHome encryption keys
- SSH private keys
- كلمات سر MQTT

✅ تُحفظ في:
- Password manager (1Password / Bitwarden)
- n8n credentials (داخل CM5)
- ملفات `.env` خارج Git

> ⚠️ **تنبيه:** بعض الأسرار قد تكون نُسخت سابقاً قبل اعتماد هذه السياسة. إذا اكتشفت أسراراً مكشوفة، **دوّرها فوراً** + احذفها من الـ history.

---

## 📞 للتواصل

- **المالك:** علي محمد غنيمة
- **البريد:** info@igarden.sa
- **الموقع:** https://igarden.sa
- **البوت:** [@igarden_sa_bot](https://t.me/igarden_sa_bot)

---

🌱 **iGarden — ازرع بذكاء**
*حين تزرع بذكاء، تحصد بثقة*
