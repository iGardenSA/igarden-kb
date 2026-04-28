# 📚 INDEX — Knowledge Base iGarden

> **آخر تحديث:** 2026-04-27
> **عدد الملفات:** 12
> **الحالة:** نشط

---

## ⚡ ابدأ هنا (للذكاء الاصطناعي)

> 🤖 **يا Claude:** هذا الفهرس هو خريطة المعرفة الكاملة لـ iGarden.
> اقرأ هذا الملف أولاً، ثم انتقل للملفات التفصيلية حسب السؤال.

### السياق العام:
- **الشركة:** iGarden (شركة انتيليجنت غاردن — سجل تجاري 4030579637)
- **المؤسس:** علي محمد غنيمة (info@igarden.sa)
- **التخصص:** أنظمة زراعة ذكية + IoT للزراعة المائية
- **Tagline المعتمد:** `ازرع بذكاء`
- **Signature:** `حين تزرع بذكاء، تحصد بثقة`

---

## 🏢 العملاء النشطون

| الكود | الاسم | الموقع | الزراعة | الحالة | الملف |
|---|---|---|---|---|---|
| **001** | غرفة شعير | خميس مشيط | استنبات شعير | ✅ مكتمل (شهرين) | [📄](./customers/001-khamis-mushait.md) |
| **002** | محمية الخس العائم | الغولاء (شمال جدة) | خس عائم | 🟡 80% منجز | [📄](./customers/002-ghulah-lettuce.md) |
| **003** | مزرعة الريانة العضوية | الأحساء | دتش بكت ثمريات | 🔴 جديد (وُقّع منذ أسبوعين) | [📄](./customers/003-ahsa-rayana.md) |

---

## 🖥️ البنية التحتية النشطة

| الجهاز | المكان | الدور | الـ OS | الحالة | الملف |
|---|---|---|---|---|---|
| **Pi 5 #1** | مزرعة الغولاء | تحكم العميل 002 | Pi OS Lite + Docker + HA Container | 🟡 80% | [📄](./infrastructure/pi5-customer2-ghulah.md) |
| **CM5** | محطة عسفان | iGarden Hub (n8n + PG + Mosquitto) | Pi OS Lite + Docker | 🟡 30% | [📄](./infrastructure/cm5-osfan-hub.md) |
| **Pi 5 #2** | عسفان (مختبر) | iGarden Smart OS Native | Pi OS Lite | 🟡 Phase 3 من 5 | [📄](./infrastructure/pi5-fastapi-native.md) |
| **HP EliteBook** | محمول (علي) | Development Workstation | Linux Mint 22 | 🟢 نشط | — |

---

## 🌐 الـ Domains والخدمات

| Domain | الغرض | الحالة | الملاحظات |
|---|---|---|---|
| `igarden.sa` | الموقع الرئيسي | 🟡 v1.4 جاهز للنشر | repo: `iGardenSA/igarden-web` |
| `demo.igarden.sa` | Smart OS Demo (تسويقي) | ✅ حيّ | Next.js 16 + React 19 على Vercel |
| `app.igarden.sa` | Customer Portal | ⏳ مخطط (Q3 2026) | لم يبدأ |
| `shop.igarden.sa` | المتجر | ⏳ مخطط (P2) | Salla CNAME |

---

## 🏗️ المعماريات والقرارات

| الموضوع | التاريخ | الحالة | الملف |
|---|---|---|---|
| 3 معماريات متطورة (HA → n8n → FastAPI) | 2026-04-27 | معتمد | [📄](./architecture/three-projects-evolution.md) |
| HA vs FastAPI Decision | 2026-04-27 | معتمد للأحساء = HA | [📄](./architecture/ha-vs-fastapi-decision.md) |
| Demo Architecture (Vercel) | 2026-04-27 | منفذ | [📄](./decisions/2026-04-27-demo-deployment.md) |
| Brand Messaging v1.1 | 2026-04-27 | معتمد | (في Project Knowledge) |

---

## 📅 جلسات مهمة (Conversations Archive)

| التاريخ | الموضوع | المخرجات | الملف |
|---|---|---|---|
| 2026-04-22 | CM5 Docker Stack + n8n | 4 خدمات، 1 workflow | (محفوظة في ملخصات) |
| 2026-04-22 | Pi 5: HAOS → Docker | Migration ناجحة | (محفوظة في ملخصات) |
| 2026-04-22 | iGarden Native FastAPI | 208 tests passing | (محفوظة في ملخصات) |
| **2026-04-27** | **Demo Deployment + Architecture Discussion** | demo.igarden.sa حيّ | [📁](./conversations/2026-04-27/) |

---

## 🚨 المهام المفتوحة (TODO Live)

### 🔴 P0 — حرج هذا الأسبوع
- [ ] إضافة بطاقة دفع Vercel (قبل 2026-05-07)
- [ ] متابعة وصول أجهزة الأحساء (وصول متوقع: ~2026-05-04)
- [ ] إكمال 20% المتبقية من العميل 002 (الغولاء)

### 🟡 P1 — هذا الشهر
- [ ] تركيب نظام الأحساء (30 يوم من العقد — تأخير مُعلَن للعميل)
- [ ] إنشاء Master Image للنسخ على عملاء جدد
- [ ] تحديث `iGarden_Tech_Appendix_v3.0` بقسم العملاء

### 🟢 P2 — خلال 3 أشهر
- [ ] بناء Knowledge Base كامل (Layer 2 ثم Layer 3)
- [ ] بناء MCP Server مخصّص لـ iGarden
- [ ] إنشاء app.igarden.sa (Customer Portal)

---

## 🔑 معلومات تقنية حرجة

### عناوين IP
| الجهاز | IP | الشبكة |
|---|---|---|
| Pi 5 العميل 002 | 192.168.8.235 | الغولاء |
| CM5 عسفان | 192.168.8.21 | الغولاء |
| Pi 5 FastAPI | 192.168.8.235 (نفس الجهاز؟) | الغولاء |
| ESP32 igarden-tank | 192.168.8.137 | الغولاء |

### كلمات السر والمفاتيح
> ⚠️ **لا تُحفَظ في هذا الملف** — موجودة في KeePassXC على HP EliteBook

### حسابات API
- **Anthropic Console:** $24.00 متبقٍ (آخر شحن: $25 + $3.75 مكافأة)
- **Vercel Pro:** Trial 9 days remaining (deadline 2026-05-07)
- **GitHub:** iGardenSA org

---

## 🎯 منهج التعامل مع الملفات

### للملفات المتجددة (live):
- `INDEX.md` ← هذا الملف (يُحدَّث أسبوعياً)
- `customers/*.md` ← يُحدَّث عند كل تغيير
- `infrastructure/*.md` ← يُحدَّث عند كل تغيير

### للملفات الأرشيفية:
- `conversations/YYYY-MM-DD/*.md` ← لا تُعدَّل بعد الكتابة
- `decisions/YYYY-MM-DD-*.md` ← مرجع تاريخي

---

## 🔄 سجل التحديثات

| التاريخ | التغيير |
|---|---|
| 2026-04-27 | إنشاء KB + توثيق جلسة demo deployment |
| 2026-04-27 | إضافة 3 ملفات customers + 3 infrastructure |

---

🌱 **iGarden — ازرع بذكاء**
