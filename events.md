# 📅 events.md — سجل أحداث iGarden (Source of Truth)

> **القاعدة:** كل سطر = حدث وقع فعلاً بتاريخ محدّد. آخر حدث لكل entity هو الحقيقة الحالية.
> **الصيغة:** `YYYY-MM-DD | entity | event description`
> **البحث:** `grep "^[0-9-]* | <entity> " events.md | tail -1`

---

## القواعد

1. **التاريخ = متى وقع الحدث فعلاً** (ليس متى كُتب).
2. **التاريخ التقريبي:** استخدم `YYYY-MM-??` للشهر فقط، أو `YYYY-??-??` للسنة فقط.
3. **Entity = اسم قصير ثابت** (cm5, pi5-ghulah, customer-003، إلخ).
4. **حدث جديد لنفس entity → يُضاف في آخر القائمة** (لا يُحذف القديم).
5. **الأحدث يفوز كحقيقة حالية.** القديم يبقى للأرشيف.
6. **الفرز:** بالـ entity ثم بالتاريخ تصاعدياً (داخل كل قسم).

---

## السجل

### company

```
2026-04-27 | company | Tagline finalized: "ازرع بذكاء"
2026-04-27 | company | Long signature locked: "حين تزرع بذكاء، تحصد بثقة"
```

### claude-models

```
2026-04-27 | claude-models | Default model policy adopted: 20% Opus + 70% Sonnet + 10% Haiku
2026-04-27 | claude-models | Sonnet 4.5 set as default in Claude.ai
```

### kb

```
2026-04-27 | kb | Layer 1 → 2 → 3 strategy approved (manual → semi-auto → MCP)
2026-04-27 | kb | Decision: Public GitHub repo iGardenSA/igarden-kb as Single Source of Truth
2026-04-28 | kb | Repo iGardenSA/igarden-kb created (public) on GitHub
2026-04-28 | kb | Initial INDEX.md + README.md committed
2026-04-29 | kb | Full session report 2026-04-29 added
2026-04-29 | kb | SESSIONS.md created
2026-04-29 | kb | 9 decisions + 3 infrastructure + 2 architecture + 3 ops files added
2026-04-29 | kb | events.md adopted as Source of Truth
```

### website

```
2026-04-27 | website | demo.igarden.sa deployed on Vercel (Next.js 16.2.4, fra1)
2026-04-27 | website | Header tagline removed
2026-04-27 | website | Green header icon removed
2026-04-27 | website | sessionStorage adopted (replaced localStorage in demo)
2026-04-27 | website | Subdomain policy adopted: demo / app / shop separated
```

### customer-001

```
2026-02-?? | customer-001 | Sprouting room (Khamis Mushait) deployed on Pi 5 + HA Container
2026-04-27 | customer-001 | Status verified: ~2 months stable in production
```

### customer-002

```
2026-04-?? | customer-002 | Pi 5 IP changed: .209 → .132
2026-04-?? | customer-002 | Pi 5 IP changed: .132 → .235 (current via DHCP reservation)
2026-04-27 | customer-002 | Progress reported: 80% — pH cal, TDS UART, screen, SD pending
2026-04-27 | customer-002 | SD card at 99% capacity (14GB / 15GB) — flagged P0
2026-04-27 | customer-002 | ESP32 igarden-tank online at 192.168.8.137
2026-04-27 | customer-002 | Doser B/C GPIO migrated 16/17 → 25/26 (UART conflict)
```

### customer-003

```
2026-04-13 | customer-003 | Original contract signed (1 hall, 2 arches, 62,100 SAR after VAT)
2026-04-?? | customer-003 | Devices ordered (in transit)
2026-04-27 | customer-003 | Architecture decided: HA Container on Pi 5 (4× ESP32 zones)
2026-04-29 | customer-003 | Contract doubled: 1 hall → 2 halls (needs Opus 4.7 review)
```

### pi5-ghulah

```
2026-04-27 | pi5-ghulah | Stack confirmed: Pi OS Lite + Docker + HA + ESPHome + Mosquitto + Chromium Kiosk
2026-04-27 | pi5-ghulah | Current IP: 192.168.8.235 (user: i, SSH key only)
2026-04-27 | pi5-ghulah | UFW + Fail2ban + daily backups active
```

### pi5-fastapi

```
2026-??-?? | pi5-fastapi | Phase 1 (Foundation) completed
2026-??-?? | pi5-fastapi | Phase 2 (Hardware Layer) completed
2026-??-?? | pi5-fastapi | Phase 3 Session A (Scenario Engine) completed
2026-??-?? | pi5-fastapi | Alerts System (Kill Switch + Cooldown + HA stub) completed
2026-04-27 | pi5-fastapi | 208 unit tests passing
2026-04-27 | pi5-fastapi | Officially paused (resume after 5-10 HA customers)
2026-04-27 | pi5-fastapi | IP conflict flagged: documented as 192.168.8.235 — same as pi5-ghulah, needs verification
```

### cm5

```
2026-04-27 | cm5 | Initial IP: 192.168.8.21 (user: igarden, hostname: igarden-hub)
2026-04-27 | cm5 | Stack: Docker (n8n + PostgreSQL/TimescaleDB + Portainer) + Mosquitto-systemd
2026-04-27 | cm5 | n8n owner: info@igarden.sa, Portainer admin: igarden-admin
2026-04-27 | cm5 | Sensor Simulator workflow imported (4 sensors / 5 min)
2026-04-27 | cm5 | MQTT credential in n8n: incomplete
2026-04-29 | cm5 | IP changed: .21 → .102 (current: 192.168.8.102)
2026-04-29 | cm5 | Claude Code v2.1.121 installed
2026-04-29 | cm5 | n8n container rebuilt with N8N_SECURE_COOKIE=false + DNS 8.8.8.8
2026-04-29 | cm5 | All Docker containers set to restart: unless-stopped
```

### n8n

```
2026-04-27 | n8n | Local URL: http://192.168.8.21:5678 (initial)
2026-04-29 | n8n | Local URL updated: http://192.168.8.102:5678
2026-04-29 | n8n | Webhook URL temporary via trycloudflare (changes on restart)
2026-04-29 | n8n | Telegram → Claude API → Reply workflow active
```

### telegram-bot

```
2026-04-29 | telegram-bot | @igarden_sa_bot activated via n8n + Claude API (claude-sonnet-4-5)
2026-04-29 | telegram-bot | System prompt: Arabic iGarden assistant
```

### cloudflare-tunnel

```
2026-04-29 | cloudflare-tunnel | Tunnel iGarden-cm5 created (ID: 3942be75-672a-4de6-88e4-1c5d526a2274)
2026-04-29 | cloudflare-tunnel | cloudflared container deployed on CM5 (status: Healthy, region: jed01)
2026-04-29 | cloudflare-tunnel | DNS pending: igarden.sa is on Vercel nameservers (not Cloudflare)
```

### mobile-sync

```
2026-04-29 | mobile-sync | rclone installed on phone via Termux
2026-04-29 | mobile-sync | gdrive remote configured
2026-04-29 | mobile-sync | ~/sync-kb.sh deployed (git pull + rclone sync)
2026-04-29 | mobile-sync | cron job set: daily at 22:00
2026-04-29 | mobile-sync | Termux output issue resolved via reinstall
```

---

## استخدام

### للحصول على آخر حالة لكيان معيّن

```bash
grep "^[0-9-]* | cm5 " events.md | tail -1
# → 2026-04-29 | cm5 | All Docker containers set to restart: unless-stopped
```

### لقراءة كل تاريخ كيان

```bash
grep "^[0-9-]* | customer-002 " events.md
```

### لإضافة حدث جديد

أضف سطراً جديداً في القسم المناسب (آخر قسم الـ entity)، بصيغة:
```
YYYY-MM-DD | <entity> | <event description>
```

---

🌱 **iGarden — ازرع بذكاء** | events.md = الحقيقة الحالية
