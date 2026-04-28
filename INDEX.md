# 📚 INDEX — Knowledge Base iGarden

> **آخر تحديث:** 2026-04-28
> **الحالة:** نشط — هيكل جديد (company/customers/infrastructure/products/projects)

---

## ⚡ ابدأ هنا (للذكاء الاصطناعي)

> 🤖 **يا Claude:** هذا الفهرس هو خريطة المعرفة الكاملة لـ iGarden.
> اقرأ هذا الملف أولاً، ثم انتقل للملفات التفصيلية حسب السؤال.
> **لا تكرّر معلومة موجودة في ملف آخر** — اتّبع الروابط بدلاً من إعادة الشرح.

---

## 🏢 الشركة

| الملف | المحتوى |
|---|---|
| [company/profile.md](./company/profile.md) | الهوية، السجل التجاري، Domains، البنك، حسابات API |
| [company/team.md](./company/team.md) | المؤسس، الشركاء، استراتيجية المساعد التقني |

---

## 👥 العملاء

| الكود | الاسم | الموقع | الزراعة | الحالة | الملف |
|---|---|---|---|---|---|
| **001** | غرفة شعير | خميس مشيط | استنبات شعير | ✅ مكتمل (شهرين) | [📄](./customers/001-khamis-mushait.md) |
| **002** | محمية الخس العائم | الغولاء (شمال جدة) | خس عائم (DWC) | 🟡 80% منجز | [📄](./customers/002-ghulah-lettuce.md) |
| **003** | مزرعة الريانة العضوية | الأحساء | دتش بكت ثمريات | 🔴 جديد (الأجهزة في الطريق) | [📄](./customers/003-ahsa-rayana.md) |

---

## 🖥️ البنية التحتية

| الجهاز | الموقع | الدور | الحالة | الملف |
|---|---|---|---|---|
| **Pi 5 #1** | خميس مشيط | تحكم العميل 001 | 🟢 نشط | [📄](./infrastructure/pi5-customer1-khamis.md) |
| **Pi 5 #2** | الغولاء | تحكم العميل 002 | 🟡 80% | [📄](./infrastructure/pi5-customer2-ghulah.md) |
| **ESP32 igarden-tank** | الغولاء | حساسات + ريليهات العميل 002 | 🟡 يحتاج معايرة | [📄](./infrastructure/esp32-ghulah-tank.md) |
| **CM5** | عسفان | iGarden Hub (n8n + PG + MQTT) | 🟡 30% — R&D | [📄](./infrastructure/cm5-osfan-hub.md) |
| **Pi 5 (مختبر)** | عسفان | iGarden Smart OS Native | 🟡 Phase 3/5 | [📄](./infrastructure/pi5-fastapi-native.md) |
| **HP EliteBook** | محطة علي | Development Workstation | 🟢 نشط | [📄](./infrastructure/hp-elitebook-ali.md) |
| **Master Hub الأحساء** | الأحساء (مخطط) | تحكم 4 zones للعميل 003 | ⏳ أجهزة في الطريق | [📄](./infrastructure/ahsa-master-hub.md) |

---

## 📦 المنتجات / خطوط العمل

| المنتج | النوع | الحالة | الملف |
|---|---|---|---|
| **iGarden HA Stack** | الخط التشغيلي الحالي (HA + ESP32 على Pi 5) | ✅ يخدم 001/002/003 | [📄](./products/ha-stack-product.md) |
| **iGarden Hub** | Backend مركزي (n8n + PG + Mosquitto على CM5) | 🟡 R&D — Pause خفيف | [📄](./products/igarden-hub.md) |
| **iGarden Smart OS Native** | المنتج النهائي (FastAPI 100% iGarden) | 🟡 Phase 3/5 — Pause مؤقت | [📄](./products/smart-os-native.md) |
| **demo.igarden.sa** | Marketing demo (Next.js على Vercel) | ✅ حيّ | [📄](./products/demo-igarden-sa.md) |
| **iGarden Knowledge OS** | رؤية SaaS مستقبلية (Layer 3) | 🔵 رؤية | [📄](./products/knowledge-os.md) |

---

## 🚧 المشاريع الجارية

| المشروع | الأولوية | الحالة | الملف |
|---|---|---|---|
| إكمال العميل 002 (الغولاء 80% → 100%) | 🔴 P0 | جارٍ | [📄](./projects/002-ghulah-completion.md) |
| تركيب العميل 003 (الأحساء) | 🔴 P0 | بانتظار الأجهزة + مراجعة العقد المضاعف | [📄](./projects/003-ahsa-installation.md) |
| Master Image لـ Pi 5 | 🟡 P1 | بانتظار إكمال 002 | [📄](./projects/master-image.md) |
| نشر demo.igarden.sa | ✅ مكتمل + صيانة | حرج: بطاقة Vercel قبل 2026-05-07 | [📄](./projects/demo-deployment.md) |
| igarden.sa v1.4 | 🟡 P1 | جاهز للنشر | [📄](./projects/website-v1.4.md) |
| Pitch Sunbolah | 🟡 P1 | 16 شريحة جاهزة | [📄](./projects/pitch-sunbolah.md) |
| بناء Knowledge Base (Layer 1) | 🟢 P2 | Layer 1 قيد التنفيذ | [📄](./projects/knowledge-base.md) |

---

## 🚨 المهام المفتوحة العاجلة (Live)

### 🔴 P0 — حرج هذا الأسبوع
- [ ] إضافة بطاقة دفع Vercel (قبل 2026-05-07) — راجع [projects/demo-deployment.md](./projects/demo-deployment.md)
- [ ] متابعة وصول أجهزة الأحساء (وصول متوقع: ~2026-05-04) — راجع [projects/003-ahsa-installation.md](./projects/003-ahsa-installation.md)
- [ ] إكمال 20% المتبقية من العميل 002 — راجع [projects/002-ghulah-completion.md](./projects/002-ghulah-completion.md)
- [ ] قراءة العقد المضاعف للأحساء بـ Opus 4.7 — راجع [projects/003-ahsa-installation.md](./projects/003-ahsa-installation.md)

### 🟡 P1 — هذا الشهر
- [ ] إنشاء Master Image للنسخ على عملاء جدد — [projects/master-image.md](./projects/master-image.md)
- [ ] نشر igarden.sa v1.4 — [projects/website-v1.4.md](./projects/website-v1.4.md)
- [ ] تحديث `iGarden_Tech_Appendix_v3.0` بقسم العملاء

### 🟢 P2 — خلال 3 أشهر
- [ ] بناء Knowledge Base كامل (Layer 2 ثم Layer 3) — [projects/knowledge-base.md](./projects/knowledge-base.md)
- [ ] بناء MCP Server مخصّص لـ iGarden — [products/knowledge-os.md](./products/knowledge-os.md)
- [ ] إنشاء `app.igarden.sa` (Customer Portal) — راجع [company/profile.md](./company/profile.md)

---

## 📁 الأرشيف القديم

البنية القديمة + الجلسات التفصيلية الأصلية محفوظة مؤقتاً في [old/](./old/) للرجوع إليها:
- [old/conversations/2026-04-27/](./old/conversations/2026-04-27/) — 4 محادثات تفصيلية (نشر الديمو، تطوّر المعمارية، استراتيجية نماذج Claude، استراتيجية KB)
- [old/scripts/](./old/scripts/) — السكربتات الأصلية (`git-sync.sh`, `init-repo.sh`, `new-conversation.sh`)
- [old/INDEX.md](./old/INDEX.md), [old/README.md](./old/README.md), [old/igarden_kb/](./old/igarden_kb/) — النسخ القديمة

---

## 🎯 منهج التعامل مع الملفات

### للملفات المتجددة (live):
- `INDEX.md` ← هذا الملف (يُحدَّث أسبوعياً)
- `customers/*.md`, `infrastructure/*.md`, `projects/*.md` ← يُحدَّث عند كل تغيير

### للملفات المرجعية (نسبياً ثابتة):
- `company/*.md`, `products/*.md` ← يُحدَّث عند تغييرات استراتيجية

### للأرشيف:
- `old/**` ← لا تُعدَّل، مرجع تاريخي

---

## 🔄 سجل التحديثات

| التاريخ | التغيير |
|---|---|
| 2026-04-27 | إنشاء KB + توثيق جلسة demo deployment + 3 ملفات customers |
| 2026-04-28 | إعادة هيكلة شاملة: company/customers/infrastructure/products/projects + نقل الملفات الأصلية لـ old/ |

---

🌱 **iGarden — ازرع بذكاء**
