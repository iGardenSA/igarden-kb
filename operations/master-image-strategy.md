# 💿 استراتيجية iGarden Master Image

> **تاريخ آخر تحديث:** 2026-04-27
> **النوع:** Operations / DevOps
> **الحالة:** 🟡 خطة معتمدة — لم تُنفّذ بعد (تنتظر إكمال عميل 002)

---

## 📌 الملخص

**هدف:** تقليل زمن إعداد Pi 5 لعميل جديد من **3 أيام إلى ~30 دقيقة** عبر بناء صورة قرص (`.img`) جاهزة قابلة للنسخ. كل عميل جديد = flash + تخصيص بسيط (hostname + secrets) + نشر.

---

## 🎯 الفائدة المتوقعة

| المعيار | بدون Master Image | مع Master Image |
|---|---|---|
| زمن إعداد Pi لعميل جديد | 3 أيام | **30 دقيقة** |
| أخطاء بشرية في الإعداد | متوسطة | منخفضة جداً |
| التوحيد بين العملاء | متفاوت | مطابق 100% |
| سرعة استبدال جهاز معطّل | يوم كامل | **ساعة** |

---

## 🔑 شرط البدء

> ⚠️ **لا نأخذ Master Image قبل إكمال 100% من إعداد عميل 002 (الغولاء).**
>
> السبب: أيّ عيب في 002 → يتكرر في كل العملاء القادمين.

**Checklist قبل أخذ الـ Image:**
- [ ] جميع P0 من عميل 002 محلولة (pH calibration، TDS UART، شاشة اللمس)
- [ ] SD موسّعة إلى 64GB
- [ ] اختبار 7 أيام متواصلة بدون مشاكل
- [ ] backup يدوي + cloud backup للملفات الحرجة

---

## 🛠️ خطوات بناء الـ Master Image

### 1. تنظيف الـ source Pi

```bash
# على Pi 002 بعد التأكد من الجاهزية
ssh i@192.168.8.235

# مسح logs و caches
sudo journalctl --vacuum-time=1d
sudo apt clean
docker system prune -af --volumes

# مسح ملفات العميل المحدّدة
rm -rf ~/customer-002-data/
> ~/.bash_history
sudo > /var/log/auth.log

# مسح SSH host keys (سيُولِّدها كل Pi جديد)
sudo rm -v /etc/ssh/ssh_host_*
```

### 2. مسح الـ secrets الخاصة بالعميل

```bash
# ESPHome secrets — استبدلها بـ placeholders
cat > ~/igarden/esphome/secrets.yaml <<'EOF'
api_encryption_key: "REPLACE_ME"
ota_password:       "REPLACE_ME"
mqtt_user:          "mqtt_user"
mqtt_password:      "REPLACE_ME"
mqtt_prefix:        "igarden/REPLACE_ME"
EOF

# HA secrets
cat > ~/igarden/homeassistant/secrets.yaml <<'EOF'
mqtt_broker:   "127.0.0.1"
mqtt_user:     "mqtt_user"
mqtt_password: "REPLACE_ME"
EOF
```

### 3. إيقاف الخدمات + إطفاء الـ Pi

```bash
docker compose -f ~/igarden/docker-compose.yml down
sudo systemctl stop docker
sudo poweroff
```

### 4. تصوير الـ SD (من اللابتوب)

```bash
# على HP EliteBook
# نقّع SD إلى reader

# تأكد من اسم الجهاز
lsblk

# صوّر (مثال: /dev/sdc)
sudo dd if=/dev/sdc of=igarden-master-v1-2026-XX-XX.img bs=4M status=progress conv=fsync

# ضغط
gzip -9 igarden-master-v1-2026-XX-XX.img

# تحقّق من الحجم النهائي
ls -lh igarden-master-v1-2026-XX-XX.img.gz
```

### 5. التحقق

```bash
# فك الضغط على نسخة اختبار
gunzip -k igarden-master-v1-2026-XX-XX.img.gz

# Flash على SD اختبارية + Boot
# تأكد من: SSH يعمل، Docker يقوم، HA يفتح
```

---

## 📥 نشر Master Image على عميل جديد

### الخطوات (~30 دقيقة):

```bash
# 1. Flash (5 دقائق)
sudo dd if=igarden-master-v1.img of=/dev/sdc bs=4M status=progress

# 2. Boot أول مرة + SSH
ssh i@<new-pi-ip>

# 3. تخصيص hostname (1 دقيقة)
sudo raspi-config nonint do_hostname igarden-{customer-slug}
sudo reboot

# 4. توليد SSH host keys جديدة (تلقائي بعد reboot)

# 5. تحديث secrets (10 دقائق)
nano ~/igarden/esphome/secrets.yaml
nano ~/igarden/homeassistant/secrets.yaml
# - أنشئ api_encryption_key جديد: openssl rand -base64 32
# - أنشئ ota_password جديد: openssl rand -hex 16
# - عدّل mqtt_prefix → igarden/{customer-slug}/

# 6. تخصيص ESPHome YAML للـ zones (10 دقائق)
cp ~/igarden/esphome/templates/zone-template.yaml \
   ~/igarden/esphome/{customer}-tank-1.yaml
nano ~/igarden/esphome/{customer}-tank-1.yaml

# 7. تشغيل
cd ~/igarden && docker compose up -d

# 8. التحقق
docker compose ps
curl -I http://localhost:8123     # HA
```

---

## 📦 ما يحتويه Master Image (v1)

| الطبقة | المحتوى |
|---|---|
| **OS** | Pi OS Lite 64-bit (Debian 13 Trixie) |
| **Docker** | مثبّت + configured |
| **HA Container** | image مُسحوبة + iGarden Theme + base config |
| **ESPHome Add-on** | مثبّت + zone-template.yaml |
| **Mosquitto** | مثبّت + configured |
| **Chromium Kiosk** | cage/Wayland setup |
| **UFW + Fail2ban** | مفعّلان مع rules أساسية |
| **SSH** | key-only، password disabled |
| **Backup script** | cron daily → ~/backups/ |
| **Tailscale** | مثبّت (يُفعّل بعد التركيب) |

---

## 🗂️ نظام الإصدارات

```
igarden-master-v1.0-2026-XX-XX.img.gz   ← أول نسخة (بعد عميل 002)
igarden-master-v1.1-2026-YY-YY.img.gz   ← bug fixes
igarden-master-v2.0-2026-ZZ-ZZ.img.gz   ← تغيير كبير (NVMe support مثلاً)
```

**Changelog:** يُحفظ في `operations/master-image-changelog.md` (يُنشأ عند الإصدار الأول).

---

## 💾 أماكن التخزين

| المكان | الغرض |
|---|---|
| **HP EliteBook** | الأصل المحلي |
| **Google Drive** | Cloud backup |
| **External SSD** | نسخة احتياطية فيزيائية |
| **CM5 (مستقبلاً)** | خادم داخلي للنسخ |

> ⚠️ **حجم متوقع:** ~3-5 GB مضغوط (من 64GB SD).

---

## 🚨 المهام المفتوحة

### 🔴 P0
- [ ] إكمال P0 لعميل 002 (شرط البدء)
- [ ] إنشاء `templates/zone-template.yaml` قابل للنسخ
- [ ] كتابة سكربت `scripts/customize-pi.sh` لتخصيص hostname + secrets

### 🟡 P1
- [ ] أخذ Master Image v1.0 الأولى
- [ ] رفعها على Google Drive (مع نسخة محلية)
- [ ] توثيق تجربة عميل قادم باستخدامها (002 إلى 003)
- [ ] إنشاء changelog file

### 🟢 P2 (مستقبل)
- [ ] Master Image v2.0 مع NVMe SSD
- [ ] أتمتة كاملة عبر Ansible / cloud-init
- [ ] PXE boot للـ provisioning من CM5

---

## 🎯 المبدأ الذهبي

> **"كل ما يُكرَّر بين العملاء = يجب أن يكون في Master Image.
> كل ما يختلف = يُحدَّد عبر سكربت تخصيص واحد."**

---

## 🔗 ملفات ذات صلة

- [دليل Customer Onboarding](./customer-onboarding.md)
- [Deployment Checklist](./deployment-checklist.md)
- [Pi 5 العميل 002 — مصدر الـ Master Image](../infrastructure/pi5-customer2-ghulah.md)

---

🌱 **iGarden — ازرع بذكاء**
