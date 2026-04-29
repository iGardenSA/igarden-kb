# 🖧 البنية التحتية — CM5 (igarden-hub، عسفان)

> **آخر حدث في events.md:** `grep "^[0-9-]* | cm5 " events.md | tail -1`
> **الحالة الحالية:** 🟢 تشغيلي — CM5 يعمل كـ central hub لـ iGarden
> **الموقع الفعلي:** عسفان (شمال جدة)

---

## 📌 الملخص

Compute Module 5 (CM5) في عسفان يستضيف:
- **n8n** (Workflow Automation) — يشغّل Telegram Bot + workflows مستقبلية
- **PostgreSQL + TimescaleDB** — قاعدة بيانات الحساسات
- **Mosquitto MQTT** — broker للحساسات
- **Portainer** — إدارة containers
- **Cloudflare Tunnel** — وصول من الإنترنت (حالياً عبر trycloudflare)
- **Claude Code v2.1.121** — أداة تطوير مباشرة على الـ hub

---

## 🌐 الشبكة (الحالة الحالية)

| العنصر | القيمة | تاريخ آخر تحديث |
|---|---|---|
| **CM5 IP** | `192.168.8.102` | 2026-04-29 (سابقاً `.21`) |
| **Hostname** | `igarden-hub` | 2026-04-27 |
| **Network LAN** | `192.168.8.0/24` | — |
| **Region cloudflared** | `jed01` (4 connections) | 2026-04-29 |

---

## 🔐 وصول SSH

| البند | القيمة |
|---|---|
| **User** | `igarden` |
| **Password auth** | معطّل |
| **Key path** | SSH key مخصّص (في password manager) |
| **Sudo** | `igarden` في sudoers |
| **اكتشاف IP الجديد** | شاشة + كيبورد مباشرة (SSH من الجوال فشل: No route to host) |

---

## 🧱 Stack البرمجي

```
┌──────────────────────────────────────────────────────┐
│  Pi OS Lite 64-bit                                   │
│  ├── Docker + docker-compose (auto-start on boot)   │
│  │   ├── n8n               ← :5678                   │
│  │   ├── PostgreSQL+Timescale  (igarden_data)        │
│  │   ├── Portainer          ← :9000                  │
│  │   ├── homeassistant      (R&D / dev only)         │
│  │   └── cloudflared        (tunnel iGarden-cm5)     │
│  ├── Mosquitto MQTT (systemd, port 1884)            │
│  ├── Node.js v20.20.2                                │
│  └── Claude Code v2.1.121 (~/igarden-kb)             │
└──────────────────────────────────────────────────────┘
```

> 🔧 **قرار معماري:** Mosquitto على systemd (ليس Docker) لتقليل overhead الشبكة.

---

## 🐳 Docker Containers — كلها على `restart: unless-stopped`

```bash
docker update --restart unless-stopped \
  n8n homeassistant portainer igarden-postgres cloudflared
sudo systemctl enable docker
```

| Container | Image / Source | Port | الدور |
|---|---|---|---|
| `n8n` | `n8nio/n8n` | 5678 | Workflow automation |
| `igarden-postgres` | `timescale/timescaledb` | 5432 (داخلي) | DB حساسات |
| `portainer` | `portainer/portainer-ce` | 9000 | UI إدارة |
| `homeassistant` | `homeassistant/home-assistant` | 8123 | R&D فقط |
| `cloudflared` | `cloudflare/cloudflared` | — | Tunnel للخارج |

---

## 🐘 PostgreSQL + TimescaleDB

| البند | القيمة |
|---|---|
| **Container name** | `igarden-postgres` |
| **User** | `igarden` |
| **Database** | `igarden_data` |
| **Extension** | TimescaleDB (hypertables) |
| **Port** | `5432` (داخل Docker network) |
| **Volume** | bind mount → `/opt/igarden/postgres-data` |
| **Network** | `postgres_default` |

---

## 📡 Mosquitto MQTT

| البند | القيمة |
|---|---|
| **Process manager** | systemd (ليس Docker) |
| **Port** | `1884` |
| **Broker name** | `igarden-sensors` |
| **Auth** | username/password (في password manager) |
| **Persistence** | `/var/lib/mosquitto/` |
| **Topics** | `igarden/{customer}/{sensor}/{metric}` |

> ⚠️ MQTT credential في n8n لم يُعَدّ بعد (راجع `tasks/pending.md`).

---

## 🔄 n8n

| البند | القيمة |
|---|---|
| **Local URL** | `http://192.168.8.102:5678` |
| **Public URL (مؤقت)** | trycloudflare (يتغيّر عند restart) |
| **Owner** | `info@igarden.sa` |
| **DB** | PostgreSQL (نفس instance) |
| **DNS override** | `--dns 8.8.8.8 --dns 8.8.4.4` (حلّ مشكلة الـ DNS داخل container) |
| **Cookie config** | `N8N_SECURE_COOKIE=false` (HTTP-allowed داخل LAN) |

**Workflows النشطة:**
- ✅ **Telegram Bot** — `Telegram Trigger → HTTP (Claude API) → Telegram Send` (راجع `projects/telegram-bot.md`)
- 📦 **Sensor Simulator** — مستورد، لم يُفعَّل (يحتاج MQTT credential)

---

## 🌩️ Cloudflare Tunnel

| البند | القيمة |
|---|---|
| **Tunnel name** | `iGarden-cm5` |
| **Tunnel ID** | `3942be75-672a-4de6-88e4-1c5d526a2274` |
| **Account email** | `info@igarden.sa` |
| **Container** | `cloudflared` (restart: unless-stopped) |
| **Status** | Healthy — 4 connections (jed01 + fra18) |
| **DNS** | ⚠️ معلّق — `igarden.sa` على Vercel nameservers |

**الوضع الحالي:**
- البديل المؤقت: `trycloudflare.com` URLs (متغيّرة عند كل restart)
- الحل الدائم مؤجَّل (راجع `tasks/pending.md`)

---

## 🐳 Portainer

| البند | القيمة |
|---|---|
| **URL** | `http://192.168.8.102:9000` |
| **Admin user** | `igarden-admin` |
| **الدور** | إدارة containers + logs + restart |

---

## 💻 Claude Code

| البند | القيمة |
|---|---|
| **Version** | v2.1.121 (مثبَّت 2026-04-29) |
| **Install** | `npm install -g @anthropic-ai/claude-code` |
| **Node.js** | v20.20.2 (من nodesource setup_20.x) |
| **Login** | OAuth — `info@igarden.sa` |
| **Default model** | Opus 4.7 (1M context — Claude Max) |
| **Working directory** | `~/igarden-kb` |

---

## 🚨 المشاكل المحلولة في جلسة 2026-04-29

| المشكلة | السبب | الحل |
|---|---|---|
| n8n يطلب HTTPS | إعداد `N8N_SECURE_COOKIE=true` افتراضي | إعادة إنشاء container مع `=false` |
| n8n لا يحلّ DNS | container's resolver غير موصول | `--dns 8.8.8.8 --dns 8.8.4.4` |
| Telegram يرفض الـ webhook | يطلب HTTPS public | `cloudflared trycloudflare` |
| Webhook URL ضاع بعد restart | trycloudflare يولّد URL جديد | إضافة `WEBHOOK_URL` env + إعادة publish |
| Workflow draft لا يستقبل | لم يُضغط Publish | re-publish manually |
| Model 404 | اسم Model غلط `claude-sonnet-4-20250514` | تصحيح إلى `claude-sonnet-4-5` |

---

## 🔗 ملفات ذات صلة

- [Telegram Bot Project](../projects/telegram-bot.md)
- [المهام المؤجَّلة](../tasks/pending.md)
- [events.md — السجل الزمني الكامل](../events.md)
- [المعماريات الثلاث](../architecture/three-projects-evolution.md)
- [Pi 5 العميل 002](./pi5-customer2-ghulah.md)

---

🌱 **iGarden — ازرع بذكاء** | للحالة الحالية: `grep "^[0-9-]* | cm5 " events.md | tail -1`
