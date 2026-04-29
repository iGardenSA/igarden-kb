# 🌐 Cloudflare Tunnel — iGarden-cm5

> **الحالة الحالية:** 🟡 Tunnel صحّي + DNS routing معلّق
> **آخر تحديث:** 2026-04-29
> **مرجع الأحداث:** `grep "^[0-9-]* | cloudflare-tunnel " events.md`

---

## 🎯 الغرض

تأمين وصول HTTPS دائم إلى خدمات CM5 (n8n + Home Assistant + Portainer) دون الحاجة إلى:
- IP عام ثابت
- ngrok مدفوع
- فتح بورتات على الراوتر

---

## 📌 الـ Stack

| العنصر | القيمة |
|---|---|
| اسم الـ Tunnel | `iGarden-cm5` |
| Tunnel ID | `3942be75-672a-4de6-88e4-1c5d526a2274` |
| Container | `cloudflared` على CM5 |
| Restart policy | `unless-stopped` |
| Connections | 4 (jed01 + fra18) |
| Tunnel credentials | على CM5 في `/root/.cloudflared/` فقط — `[REDACTED — see SECRETS.md.example]` |
| Cloudflare account | `info@igarden.sa` |

---

## 🔁 الحالة التشغيلية

```
✅ Tunnel established (Healthy)
✅ cloudflared container running on CM5
✅ Auto-restart on boot (unless-stopped + docker.service enabled)
🟡 DNS routing pending — igarden.sa nameservers على Vercel وليس Cloudflare
🟡 Webhook URL مؤقت عبر trycloudflare (يتغيّر عند restart)
```

---

## 🚧 المشكلة الحالية: DNS

**السبب:** الـ domain `igarden.sa` nameservers على Vercel، لذا في Cloudflare Dashboard → Public Hostnames → الـ dropdown لا يعرض `igarden.sa` كخيار قابل للاستخدام.

### الخيارات المطروحة

| الخيار | الإيجابيات | السلبيات | الحالة |
|---|---|---|---|
| **1. نقل nameservers لـ Cloudflare** | أنظف الحلول، يعطي قوّة DNS كاملة | يكسر الموقع الحالي على Vercel مؤقتاً (TTL propagation) | ⏸️ مؤجَّل |
| **2. subdomain على `pages.dev`** | حل وسط بدون نقل nameservers | يضيف layer إضافي + branding `*.pages.dev` | غير مفضّل |
| **3. الإبقاء على trycloudflare + سكربت auto-update** | لا يكسر شيئاً | URL يتغيّر عند restart → يحتاج سكربت يحدّث n8n + Telegram | ✅ الحل المؤقت الحالي |

### القرار الحالي

**خيار 3** — حتى يستقر العميل 002 + ينتهي عقد الأحساء، ثم نعود لخيار 1.

---

## 🛠️ السكربت المطلوب (Pending)

عند كل restart للـ cloudflared container:

1. قراءة الـ trycloudflare URL الجديد من `docker logs cloudflared`
2. تحديث `WEBHOOK_URL` env في n8n container
3. استدعاء Telegram `setWebhook` بالـ URL الجديد
4. تسجيل الحدث في `events.md`

> 📋 موجود كـ P1 في [`tasks/pending.md`](../tasks/pending.md).

---

## 🔄 محاولة DNS السابقة (2026-04-29)

| الخطوة | النتيجة |
|---|---|
| حذف A record لـ `n8n.igarden.sa` من Vercel DNS | ✅ نُفِّذ |
| إضافة CNAME من Vercel إلى `*.cfargotunnel.com` | ✅ Vercel قبل |
| محاولة ربطه في Cloudflare Public Hostnames | ❌ `igarden.sa` غير قابل للاختيار |
| **النتيجة النهائية** | تراجع — الإبقاء على trycloudflare مؤقتاً |

تم رصدها كحدث `dns-vercel` في `events.md`.

---

## 🔐 الأسرار المرتبطة

| السر | المكان |
|---|---|
| Tunnel credentials JSON | `/root/.cloudflared/3942be75-*.json` على CM5 فقط |
| Cloudflare account password | password manager → vault `iGarden/Accounts` |

> ❌ **لا** تُحفظ في هذا الـ repo.

---

## 📖 مراجع

- [`events.md`](../events.md) → entity `cloudflare-tunnel`
- [`infrastructure/cm5-hub.md`](../infrastructure/cm5-hub.md) → containers list
- [`tasks/pending.md`](../tasks/pending.md) → DNS resolution + webhook auto-update
- [`SECRETS.md.example`](../SECRETS.md.example) → سياسة إدارة tunnel credentials

---

🌱 **iGarden — ازرع بذكاء**
