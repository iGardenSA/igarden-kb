# 🗓️ سجل الجلسات — iGarden KB

## آخر جلسة: 2026-04-29

### ✅ ما تم:

**1. Knowledge Base Loop**
- إنشاء repo `iGardenSA/igarden-kb` (public)
- رفع هيكل KB: `customers/`, `infrastructure/`, `architecture/`, `decisions/`, `conversations/`
- `README.md` جاهز للقراءة من Claude Web عبر raw URL

**2. البنية التحتية**
- اكتشاف IP الجديد لـ CM5: `192.168.8.102` (كان `192.168.8.21`)
- تثبيت Node.js v20.20.2 على CM5
- تثبيت Claude Code v2.1.121 على CM5 (user: `igarden`)
- تسجيل دخول Claude Code: Opus 4.7 · Claude Max · `info@igarden.sa`

**3. Google Drive Sync**
- تثبيت rclone على Termux (الجوال)
- إعداد remote: `gdrive`
- سكربت `~/sync-kb.sh`: `git pull` + `rclone sync`
- cron job يومي 22:00

**4. Telegram Bot**
- بوت `@igarden_sa_bot` شغّال
- Token: `7798622043:AAHS7XMWvXzrpTvpNrqB4ELKee__ucG85lE`
- n8n workflow: Telegram → Claude API → Send Reply
- Model: `claude-sonnet-4-5`
- API Key: `igarden-telegram-bot` على Anthropic Console

**5. n8n على CM5**
- URL: `http://192.168.8.102:5678`
- إعادة بناء container مع DNS `8.8.8.8` + `N8N_SECURE_COOKIE=false`
- `WEBHOOK_URL` مؤقت عبر trycloudflare

**6. Cloudflare Tunnel**
- Tunnel: `iGarden-cm5`
- ID: `3942be75-672a-4de6-88e4-1c5d526a2274`
- Container شغّال على CM5 (`restart: unless-stopped`)
- Status: Healthy ✅
- DNS معلّق (`igarden.sa` على Vercel Nameservers)

**7. أتمتة عند انقطاع التيار**
- `docker update --restart unless-stopped` لكل الـ containers
- `systemctl enable docker`

**8. Event-Sourced KB Structure**
- إنشاء `events.md` كمصدر الحقيقة
- صيغة: `YYYY-MM-DD | entity | event description`
- 13+ entity تم تتبعها

### 🎯 أولويات الجلسة القادمة:

- [ ] حل DNS الدائم لـ `n8n.igarden.sa` (نقل DNS أو سكربت تحديث)
- [ ] بناء هيكل `osfan-station/` للتجارب الميدانية
- [ ] قالب `EXP-XXX.md` لكل تجربة
- [ ] تجربة العملاء على الـ Telegram Bot
- [ ] WhatsApp Bot (لاحقاً)
- [ ] MQTT حساسات → n8n → KB

### 📚 المراجع:
- [README.md](./README.md)
- [events.md](./events.md)
- [INDEX.md](./INDEX.md)
- [tasks/pending.md](./tasks/pending.md)
- [projects/telegram-bot.md](./projects/telegram-bot.md)
- [infrastructure/cm5-hub.md](./infrastructure/cm5-hub.md)

---

🌱 **iGarden — ازرع بذكاء**
