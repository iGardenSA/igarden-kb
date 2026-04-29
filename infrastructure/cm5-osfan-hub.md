# 🖧 البنية التحتية — CM5 (igarden-hub، عسفان)

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** R&D Hub + Backend مركزي محتمل
> **الحالة:** 🟡 تشغيلي — MQTT credential و Workflow الأول لم يكتملا
> **الموقع الفعلي:** عسفان (شمال جدة)

---

## 📌 الملخص

Compute Module 5 (CM5) في عسفان يلعب دور **مختبر iGarden المركزي**: محاكاة بيانات حساسات، اختبار workflows، وتجهيز البنية التي قد تخدم لاحقاً `app.igarden.sa` كـ Cloud Backend. ليس على المسار الحرج لأي عميل اليوم.

> 📝 **ملاحظة تاريخ:** هذا الملف يوثّق حالة CM5 كما رُصدت في 2026-04-27. تحديث 2026-04-29 يُشير إلى تغيّر الـ IP إلى `192.168.8.102` ووجود Telegram Bot + Cloudflare Tunnel — راجع [`conversations/2026-04-29/full-session-report.md`](../conversations/2026-04-29/full-session-report.md).

---

## 🌐 معلومات الشبكة

| العنصر | القيمة |
|---|---|
| **CM5 IP** | `192.168.8.21` (في 2026-04-27) |
| **Hostname** | `igarden-hub` |
| **الموقع** | مكتب عسفان |

---

## 🔐 وصول SSH

| البند | القيمة |
|---|---|
| **User** | `igarden` |
| **Password auth** | معطّل |
| **Key path** | SSH key مخصّص (في password manager) |
| **Sudo** | `igarden` في sudoers |

---

## 🧱 Stack البرمجي

```
┌─────────────────────────────────────────────────────┐
│  Pi OS Lite 64-bit                                  │
│  ├── Docker + docker-compose                        │
│  │   ├── n8n             (Workflow Automation)      │
│  │   ├── PostgreSQL + TimescaleDB  (Time-series DB) │
│  │   └── Portainer       (Container Management UI)  │
│  └── Mosquitto MQTT      (systemd — ليس Docker)     │
└─────────────────────────────────────────────────────┘
```

> 🔧 **قرار معماري:** Mosquitto على systemd (ليس Docker) لتقليل overhead الشبكة وللاستقرار.

---

## 🐘 PostgreSQL + TimescaleDB

| البند | القيمة |
|---|---|
| **User** | `igarden` |
| **Database** | `igarden_data` |
| **Extension** | TimescaleDB (hypertables للحساسات) |
| **Port** | `5432` (داخل Docker network فقط) |
| **Volume** | bind mount → `/opt/igarden/postgres-data` |

**Schema المتوقع (مستقبلاً):**
```sql
-- hypertable لحساسات كل العملاء
CREATE TABLE sensor_readings (
  time        TIMESTAMPTZ NOT NULL,
  customer_id INT NOT NULL,
  sensor_id   TEXT NOT NULL,
  value       DOUBLE PRECISION,
  unit        TEXT
);
SELECT create_hypertable('sensor_readings', 'time');
```

---

## 📡 Mosquitto MQTT

| البند | القيمة |
|---|---|
| **Broker name** | `igarden-sensors` |
| **Port (LAN)** | `1884` |
| **Auth** | username/password (في password manager) |
| **Persistence** | مُفعَّل → `/var/lib/mosquitto/` |
| **Topics المتوقعة** | `igarden/{customer}/{sensor}/{metric}` |

> ⚠️ **MQTT credential في n8n لم يكتمل** — هذا يعطّل أي workflow يحاول الاشتراك بالـ topics.

---

## 🔄 n8n

| البند | القيمة |
|---|---|
| **URL** | `http://192.168.8.21:5678` (في 2026-04-27) |
| **Owner email** | `info@igarden.sa` |
| **Network** | `postgres_default` (Docker network) |
| **DB backend** | PostgreSQL (نفس instance) |
| **Restart policy** | `unless-stopped` |

**الـ Workflow الموجود:**
- ✅ **Sensor Simulator** (مستورد) — محاكاة 4 حساسات كل 5 دقائق
- ⏳ **Execute Workflow الأول** — لم يُنفَّذ بعد (يحتاج MQTT credential)

---

## 🐳 Portainer

| البند | القيمة |
|---|---|
| **URL** | `http://192.168.8.21:9000` |
| **Admin user** | `igarden-admin` |
| **الدور** | إدارة containers + logs + restart |

---

## 🌐 Docker Networks

| Network | الاستخدام |
|---|---|
| `postgres_default` | يربط n8n + PostgreSQL + Portainer |
| `bridge` (default) | للـ external access |

---

## 🚨 المهام المفتوحة (حالة 2026-04-27)

### 🔴 P0
- [ ] **MQTT credential في n8n** → لتفعيل أي workflow حسّاس للبيانات
- [ ] **تنفيذ Execute Workflow الأول** → اختبار end-to-end (Mosquitto → n8n → PostgreSQL)

### 🟡 P1
- [ ] **Schema migrations** للـ sensor_readings hypertable
- [ ] **Backups دورية** لـ PostgreSQL → Google Drive
- [ ] **Grafana** للتحليلات البصرية
- [ ] **Reverse proxy** (Caddy/Traefik) لتنظيم subdomains داخلياً

### 🟢 P2 (تم لاحقاً في 2026-04-29)
- [x] Telegram Bot عبر n8n + Claude API ✅
- [x] Cloudflare Tunnel على CM5 ✅ (DNS معلّق)
- [x] Claude Code v2.1.121 مثبّت ✅
- [ ] DNS دائم لـ `n8n.igarden.sa` (بعد نقل nameservers)

---

## 🎯 الدور الاستراتيجي

| الأولوية | الدور |
|---|---|
| **اليوم** | R&D Lab + اختبار scenarios |
| **6 أشهر** | Backend مركزي لـ analytics متعددة العملاء |
| **سنة** | محرّك `app.igarden.sa` (لوحة تحكم العميل عن بعد) |

> ⚠️ **ليس على المسار الحرج للعملاء 001/002/003.** كل تركيب ميداني مستقل (HA Container على Pi 5).

---

## 🔗 ملفات ذات صلة

- [استراتيجية تطوّر المشاريع](../architecture/three-projects-evolution.md)
- [قرار HA Container كأساس](../architecture/ha-vs-fastapi-decision.md)
- [Pi 5 العميل 002 — Edge مقابل Hub](./pi5-customer2-ghulah.md)
- [تقرير 2026-04-29 — تحديث IP والإضافات](../conversations/2026-04-29/full-session-report.md)

---

🌱 **iGarden — ازرع بذكاء**
