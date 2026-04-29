# 🤖 مشروع — Telegram Bot (`@igarden_sa_bot`)

> **آخر حدث:** `grep "^[0-9-]* | telegram-bot " events.md | tail -1`
> **الحالة الحالية:** 🟢 شغّال
> **القرار الأساسي:** Telegram قبل WhatsApp (مجاني + يومان setup مقابل أسبوع + رسوم)

---

## 📌 الملخص

بوت تيليجرام للفريق والعملاء يستفيد من Claude API (Sonnet 4.5) عبر n8n على CM5 لرد على الاستفسارات بفهم سياق iGarden بالعربية. هو **القناة الأولى لإدخال البيانات والاستعلامات** من الجوال.

---

## 🤖 معلومات البوت

| البند | القيمة |
|---|---|
| **الاسم** | iGarden Assistant |
| **Username** | `@igarden_sa_bot` |
| **Token** | في password manager (لا في الـ repo) |
| **Model** | `claude-sonnet-4-5` |
| **اللغة** | عربية (system prompt) |
| **منشئ** | BotFather (`/newbot`) — 2026-04-29 |

> ⚠️ **سر:** Token البوت **لا** يُحفظ في الـ repo (المستودع public). تم حفظه في n8n credentials فقط.

---

## 🔄 الـ Workflow على n8n

```
┌──────────────────────────┐    ┌──────────────────────────┐    ┌──────────────────────────┐
│  [1] Telegram Trigger    │    │  [2] HTTP — Claude API   │    │  [3] Telegram Send       │
│  ────────────────────    │ ─► │  ────────────────────    │ ─► │  ────────────────────    │
│  Webhook على n8n         │    │  POST /v1/messages       │    │  sendMessage             │
│  يستقبل update           │    │  model: claude-sonnet-4-5│    │  chat_id من [1]          │
│  (text + chat_id)        │    │  system: iGarden Arabic  │    │  text من [2].content[0]  │
└──────────────────────────┘    └──────────────────────────┘    └──────────────────────────┘
```

### Node 1 — Telegram Trigger
- Type: `Telegram Trigger`
- Credentials: Telegram Bot Token (في n8n credentials)
- Updates: `message`
- Output: `{ message: { chat: { id }, text } }`

### Node 2 — HTTP Request (Claude API)
- Method: `POST`
- URL: `https://api.anthropic.com/v1/messages`
- Headers:
  ```
  x-api-key: {{ANTHROPIC_API_KEY}}
  anthropic-version: 2023-06-01
  content-type: application/json
  ```
- Body:
  ```json
  {
    "model": "claude-sonnet-4-5",
    "max_tokens": 1024,
    "system": "أنت مساعد iGarden الذكي بالعربية...",
    "messages": [
      { "role": "user", "content": "{{$json.message.text}}" }
    ]
  }
  ```

### Node 3 — Telegram Send
- Type: `Telegram`
- Operation: `Send Message`
- Chat ID: `{{$node["Telegram Trigger"].json.message.chat.id}}`
- Text: `{{$node["HTTP Request"].json.content[0].text}}`

---

## 🔧 المتطلبات التقنية

| المتطلب | الحالة |
|---|---|
| n8n on CM5 (port 5678) | ✅ |
| `N8N_SECURE_COOKIE=false` | ✅ |
| `--dns 8.8.8.8 --dns 8.8.4.4` (للوصول لـ api.telegram.org) | ✅ |
| Public HTTPS URL (Telegram يرفض HTTP) | 🟡 trycloudflare مؤقت |
| `WEBHOOK_URL` env var في n8n | ✅ |
| Anthropic API key | ✅ (`igarden-telegram-bot`) |
| Telegram Bot Token | ✅ (في n8n credentials) |

---

## 🚨 الأخطاء التي ظهرت + الحلول

| الخطأ | السبب الفعلي | الحل |
|---|---|---|
| `404` من Anthropic API | اسم model غلط: `claude-sonnet-4-20250514` | تغيير إلى `claude-sonnet-4-5` |
| Telegram يرفض الـ webhook | URL HTTP وليس HTTPS | تشغيل `cloudflared trycloudflare` |
| n8n لا يحلّ `api.telegram.org` | container DNS resolver | `--dns 8.8.8.8 --dns 8.8.4.4` |
| البوت لا يستقبل بعد إعادة التشغيل | trycloudflare URL تغيّر | إعادة publish + تحديث `WEBHOOK_URL` |
| البوت يستقبل لكن لا يرد | Workflow حُفظ كـ Draft | ضغط Publish يدوياً |
| n8n يطلب HTTPS عند الفتح | `N8N_SECURE_COOKIE=true` افتراضي | إعادة إنشاء container مع `=false` |

---

## 🟡 المشكلة الجوهرية القائمة

`trycloudflare.com` يولّد URL **عشوائي جديد** عند كل إعادة تشغيل cloudflared:
- مرة 1: `https://eval-genesis-nationally-poultry.trycloudflare.com`
- مرة 2: `https://picking-precise-powder-blades.trycloudflare.com`

**النتيجة:** بعد كل إعادة تشغيل (CM5 reboot، cloudflared restart)، يجب:
1. أخذ الـ URL الجديد من logs
2. تحديث `WEBHOOK_URL` في n8n env
3. إعادة publish الـ workflow

**الحل المخطط:** سكربت auto-update يقرأ الـ URL الجديد ويحدّث n8n + Telegram automatically (راجع `tasks/pending.md`).

---

## 🔮 الخطوات التالية

- [ ] **سكربت auto-update لـ webhook URL** (P1)
- [ ] **DNS دائم** عبر `n8n.igarden.sa` (يحتاج نقل DNS إلى Cloudflare) (P1)
- [ ] **Multi-user routing** — رسائل عكاش (إدخال) vs علي (كامل) vs الفريق
- [ ] **Vision** — استقبال صور النباتات → Claude Vision → KB
- [ ] **MQTT bridge** — البوت يستعلم عن حالة الحساسات الحيّة
- [ ] **WhatsApp Bot** — بعد استقرار Telegram

---

## 🔗 ملفات ذات صلة

- [CM5 Hub — البنية المضيفة](../infrastructure/cm5-hub.md)
- [tasks/pending.md](../tasks/pending.md)
- [events.md — التاريخ الكامل](../events.md)
- [استراتيجية Claude models](../conversations/2026-04-27/03-claude-models-strategy.md)

---

🌱 **iGarden — ازرع بذكاء** | للحالة الحالية: `grep "^[0-9-]* | telegram-bot " events.md | tail -1`
