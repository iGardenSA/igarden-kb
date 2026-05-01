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
2026-04-26 | company | Tagline issued in Tech Appendix v3.0: "نَبني · نُوطّن · نُطوّر — Plant Smart"
2026-04-27 | company | Tagline changed to "زراعة بلا تخمين" — Brand Messaging Supplement v1.0 (supersedes 2026-04-26)
2026-04-27 | company | Tagline finalized: "ازرع بذكاء" (supersedes "زراعة بلا تخمين" same day)
2026-04-27 | company | Long signature locked: "حين تزرع بذكاء، تحصد بثقة"
```

### brand-messaging

```
2026-04-26 | brand-messaging | Master v2.0 §2.3: "نَبني · نُوطّن · نُطوّر" listed as official Tagline
2026-04-26 | brand-messaging | Master v2.0 §2.3: "ازرع بذكاء" listed as secondary/emotional Tagline
2026-04-27 | brand-messaging | Brand Tagline confirmed: "ازرع بذكاء" — for logo, business cards, bio (supersedes "ثانوي" status)
2026-04-27 | brand-messaging | Hero Headline confirmed: "زراعة بلا تخمين" — for website hero + Sunbolah solution slide
2026-04-27 | brand-messaging | Role distinction codified: Brand Tagline ≠ Hero Headline (different funnel stages)
2026-04-27 | brand-messaging | "نَبني · نُوطّن · نُطوّر" reclassified as operational methodology — NOT a marketing Tagline (supersedes Master v2.0 §2.3)
2026-04-27 | brand-messaging | One-Liner adopted: "iGarden — النظام المتكامل الأول للزراعة الذكية في السعودية"
2026-04-27 | brand-messaging | Official Bio (3 lines) adopted
2026-04-27 | brand-messaging | Signature Line confirmed: "حين تزرع بذكاء، تحصد بثقة"
2026-04-27 | brand-messaging | Hierarchy: Brand Tagline → Hero Headline → One-Liner → Bio → Signature
2026-04-27 | brand-messaging | iGarden_Brand_Messaging_v1_0.docx ⚠️ superseded by v1_1 (same day)
2026-04-27 | brand-messaging | iGarden_Brand_Messaging_v1_1.docx adopted (6 sections, 124 paragraphs, RTL, iGarden colors)
2026-04-27 | brand-messaging | LinkedIn 2 posts drafted: visionary tone + founder tone (founder tone preferred for personal account)
2026-04-27 | brand-messaging | Master v2.0 §1.2 + §2.3 flagged for update in v2.1 (replace "نَبني · نُوطّن · نُطوّر" Tagline references)
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
2026-04-29 | kb | INDEX.md original was empty in zip (14 bytes) — reconstructed manually from KB content
2026-04-29 | kb | Reference URL adopted: raw.githubusercontent.com/iGardenSA/igarden-kb/main/README.md
2026-04-29 | kb | Full session report 2026-04-29 added
2026-04-29 | kb | SESSIONS.md created
2026-04-29 | kb | 9 decisions + 3 infrastructure + 2 architecture + 3 ops files added
2026-04-29 | kb | events.md adopted as Source of Truth
2026-04-29 | kb | tasks/pending.md created
2026-04-29 | kb | projects/telegram-bot.md created
2026-04-29 | kb | infrastructure/cm5-osfan-hub.md renamed to cm5-hub.md
2026-04-29 | kb | SESSIONS.md rewritten as comprehensive session log
2026-04-29 | kb | README.md restructured with current-state snapshot + Event-Sourced workflow
2026-04-29 | kb | SECRETS.md.example template created (secret management policy)
2026-04-29 | kb | .gitignore added (excludes secrets.md, .env, *.key, SSH keys, rclone configs)
2026-04-29 | kb | tasks/clarifications-needed.md created (open questions log)
2026-04-29 | kb | projects/cloudflare-tunnel.md created
2026-04-29 | kb | brand/tagline-evolution.md created
2026-04-27 | kb | Strategy: GitHub repo as Single Source of Truth (supersedes "Project Knowledge only")
2026-04-27 | kb | Architecture-strategy: "iGarden = combination of right systems" supersedes "iGarden = full custom platform"
2026-04-30 | kb | Major financial-session expansion: 33 events, customers/004-binladen.md, partnerships/kamal-shajri.md, infrastructure/gosi-mudad-qiwa.md, decisions/2026-04-30-partnership.md added
2026-04-30 | kb | Major correction batch applied to customer-002 (identity, location, contract value, system specs)
2026-04-30 | kb | Recommend creating _meta/entities-glossary.md to prevent name drift
2026-04-30 | kb | _meta/entities-glossary.md created (glossary of canonical entity names)
```

### secrets-incident

```
2026-04-28 21:27 | secrets-incident | ESPHome api_encryption_key + ota_password committed in customers/002-ghulah-lettuce.md (commit 3b07449, from initial KB ZIP)
2026-04-29 04:11 | secrets-incident | Telegram bot token committed in SESSIONS.md + conversations/2026-04-29/full-session-report.md (commit 5004a08)
2026-04-29 ?? | secrets-incident | Repo visibility changed to public (gh repo edit) — leak now world-readable
2026-04-29 12:27 | secrets-incident | ESPHome keys re-committed in infrastructure/pi5-customer2-ghulah.md (commit 907fb07)
2026-04-29 13:21 | secrets-incident | Leak disclosed during session; redaction applied to working tree only (commit f26c050) — git history STILL contains secrets
2026-04-29 | secrets-incident | Anthropic API key 'igarden-telegram-bot' name (not value) mentioned in chat reports
2026-04-29 | secrets-incident | Rotation status: PENDING — user deferred to "tomorrow"; no keys revoked yet
2026-04-30 | secrets-incident | Rotation phase 1 DONE: Telegram bot token + Anthropic API key rotated — old credentials invalidated
2026-04-30 | secrets-incident | Rotation phase 1 remaining: ESPHome keys (3) + PostgreSQL + Mosquitto + n8n basic auth + AP fallback (6 keys still to rotate)
2026-04-29 | secrets-incident | Tools missing on host: git-filter-repo + bfg unavailable — full history scrub deferred
```

### secrets-leak-warning

```
2026-04-29 | secrets-leak-warning | Telegram bot token published in SESSIONS.md (public repo) — ROTATE
2026-04-29 | secrets-leak-warning | ESPHome api_encryption_key + ota_password published in pi5-customer2-ghulah.md (public repo) — ROTATE
2026-04-29 | secrets-leak-warning | Telegram bot token + ESPHome keys REDACTED in current files (commit f26c050) — note: secrets remain in git history
2026-04-29 | secrets-leak-warning | Anthropic API key (igarden-telegram-bot) exposed in chat report — [REDACTED — see password manager] — ROTATE IMMEDIATELY
2026-04-29 | secrets-leak-warning | PostgreSQL password (CM5) exposed in chat report — [REDACTED] — ROTATE
2026-04-29 | secrets-leak-warning | Mosquitto password (igarden-sensors) exposed in chat report — [REDACTED] — ROTATE
2026-04-29 | secrets-leak-warning | n8n Basic Auth password exposed in chat report — [REDACTED] — ROTATE
2026-04-29 | secrets-leak-warning | n8n Encryption Key exposed in chat report — [REDACTED] — DO NOT ROTATE without re-encrypting credentials first
2026-04-29 | secrets-leak-warning | ESP32 AP fallback password exposed in chat report — [REDACTED] — ROTATE
2026-04-29 | secrets-leak-warning | Customer-003 IBAN + tax ID + customer name exposed in chat report — moved to ~/igarden-secrets/
```

### github-repo

```
2026-04-28 | github-repo | iGardenSA/igarden-kb created on GitHub
2026-04-28 | github-repo | First commit + push successful from Termux
2026-04-29 | github-repo | Visibility changed to public via gh repo edit --visibility public
2026-04-29 | github-repo | Confirmed: Claude.ai reads via raw URL without MCP connector
```

### website

```
2026-04-27 | website | Smart OS Demo built — 1196 lines React, 4 tabs, 12 crops × 4 zones
2026-04-27 | website | iGardenSA/igarden-demo public repo created
2026-04-27 | website | Vercel project created: igarden-demo (org: i-garden-sa, region: fra1)
2026-04-27 | website | commit 7670aac — replaced HTML Static with Next.js 16
2026-04-27 | website | 5 Vercel deployments failed (Framework Preset old, Next 15 mismatch)
2026-04-27 | website | commit cd40a50 — fixed 5 build errors (syntax + types + Next 15→16)
2026-04-27 | website | Stack final: Next.js 16.2.4 + React 19 + TypeScript 5 + Recharts 2.15 + lucide-react 0.468
2026-04-27 | website | tsconfig: jsx="react-jsx" (supersedes "preserve" — Next 16 compat)
2026-04-27 | website | demo.igarden.sa deployed on Vercel (Next.js 16.2.4, fra1)
2026-04-27 | website | Header tagline removed
2026-04-27 | website | commit 1b7a9e5 — Logo green icon (supersedes white) + tagline removed from Header
2026-04-27 | website | commit c28115e — sessionStorage adopted (replaced localStorage in demo)
2026-04-30 | website | igarden.sa main site deployed on Production — verified live
2026-04-27 | website | One-Liner card removed from Footer
2026-04-27 | website | Subdomain policy adopted: demo / app / shop separated
2026-04-27 | website | Bundle size: ~140KB (with logos)
```

### customer-001

```
2026-02-?? | customer-001 | Sprouting room (Khamis Mushait) deployed on Pi 5 + HA Container
2026-04-27 | customer-001 | Status verified: ~2 months stable in production
```

### customer-002

```
2026-04-?? | customer-002 | Pi 5 historical IP: 192.168.8.126 (oldest known, pre-HAOS)
2026-04-?? | customer-002 | Pi 5 IP: 192.168.8.132 (HAOS era, pre-2026-04-22)
2026-04-22 | customer-002 | Pi 5 migrated HAOS → Pi OS Lite + Docker + HA Container; IP changed .132 → .209
2026-04-22 | customer-002 | sudo NOPASSWD enabled; UFW + Fail2ban + SSH key-only authentication
2026-04-22 | customer-002 | Daily backups in ~/backups/ (first snapshot 69MB)
2026-04-22 | customer-002 | First HA Dashboard "iGarden" (Arabic) deployed
2026-04-22 | customer-002 | ESP32 igarden-tank: API encryption + OTA password [REDACTED — see password manager]
2026-04-22 | customer-002 | ESP32 AP fallback SSID: Igarden-Tank Fallback — password [REDACTED — see password manager]
2026-04-22 | customer-002 | ESP32 GPIO mapping — SDA=21, SCL=22, 1-Wire=4 (DS18B20 + 4.7kΩ pullup), UART RX=16/TX=17
2026-04-22 | customer-002 | ESP32 Relays — 27=Pump1, 14=Pump2, 12=Mixer, 13=Valve, 5=DoserA, 25=DoserB, 26=DoserC, 2=pH-Down
2026-04-22 | customer-002 | ESP32 ADS1115 @ 0x48 — A0=pH, A1-A3 reserved
2026-04-22 | customer-002 | ESP32 pH equation (current, needs calibration): (x * 3.5) + 0.0
2026-04-22 | customer-002 | ESP32 MQTT topic prefix: igarden/tank, user: mqtt_user
2026-04-24 | customer-002 | Chromium Kiosk installed on DSI screen (working)
2026-04-24 | customer-002 | Touch screen + USB devices not detected (Wayland/cage limitation)
2026-04-?? | customer-002 | Pi 5 IP changed: .209 → .132
2026-04-?? | customer-002 | Pi 5 IP changed: .132 → .235 (current via DHCP reservation)
2026-04-27 | customer-002 | Progress reported: 80% — pH cal, TDS UART, screen, SD pending
2026-04-27 | customer-002 | SD card at 99% capacity (14GB / 15GB) — flagged P0
2026-04-27 | customer-002 | ESP32 igarden-tank online at 192.168.8.137
2026-04-27 | customer-002 | Doser B/C GPIO migrated 16/17 → 25/26 (UART conflict)
2026-04-30 | customer-002 | CORRECTION: customer name = Najat Ali Hassan Hanbouli (NOT "Aljawhara Alqahtani" — earlier assumption wrong)
2026-04-30 | customer-002 | National ID: 109960229
2026-04-30 | customer-002 | CORRECTION: site = Huda Al-Sham, NW Jeddah, Makkah region (NOT Ahsa)
2026-04-30 | customer-002 | Greenhouse spec: 40m × 9m × 3.2m = 360 m², single arched cooled (height 3.2m supersedes 3.5m draft)
2026-04-30 | customer-002 | CORRECTION: contract value = 75,900 SAR incl. VAT (supersedes 30,000 logged earlier)
2026-04-30 | customer-002 | Breakdown: 19K greenhouse + 27K hydroponics + 10K smart + 10K maintenance + 9.9K VAT
2026-04-30 | customer-002 | System type: Raft DWC, 7,000 seedling capacity
2026-04-30 | customer-002 | Troughs: 2 × 30m × 4m × 20cm = 240 m³ water volume
2026-04-30 | customer-002 | Cooling: Italian 1.5HP × 2 fans, 45,000 m³/h (supersedes "Chinese fans" assumption)
2026-04-30 | customer-002 | CORRECTION: payment schedule = 50/20/20/10 (supersedes 40/25/25/10)
2026-04-30 | customer-002 | Warranty: 10y structure, 1y electronics, 3-month full maintenance
2026-04-30 | customer-002 | Bank: Al Rajhi acct 618000010006086484051 / IBAN SA0680000618608016484051
2026-04-30 | customer-002 | Daily power: 38-60 kWh summer, 20-30 kWh winter
2026-04-30 | customer-002 | Air pumps add 24/7 base load ~1 kW continuous (Raft requirement — sizes battery bank)
2026-04-30 | customer-002 | Phase-2 reference price: 75,900 SAR per identical greenhouse (×4 = 276-301K supersedes 362-387K estimate)
2026-04-30 | customer-002 | CORRECTION: contracting entity = iGarden ("Rukn Al-Hadeeqah Al-Thakiyah" was a drafting error)
2026-04-30 | customer-002 | Latest contract version received (Drive ID: 1XQa1M2sgpQN_Cxj_r5tkXAPdLH7GEzs9_2m_ihDp_WE) — supersedes old draft 1oG...
2026-04-30 | customer-002 | Completion: 85% (supersedes 80% from 2026-04-27)
2026-04-30 | customer-002 | New requirement: site lacks grid power — solar solution needed
```

### customer-003

```
2026-04-13 | customer-003 | Original contract signed (1 hall, 2 arches) — financial details + customer PII in ~/igarden-secrets/contracts/ahsa-rayana-2026-04-13.md (NOT in this repo)
2026-04-13 | customer-003 | Tech specs (original): 2 connected arches 18×35m, 1400 Dutch buckets (700/arch), 4× 500L tanks, 12 doser pumps (3/tank), 1× 7" master + 3× sub controllers
2026-04-13 | customer-003 | Warranty (original): system 24mo, control 12mo, maintenance 60d
2026-04-13 | customer-003 | Customer notified about possible delivery delay (devices needed extra lead time)
2026-04-?? | customer-003 | Devices ordered (in transit, ETA ~2026-05-04)
2026-04-27 | customer-003 | Team assigned: Ali + osfan technical team
2026-04-27 | customer-003 | Architecture decided: HA Container on Pi 5 (4× ESP32 zones)
2026-04-29 | customer-003 | Contract doubled: 1 hall → 2 halls (needs Opus 4.7 review — full doubled-contract details in ~/igarden-secrets/)
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
2026-04-22 | cm5 | Initial setup completed — Hub: n8n + PostgreSQL/TimescaleDB + Portainer + Mosquitto-systemd
2026-04-22 | cm5 | Decision: Mosquitto runs as systemd service (NOT Docker container)
2026-04-22 | cm5 | PostgreSQL DB: igarden_data (image: timescale/timescaledb:latest-pg16)
2026-04-22 | cm5 | Mosquitto ports: 127.0.0.1:1883 (local) + 0.0.0.0:1884 (LAN)
2026-04-22 | cm5 | Docker network postgres_default (links igarden-postgres + n8n)
2026-04-22 | cm5 | Docker bridge IP: 172.17.0.1 (used by n8n MQTT credential)
2026-04-22 | cm5 | n8n credential: PostgreSQL host=igarden-postgres (container name, NOT host.docker.internal)
2026-04-22 | cm5 | Mosquitto user: igarden-sensors — password [REDACTED — see password manager]
2026-04-22 | cm5 | PostgreSQL user: igarden — password [REDACTED — see password manager]
2026-04-22 | cm5 | n8n Basic Auth user: igarden — password [REDACTED — see password manager]
2026-04-22 | cm5 | n8n Encryption Key: [REDACTED — see password manager] (do not rotate without re-encrypting credentials)
2026-04-22 | cm5 | Portainer admin: igarden-admin — password [REDACTED — see password manager], port 127.0.0.1:9000
2026-04-22 | cm5 | n8n container port: 0.0.0.0:5678 → 5678
2026-04-27 | cm5 | Initial IP: 192.168.8.21 (user: igarden, hostname: igarden-hub)
2026-04-27 | cm5 | Stack: Docker (n8n + PostgreSQL/TimescaleDB + Portainer) + Mosquitto-systemd
2026-04-27 | cm5 | n8n owner: info@igarden.sa, Portainer admin: igarden-admin
2026-04-27 | cm5 | Sensor Simulator workflow imported (4 sensors / 5 min)
2026-04-27 | cm5 | MQTT credential in n8n: incomplete
2026-04-29 | cm5 | Discovered locally via direct keyboard+screen (SSH from mobile failed: No route to host)
2026-04-29 | cm5 | IP changed: .21 → .102 (current: 192.168.8.102)
2026-04-29 | cm5 | Node.js v20.20.2 installed (apt + nodesource setup_20.x)
2026-04-29 | cm5 | Claude Code v2.1.121 installed (npm install -g @anthropic-ai/claude-code)
2026-04-29 | cm5 | n8n container rebuilt with N8N_SECURE_COOKIE=false + DNS 8.8.8.8
2026-04-29 | cm5 | All Docker containers set to restart: unless-stopped (n8n + homeassistant + portainer + igarden-postgres)
2026-04-29 | cm5 | systemctl enable docker (auto-start on boot)
2026-04-29 | cm5 | cloudflared added as 5th persistent container
```

### claude-code

```
2026-04-29 | claude-code | v2.1.121 installed on CM5 (global npm)
2026-04-29 | claude-code | OAuth login completed (Welcome back Ali, Opus 4.7 1M ctx, info@igarden.sa)
2026-04-29 | claude-code | Working directory set: ~/igarden-kb on CM5
```

### n8n

```
2026-04-27 | n8n | Local URL: http://192.168.8.21:5678 (initial)
2026-04-29 | n8n | Old container deleted (HTTPS-only blocked access); basic auth credentials lost
2026-04-29 | n8n | Recreated with N8N_SECURE_COOKIE=false (HTTP allowed in LAN)
2026-04-29 | n8n | DNS resolution fixed via --dns 8.8.8.8 --dns 8.8.4.4 (verified: ping api.telegram.org)
2026-04-29 | n8n | Local URL updated: http://192.168.8.102:5678
2026-04-29 | n8n | WEBHOOK_URL env variable added (trycloudflare URL)
2026-04-29 | n8n | First trycloudflare URL: https://eval-genesis-nationally-poultry.trycloudflare.com (expired)
2026-04-29 | n8n | Second trycloudflare URL: https://picking-precise-powder-blades.trycloudflare.com
2026-04-29 | n8n | Webhook URL temporary via trycloudflare (changes on restart)
2026-04-29 | n8n | Telegram → Claude API → Reply workflow active (3 nodes)
2026-04-30 | n8n | Webhook stable: n8n.igarden.work → garden-hub:5678 (no more trycloudflare URL changes)
2026-04-30 | n8n | iGarden Telegram Bot @igarden_sa_bot fully operational
```

### telegram-bot

```
2026-04-29 | telegram-bot | Decision: Telegram chosen over WhatsApp (free, 2 days vs 1 week + fees)
2026-04-29 | telegram-bot | Created via BotFather (/newbot) — name: iGarden Assistant
2026-04-29 | telegram-bot | Username: @igarden_sa_bot
2026-04-29 | telegram-bot | Token issued (stored externally, NOT in this repo)
2026-04-29 | telegram-bot | Workflow imported as 3 nodes: Telegram Trigger → HTTP Claude API → Telegram Send
2026-04-29 | telegram-bot | Bug fix: model name claude-sonnet-4-20250514 → claude-sonnet-4-5
2026-04-29 | telegram-bot | Fix: workflow stuck as draft — re-published manually
2026-04-29 | telegram-bot | Activated via n8n + Claude API (claude-sonnet-4-5)
2026-04-29 | telegram-bot | System prompt: Arabic iGarden assistant
2026-04-29 | telegram-bot | Verified: receives Arabic messages and replies with iGarden context
2026-04-30 | telegram-bot | Token ROTATED [REDACTED — see password manager] — old token (exposed in git history) revoked via BotFather
```

### telegram

```
2026-05-01 | telegram | P0: Block 1A+1B — Channel @igarden_sa setup + Workflow A
2026-05-01 | telegram | P0: Block 2A — rotate exposed Telegram + Anthropic tokens
2026-05-01 | telegram | P1: Block 3A — Workflow B weekly sensors report
2026-05-01 | telegram | P1: Block 4A+4B — customer groups + routing
2026-05-01 | telegram | P2: Block 5A+5B — bot roles + commands
2026-05-01 | telegram | P2: Block 6A — Vision integration
2026-05-01 | telegram | P2: Block 6B — MQTT bridge
2026-05-01 | telegram | P3: Block 6C — stable webhook (replace trycloudflare)
```

### anthropic-api

```
2026-04-27 | anthropic-api | Balance snapshot: $24.00 of $28.75 original credit
2026-04-29 | anthropic-api | New API key created: name "igarden-telegram-bot", workspace Default
2026-04-29 | anthropic-api | Key stored in n8n HTTP node only (NOT in this repo)
2026-04-30 | anthropic-api | Key ROTATED [REDACTED — see password manager] — old key (igarden-telegram-bot, mentioned in chat reports) disabled in Console
```

### vercel-account

```
2026-04-27 | vercel-account | Pro Trial active — 9 days remaining (deadline 2026-05-07)
2026-04-27 | vercel-account | Org: i-garden-sa
2026-04-27 | vercel-account | Hosts: igarden-demo (demo.igarden.sa), main site (igarden.sa)
```

### wifi

```
2026-04-22 | wifi | Osfan station SSID: IGARDEN_EXT — password [REDACTED — see password manager]
```

### contract-ahsa

```
2026-04-13 | contract-ahsa | Signed — full PDF + financial details in ~/igarden-secrets/contracts/ahsa-rayana-2026-04-13.md
2026-04-13 | contract-ahsa | Customer name + tax ID + IBAN [REDACTED — see ~/igarden-secrets/]
2026-04-27 | contract-ahsa | Doubled (1 hall → 2 halls) — pending Opus 4.7 re-analysis
```

### cloudflare-tunnel

```
2026-04-29 | cloudflare-tunnel | Cloudflare account created (info@igarden.sa)
2026-04-29 | cloudflare-tunnel | Tunnel iGarden-cm5 created (ID: 3942be75-672a-4de6-88e4-1c5d526a2274)
2026-04-29 | cloudflare-tunnel | cloudflared container deployed on CM5 (restart: unless-stopped)
2026-04-29 | cloudflare-tunnel | Status: Healthy — 4 connections (jed01 + fra18)
2026-04-29 | cloudflare-tunnel | DNS attempt: deleted Vercel A record, added CNAME — Vercel accepted
2026-04-29 | cloudflare-tunnel | DNS attempt failed: igarden.sa not selectable in Cloudflare Public Hostname dropdown (nameservers on Vercel)
2026-04-29 | cloudflare-tunnel | Decision deferred: keep trycloudflare temp, plan permanent later
2026-04-29 | cloudflare-tunnel | DNS pending: igarden.sa is on Vercel nameservers (not Cloudflare)
2026-04-30 | cloudflare-tunnel | Permanent tunnel achieved via igarden.work domain (Cloudflare-native DNS) — supersedes trycloudflare temp solution
2026-04-30 | cloudflare-tunnel | cloudflared running as systemd service on igarden-hub (not Docker container) — more reliable
2026-04-30 | cloudflare-tunnel | NEW tunnel created for igarden.work: ID 960b1969-8ac9-4146-bf96-5998421536cf (supersedes 3942be75-... iGarden-cm5 tunnel from 2026-04-29)
2026-04-30 | cloudflare-tunnel | Decision: Subdomain Delegation chosen over full DNS migration (igarden.sa stays on Vercel)
```

### dns-vercel

```
2026-04-29 | dns-vercel | n8n A record removed from Vercel DNS
2026-04-29 | dns-vercel | CNAME added pointing to *.cfargotunnel.com (accepted by Vercel)
2026-04-29 | dns-vercel | Reverted: igarden.sa nameservers stayed on Vercel; trycloudflare retained as temp solution
```

### mobile-sync

```
2026-04-29 | mobile-sync | rclone installed on phone via Termux
2026-04-29 | mobile-sync | gdrive remote configured (OAuth via browser, token pasted manually)
2026-04-29 | mobile-sync | rclone verified: visible folders Master Doc Archive, محطة عسفان, etc.
2026-04-29 | mobile-sync | ~/sync-kb.sh deployed (git pull + rclone sync gdrive:iGarden-KB)
2026-04-29 | mobile-sync | cron job set via cronie: daily at 22:00 with sync.log
2026-04-29 | mobile-sync | Termux output issue resolved via reinstall
```

### termux

```
2026-04-29 | termux | git, gh, unzip installed (Android workstation when laptop unavailable)
2026-04-29 | termux | Issue: cat/echo silent output — diagnosed as storage permissions
2026-04-29 | termux | Fix: termux-setup-storage + full reinstall
2026-04-29 | termux | rclone installed (with warning, but functional)
2026-04-29 | termux | cronie installed for daily sync automation
2026-04-29 | termux | KB zip path discovered: /storage/emulated/0/Download/igarden_kb_v1/igarden_kb/
2026-04-29 | termux | Failed approach: ssh-dss to legacy device (192.168.8.172) — algorithm not supported
```

### tailnet

```
2026-04-29 | tailnet | Tailnet device map documented: hp-elitebook, ali-mobile, garden-hub, vision-hub, dell-osfan
2026-04-29 | tailnet | Tailscale account decision: ali@igarden.sa
2026-04-29 | tailnet | Hostname for laptop in Tailnet set: hp-elitebook
2026-04-29 | tailnet | Setup order locked: laptop → Note 22 → CM5 → Pi 5
2026-04-29 | tailnet | Shared layer composition adopted: Notion + Drive + GitHub + Tailscale + Claude Projects
2026-04-30 | tailnet | Tailnet operational: hp-elitebook + igarden-hub + s24-ultra connected
2026-04-30 | tailnet | Tailscale IPs assigned: hp-elitebook (100.98.152.19) + igarden-hub (100.125.96.50) + s24-ultra (100.69.11.105)
2026-04-30 | tailnet | Account: info@igarden.sa — Trial 14 days
2026-04-30 | tailnet | n8n accessible from mobile via Tailscale: igarden-hub:5678
2026-04-30 | tailnet | SSH verified working over Tailnet: hp-elitebook ↔ igarden-hub
```

### igarden-work

```
2026-04-30 | igarden-work | Domain igarden.work registered on Cloudflare — $8.20/year
2026-04-30 | igarden-work | DNS managed natively on Cloudflare (NOT Vercel — solves the DNS conflict for igarden.sa)
2026-04-30 | igarden-work | n8n.igarden.work → garden-hub:5678 — accessible from internet
2026-04-30 | igarden-work | api.igarden.work → garden-hub:8000 — ready (FastAPI Native eventual host)
```

### founder

```
2026-04-29 | founder | Daily workflow customization started: laptop ↔ Note 22 link
2026-04-29 | founder | Full ecosystem map drawn: laptop + mobile + shared layer
2026-04-29 | founder | Tailscale install commands for Linux Mint 22 received and ready to execute
```

### github-mastery

```
2026-05-01 | github-mastery | 30-day learning plan adopted (4 weeks: basics + security + collab + CI/CD)
2026-05-01 | github-mastery | Plan saved at tasks/learning/github-mastery-30day.md (30 daily tasks)
2026-05-01 | github-mastery | Week 2 (security) flagged as highest priority — leverages scripts/igarden-security-fix.sh
```

### ai-daily-routine

```
2026-05-01 | ai-daily-routine | Strategic decision: Daily AI tools/updates research adopted as core daily routine
2026-05-01 | ai-daily-routine | 3-layer system designed (sources → Claude filter → Telegram + KB archive)
2026-05-01 | ai-daily-routine | Time slot fixed: 21:00 local (evening review before sleep)
2026-05-01 | ai-daily-routine | Language locked: Arabic only
2026-05-01 | ai-daily-routine | Sources locked (3 only): Ben's Bites + Anthropic News + The Rundown AI
2026-05-01 | ai-daily-routine | Weekly cadence: Sun-Thu reading, Fri review, Sat rest
2026-05-01 | ai-daily-routine | Phase 1 (manual) starts 2026-05-02
2026-05-01 | ai-daily-routine | Phase 2 (n8n automation on CM5) scheduled review: 2026-05-16
2026-05-01 | ai-daily-routine | Android alarm configured (21:00, daily 7 days/week)
2026-05-01 | ai-daily-routine | Daily brief markdown template defined (5 sections)
2026-05-01 | ai-daily-routine | KB archive path proposed: kb/ai-daily/YYYY-MM/DD.md
2026-05-01 | ai-daily-routine | Strategic decision: daily AI tools/updates research adopted as core daily routine
2026-05-01 | ai-daily-routine | Phase 2 (n8n automation on CM5) scheduled review date: 2026-05-16
2026-05-01 | ai-daily-routine | Daily alarm configured on Android (21:00, all 7 days) — pending first-night test
2026-05-01 | ai-daily-routine | KB archive path: ai-daily/YYYY-MM/DD.md
```

### hq-strategy

```
2026-04-24 | hq-strategy | HQ Strategy Session opened (48-hour intensive: 24-25 April)
2026-04-25 | hq-strategy | CLAUDE.md v2.0 produced (758 lines, +56% from v1.x, 14 ADRs T001-T014, 6 new T009-T014)
2026-04-25 | hq-strategy | README.md rebuilt (28 → 290 lines, Shields.io + Quick Start + Tech Stack)
2026-04-25 | hq-strategy | CHANGELOG_CLAUDE_md.md created (v1.1 → v1.2 → v2.0 evolution)
2026-04-25 | hq-strategy | iGarden_Web_Rebuild_Prompt.txt produced (274 lines — covers igarden.sa + shop + demo + product pages)
2026-04-25 | hq-strategy | iGarden_Presentations_Prompt.txt produced (381 lines — 5 pitch types + 4 profile types)
2026-04-25 | hq-strategy | iGarden_Gemini_Gem_Instructions produced (473 lines, .md + .txt)
2026-04-25 | hq-strategy | PROJECT_STATE.md concept introduced (369 lines) — cross-conversation sync file
2026-04-25 | hq-strategy | BLOCK-006 archive system proposed (16 sections for Master Command)
2026-04-25 | hq-strategy | Hybrid AI architecture mapped: CM5 + Pi 5 + Dell + Mint roles distributed
2026-04-25 | hq-strategy | Vision AI plan: Pi 5 + AI HAT + IMX500
2026-04-25 | hq-strategy | Session closed; Master Doc still on v1.0 in Project KB (gap flagged for v1.5 build)
2026-04-26 | hq-strategy | BLOCK-010 session (Master Doc v2.0 + Tech Appendix v3.0 rebuild) — compacted once
2026-04-26 | hq-strategy | Master Doc v2.0 produced (2,684 lines / 28 sections) — supersedes earlier v1.5 plan
2026-04-26 | hq-strategy | Tech Appendix v3.0 produced (17 sections / 14 ADRs T001-T014)
2026-04-26 | hq-strategy | Gemini Gem Instructions v2.0 produced (3 formats: TXT/MD/DOCX)
2026-04-26 | hq-strategy | Architecture regions expanded: 5 regions (was 3)
2026-04-26 | hq-strategy | Master Doc Archive Policy adopted (permanent versioning policy)
2026-04-26 | hq-strategy | v1.4 deleted by mistake → recovered → produced v2.0 better
2026-04-29 | hq-strategy | PROJECT_STATE.md approach SUPERSEDED by events.md as Source of Truth (different mechanism, same purpose)
```

### pitch-deck

```
2026-04-25 | pitch-deck | Pitch Sunbolah v2.1 produced (16 slides, RTL clean, real logos, Brand Guidelines v1.0 compliant, Speaker Notes per slide)
2026-04-25 | pitch-deck | Files: iGarden_Pitch_Sunbolah_v21.pptx (3 MB) + .pdf (546 KB)
2026-04-27 | pitch-deck | Original 12-slide deck reviewed and approved as final structure baseline
2026-04-27 | pitch-deck | Cover slide (PDF v2.4) confirmed as final reference
2026-04-27 | pitch-deck | Philosophy slide ("نبني نوطّن نطوّر") confirmed as final reference
2026-04-27 | pitch-deck | Challenges slide confirmed as final reference
2026-04-27 | pitch-deck | Hero proposal "زراعة بلا تخمين" for Cover REJECTED (current version kept)
2026-04-28 | pitch-deck | One-Liner + Bio slide DELETED (not pitch-worthy as standalone)
2026-04-28 | pitch-deck | Final structure locked: 12 original slides ONLY (no AI additions)
2026-04-28 | pitch-deck | Philosophy slide v2.1 prompt generated (unified Tajawal)
2026-04-28 | pitch-deck | Full 12-slide analysis completed with P0/P1/P2 notes
2026-04-28 | pitch-deck | Proposed "Strategic Alignment" slide REJECTED (AI suggestion not requested)
2026-04-28 | pitch-deck | Proposed 16-slide structure REJECTED — kept 12 original
2026-04-29 | pitch-deck | Original PPTX text fully extracted and analyzed
2026-04-29 | pitch-deck | S6 (Market): SAM conflict — deck=2.5B vs Master Doc=4.2B — UNRESOLVED
2026-04-29 | pitch-deck | S6 (Market): SOM conflict — deck=125M vs Master Doc=50M — UNRESOLVED
2026-04-29 | pitch-deck | S11 (Team): "م. قائد التطوير الرقمي" placeholder still unresolved (P0)
2026-04-29 | pitch-deck | S11 (Team): Ayman title wrong — current "كبير المهندسين" → correct "R&D Director, Co-founder 25%"
2026-04-29 | pitch-deck | S11 (Team): Mohammed title wrong — current "رئيس العمليات" → correct "Co-founder Funder 25%"
2026-04-26 | pitch-deck | igarden_sunbolah_2026_pitch.pptx — first version uploaded for review
2026-04-28 | pitch-deck | Redesigned version uploaded — score 8.4/10
2026-04-28 | pitch-deck | Final structure SUPERSEDES 12-slide (locked 2026-04-28): now 13 slides with Competitive added
2026-04-28 | pitch-deck | 16-slide proposal REJECTED (redundant for accelerator pitch)
2026-04-28 | pitch-deck | 14-slide external proposal REJECTED (closer to company overview, not pitch)
2026-04-28 | pitch-deck | 11-slide structure REJECTED (no Competitive + Traction not split)
2026-04-28 | pitch-deck | Slide structure decision: Competitive Analysis added between Market and Business Model
2026-04-28 | pitch-deck | Slide 02 changed: "Why Now / Vision 2030 + MEWA" replaces "About Us / Bio" (Sunbolah is MEWA-affiliated)
2026-04-28 | pitch-deck | Slide 12: Roadmap + Ask MERGED into one slide (time pressure + avoid duplication)
2026-04-28 | pitch-deck | Differentiator: "AI as 4th team member" added (vs other pitch teams)
2026-04-28 | pitch-deck | Philosophy slide repositioned: 02 → 04 Solution (logical sequence)
2026-04-28 | pitch-deck | Sidebar (left vertical strip) REMOVED from approved template
2026-04-28 | pitch-deck | Final filename: igarden_sunbolah_2026_redesigned_20260428063310.pptx — score 8.4/10
2026-04-28 | pitch-deck | Full 13-slide content text approved
2026-04-29 | pitch-deck | Page-by-page design review prompt completed
```

### pitch-tool

```
2026-04-27 | pitch-tool | Pitch.com selected (initial choice)
2026-04-27 | pitch-tool | Pitch.com upgraded to Pro at $25/month (Tajawal upload + Brand Kit + PPTX export no watermark)
2026-04-27 | pitch-tool | Tajawal (4 weights) installed in Pitch Pro Brand Kit
2026-04-27 | pitch-tool | Style Builder configured with 5 iGarden colors + RGBA
2026-04-27 | pitch-tool | Theme saved as "iGarden Sunbolah Theme"
2026-04-27 | pitch-tool | Style Builder sections set: Link, Title, Headline, Subheadline, Normal, Small, Table, Chart, Shape
2026-04-28 | pitch-tool | Strategy shift: Pitch-only → Gamma + Pitch dual workflow
2026-04-28 | pitch-tool | Gamma adopted for slide generation (speed); Pitch retained for final polish
2026-04-28 | pitch-tool | Gamma credit balance: 400 points at conversation time
2026-04-28 | pitch-tool | Gamma limitation: cannot upload Tajawal directly — Cairo as fallback
2026-04-28 | pitch-tool | Jenspark mentioned as alternative generation tool
2026-04-28 | pitch-tool | Final tool stack: Gamma (generate) → Pitch Pro (Tajawal + brand polish + PPTX export)
```

### pitch-brand

```
2026-04-27 | pitch-brand | Color: Deep Forest Green RGBA(15, 61, 46, 1)
2026-04-27 | pitch-brand | Color: Corporate Green RGBA(27, 94, 63, 1)
2026-04-27 | pitch-brand | Color: Lime Accent RGBA(124, 179, 66, 1)
2026-04-27 | pitch-brand | Color: Bright Lime RGBA(165, 214, 63, 1)
2026-04-27 | pitch-brand | Color: Cream RGBA(250, 250, 247, 1)
2026-04-27 | pitch-brand | Color slot 5 was Gradient by default — converted to Solid Corporate Green
2026-04-28 | pitch-brand | Typography rule: Tajawal (Regular/Medium/Bold/ExtraBold) for ALL text — Arabic and English (no Poppins)
```

### brand

```
2026-04-28 | brand | Unified typography rule adopted: Tajawal for everything (replaces Tajawal+Poppins mix)
2026-04-29 | brand | Brand Messaging v1.1 declared mandatory reference for all content across platforms
2026-04-28 | brand | Slide background: light F4F7F4 default (cover stays dark) — partially overridden in implementation
```

### igarden-company

```
????-??-?? | igarden-company | SAIP industrial design #423450193 registered (under Ali M. Ghanima)
????-??-?? | igarden-company | MISA investment license #24926249716 obtained (active)
????-??-?? | igarden-company | Osfan R&D Station established (Ghulah, north Jeddah)
????-??-?? | igarden-company | 500K+ SAR cumulative revenue achieved
????-??-?? | igarden-company | 1,000+ active customers across multiple Saudi regions (definition pending)
2025-??-?? | igarden-company | Agrofood 2025 Jeddah — official presence
2026-04-26 | igarden-company | Partner name correction: "م. أيمن حسين المخزوم" (NOT "المخزومي") per MISA license #1490123 — mandatory across all docs
2026-04-26 | igarden-company | Equity split confirmed: Ali 50% / Ayman 25% / Mohammed Al-Kuthayri 25%
2026-04-26 | igarden-company | Trademark "iGarden" + "الحديقة الذكية" + Tagline NOT yet registered in SAIP — flagged P0 legal risk
```

### igarden-tower

```
????-??-?? | igarden-tower | Aeroponics system designed locally — tolerates +45°C
????-??-?? | igarden-tower | Water savings: 95% vs traditional farming (was previously documented as 60% — superseded)
????-??-?? | igarden-tower | Productivity: 3× per square meter
????-??-?? | igarden-tower | Lifespan: 3× imported alternatives
```

### igarden-smart-os

```
2025-??-?? | igarden-smart-os | Live in Osfan station — production system
2025-??-?? | igarden-smart-os | 208 unit tests passing (FastAPI Native)
????-??-?? | igarden-smart-os | Architecture: 70% local (PDPL) + 30% cloud — hybrid
????-??-?? | igarden-smart-os | Stack: FastAPI + PostgreSQL 16 + MQTT Mosquitto + Redis + Docker
????-??-?? | igarden-smart-os | Decision Router for local-vs-cloud workload routing
????-??-?? | igarden-smart-os | Vision Hub: YOLOv8 on Hailo-8L (38 disease classes)
????-??-?? | igarden-smart-os | Sensor metrics: pH ±0.1, EC ±2%, TDS ±10ppm, temp, humidity, tank
????-??-?? | igarden-smart-os | API: GET /sensors/realtime, POST /control/{device_id}, GET /alerts
```

### igarden-market

```
????-??-?? | igarden-market | TAM: 45+ billion SAR (Saudi agriculture sector total)
????-??-?? | igarden-market | SAM: 4.2 billion SAR (AgriTech for SMB farms) — RESOLVES deck conflict (deck-2.5B was wrong)
????-??-?? | igarden-market | SOM: 50 million SAR (5% of SAM, 2026-2028) — RESOLVES deck conflict (deck-125M was wrong)
????-??-?? | igarden-market | CAGR: 8-10% annual
```

### igarden-financials

```
????-??-?? | igarden-financials | LTV:CAC ratio = 11.8×
????-??-?? | igarden-financials | SaaS gross margin: 80%+
????-??-?? | igarden-financials | Forecast: 2.4M (2026) / 6.9M (2027) / 12.5M (2028) SAR
????-??-?? | igarden-financials | Break-even projected: Q2 2027
2026-04-26 | igarden-financials | CEO directive: 2026 = "low profitability" framing (NOT loss) — pending Saeed accountant verification
2026-04-26 | igarden-financials | Sunbolah grant (150K SAR) classified as "potential, NOT guaranteed" — excluded from baseline budget
2026-04-26 | igarden-financials | Sunbolah grant allocation plan (if approved): Smart Controllers 75K / Osfan 37.5K / Marketing 22.5K / Legal 15K
2026-04-26 | igarden-financials | Subscriptions estimate: ~$130/month (~490 SAR) — detailed file pending
2026-04-26 | igarden-financials | Hardware total spend: ~10,000 SAR (CM5 ~3,029 + Pi5 ~600 + AI HAT+ ~700 + IMX500 ~519 + accessories)
2026-04-26 | igarden-financials | Forecast conflict flagged: Master v1.4 = 17.3M cumulative vs Pitch v2.3 = 21.8M — UNRESOLVED until Saeed session
2026-04-26 | igarden-financials | Hardware regional pricing risk noted: 50-100% potential increase due to geopolitical conditions
```

### vision-hub

```
2026-04-26 | vision-hub | ADR T010 adopted: Pi 5 + AI HAT+ + IMX500 = separate architectural zone (NOT Garden Hub)
2026-04-26 | vision-hub | Hardware: Pi 5 (8GB) + AI HAT+ (Hailo-8L 13 TOPS) + Sony IMX500 AI Camera
2026-04-26 | vision-hub | Performance benchmarks: YOLOv8s 30+ FPS, YOLOv8n 60+ FPS on Hailo
2026-04-26 | vision-hub | Plant disease detection: PlantVillage dataset — 14 plants × 38 disease classes, 94%+ accuracy
2026-04-26 | vision-hub | Track A demo strategy: pre-recorded video (not live) for Sunbolah pitch — avoids hardware setup risk
2026-04-26 | vision-hub | Expected hardware arrival: CM5 by 1-4 May, IMX500 by 1-8 May
```

### osfan-station

```
????-??-?? | osfan-station | R&D station established (Ghulah, north Jeddah)
2025-??-?? | osfan-station | Hosting Smart OS as live production system
```

### pitch-2025

```
2025-12-?? | pitch-2025 | First pitch version prepared for Sunbolah accelerator
```

### للحصول

```
```

### لقراءة

```
```

### لإضافة

```
```

### igarden-finance

```
2026-04-30 | igarden-finance | Financial statements 2025 completed (7 sheets: summary + P&L + balance + cashflow + payroll + monthly + notes)
2026-04-30 | igarden-finance | Financial statements 2026 completed (5 sheets, linked to 2025 closing)
2026-04-30 | igarden-finance | Q1 2026 bank statement analyzed: 158 transactions in 9 categories
2026-04-30 | igarden-finance | Total revenue 2025: 250,041 SAR | Gross profit: 63,166 SAR (25% margin)
2026-04-30 | igarden-finance | Net loss 2025: (20,102) SAR — submitted to ZATCA, normal for first operational year
2026-04-30 | igarden-finance | Operating expenses 2025: 76,409 SAR | Depreciation: 4,744.45 SAR
2026-04-30 | igarden-finance | Cost of revenue 2025: 186,876.51 SAR
```

### igarden-zakat

```
2026-04-30 | igarden-zakat | Zakat 2025 declaration submitted to ZATCA — ref 26001314256
2026-04-30 | igarden-zakat | Zakat base: 82,012 SAR | Zakat due: 2,114.01 SAR | No penalties
```

### igarden-vat

```
2026-04-30 | igarden-vat | VAT Q1 2026 declaration submitted to ZATCA — net due 18,285.31 SAR
2026-04-30 | igarden-vat | Q1 2026 actual sales (29 invoices): 177,613.72 + VAT 26,642.06 = 204,255.78 SAR
2026-04-30 | igarden-vat | Q1 2026 actual purchases: 55,711.65 + VAT 8,356.75 = 64,068.40 SAR
2026-04-30 | igarden-vat | Total ZATCA obligations Q2 2026: 20,399.32 SAR (18,285.31 VAT + 2,114.01 Zakat)
```

### project-fatima

```
2026-04-30 | project-fatima | Invoice value confirmed at 126,000 SAR (NOT 124,488 — diff was bank commissions)
2026-04-30 | project-fatima | Project cost: 62,304 SAR (fiberglass 22,304 + structures 25,000 + labor 15,000)
2026-04-30 | project-fatima | Treated as "projects-in-delivery" on 31/12/2025; revenue + VAT booked in 2026
```

### project-ghoula

```
2026-04-30 | project-ghoula | Project (customer Amira Al-Jamal) confirmed: 53,000 SAR incl. VAT — executed Q1 2026
```

### partnership-decision

```
2026-04-30 | partnership-decision | Partnership structure 50/25/25 (Ali / Mohammed / Ayman) approved — effective 1/4/2026
2026-04-30 | partnership-decision | Equity-split methodology: 50% labor + 50% assets
2026-04-30 | partnership-decision | Ali contribution (50,000): car 22,000 + molds 12,000 + samples 5,500 + goods 6,500 + tools 4,000
2026-04-30 | partnership-decision | Mohammed contribution: 25,000 SAR cash (from original 100,000 capital)
2026-04-30 | partnership-decision | Ayman contribution: 25,000 SAR — paid directly to Mohammed before partnership activation
2026-04-30 | partnership-decision | Capital remains 100,000 SAR in commercial register (no change)
2026-04-30 | partnership-decision | Mohammed remaining current account ~60,675 SAR — to be settled later from profits
```

### partner-salaries

```
2026-04-30 | partner-salaries | Ali + Ayman monthly salary: 3,000 SAR each (Mohammed unpaid) — effective 1/4/2026
```

### accounting-method

```
2026-04-30 | accounting-method | Approved Fatima project as "projects-in-delivery" 31/12/2025 — revenue + VAT booked in 2026
2026-04-30 | accounting-method | Opening balance 1/4/2026 reconciled to 31/12/2025 closing
```

### balance-sheet-2025

```
2026-04-30 | balance-sheet-2025 | Total assets 120,030 | Total liabilities 40,132 | Equity (Mohammed) 79,898
```

### salary-register-2025

```
2026-04-30 | salary-register-2025 | Total salaries 2025: 23,200 SAR (Ayman 4,000 + Mohammed Al-Asad 12,000 + Anas 7,200)
```

### inventory-2025

```
2026-04-30 | inventory-2025 | Closing inventory 31/12/2025: 8,137.60 SAR (steel + plastic + cartons + chemicals + supplies)
```

### gosi-alert

```
2026-04-30 | gosi-alert | Legal alert: company NOT registered in GOSI — must register retroactively before partnership activation
```

### regulatory-pending

```
2026-04-30 | regulatory-pending | Pending regulatory tasks: GOSI, Mudad, Qiwa, CR update (50/25/25 partners), notarized partnership contract, employment contracts, Ejar lease registration
```

### future-system

```
2026-04-30 | future-system | Adopted Qoyod (قيود) as daily accounting system — supports Rajhi-Business integration + ZATCA Phase 2
```

### team-expansion

```
2026-04-30 | team-expansion | Abdullah assigned: daily invoice intake + data entry into Qoyod
```

### customer-004

```
2026-04-30 | customer-004 | Initial meeting with Bandar Tariq Bin Laden (Modern Foods Trading Co.) and father Tariq
2026-04-30 | customer-004 | Potential scopes: 7×8m greenhouse + barley sprouting room + 30 kW solar + restaurant greenhouse
2026-04-30 | customer-004 | Assessment: serious but unclear — needs financial-commitment test before time investment
2026-04-30 | customer-004 | Strategic priority: barley sprouting room + referral network (NOT first big project)
```

### partnership-kamal

```
2026-04-30 | partnership-kamal | Kamal Al-Shajri (Yemeni engineer, greenhouse contractor) — written 10-15% commission agreement required before any joint project
```

### installment-request

```
2026-04-30 | installment-request | VAT installment letter prepared (18,285.31 SAR) — justified by operational obligations + startup-phase burden
2026-04-30 | installment-request | Submission scheduled: 2026-05-01 via ZATCA portal (with Rajhi Q1 statement attachment)
```

### sunbulah

```
2026-04-30 | sunbulah | Identity confirmed: sunbulah = customer-002 (Najat Hanbouli) — NOT a separate customer
2026-04-30 | sunbulah | May 7 pitch reframed as Phase-2 expansion offer (not intro pitch)
2026-04-30 | sunbulah | Compliance dashboard mockup created (igarden-compliance-dashboard.html)
2026-04-30 | sunbulah | Solar RFQ created with 3 options (iGarden-Solar-RFQ-2026.docx)
2026-04-30 | sunbulah | Comparison cheat-sheet created (iGarden-Solar-Comparison-Sheet.html)
```

### strategy

```
2026-04-30 | strategy | MEWA enforcement trends mapped: 5 strategic opportunities identified
2026-04-30 | strategy | Positioning shift: IoT vendor → Smart Energy & Compliance Integrator
2026-04-30 | strategy | Approach decided: Proof-First → Positioning → MMP (60-day plan)
2026-04-30 | strategy | Sunbulah pitch angle: "compliance roadmap" not "compliance product"
```

### mmp

```
2026-04-30 | mmp | Defined: 3 sellable features in 15 working days
2026-04-30 | mmp | Feature 1: Water Compliance Report PDF (5d) — n8n + PostgreSQL
2026-04-30 | mmp | Feature 2: Threshold Alerts + Sensor Log (3d) — 12 thresholds + Telegram
2026-04-30 | mmp | Feature 3: Saudi GAP Pre-Audit Checklist (7d) — interactive HTML on Vercel
2026-04-30 | mmp | Target launch: 2026-06-05
```

### product

```
2026-04-30 | product | New product line: Energy-Aware Smart Greenhouse
2026-04-30 | product | API integration with Inverter (Modbus/REST) mandatory for partner selection
```

### partners

```
2026-04-30 | partners | Need 2-3 NRRC-licensed solar partners in Western Region
2026-04-30 | partners | Recommended brands: Deye/Sungrow/Solis (inverters), JA/Longi/Jinko (panels), Pylontech/BYD (batteries)
2026-04-30 | partners | Subcontractor model: solar partner under iGarden as GC (10-15% commission)
```

### contracts

```
2026-04-30 | contracts | Old Sunbulah contract draft had payment math errors (30K total, 140K in payments) — superseded
2026-04-30 | contracts | Phase-2 contract template needs: SLA, internet backup, software updates, data ownership
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