# 📖 قاموس الـ Entities الكنوني — Canonical Names

> **الغرض:** منع تشتّت الأسماء (name drift) بين الجلسات.
> **القاعدة:** كل entity يُستخدم بنفس الاسم الـ canonical في `events.md` وملفات الـ KB.
> **آخر تحديث:** 2026-04-30

---

## 👥 العملاء (Customers)

| Canonical Entity | الاسم الكامل / الموقع | أسماء بديلة (تُربط لنفس الـ entity) |
|---|---|---|
| `customer-001` | خميس مشيط | "مشيط" — sprouting room |
| `customer-002` | **نجاة علي حسن حنبولي** — هدى الشام، شمال غرب جدة، منطقة مكة | "الغولاء" / `sunbulah` / "ghulah-lettuce" |
| `customer-003` | ⚠️ يحتاج توضيح — هل أحساء/رايانة عميل منفصل أم هو نفسه؟ | "ahsa-rayana" |
| `customer-004` | بندر طارق بن لادن (شركة الأغذية الحديثة التجارية) | "binladen" |

---

## 🏷️ المشاريع والأقسام (Initiatives)

| Canonical Entity | المعنى |
|---|---|
| `igarden-finance` | كل ما يخص القوائم المالية والمحاسبة |
| `igarden-zakat` | إقرارات الزكاة |
| `igarden-vat` | إقرارات ضريبة القيمة المضافة |
| `partnership-decision` | قرارات هيكل الشراكة 50/25/25 |
| `partner-salaries` | رواتب الشركاء العاملين |
| `partnership-kamal` | اتفاقية كمال الشجري (مقاول محميات) |
| `accounting-method` | المعالجة المحاسبية للمشاريع |
| `gosi-alert` | تنبيهات GOSI/التأمينات |
| `regulatory-pending` | المهام النظامية المعلّقة |
| `future-system` | تحول النظام المحاسبي (Qoyod) |
| `team-expansion` | توسعة الفريق (عبدالله، إلخ) |
| `installment-request` | خطاب تقسيط ZATCA |
| `mmp` | Minimum Marketable Product (3 features في 15 يوم) |
| `solar-rfq` | طلب عروض الطاقة الشمسية لـ customer-002 المرحلة 2 |
| `strategy` | القرارات الاستراتيجية الكبرى |
| `partners` | الشركاء المحتملون (طاقة شمسية، MEWA، صندوق التنمية) |
| `product` | خطوط المنتج الجديدة (Energy-Aware Greenhouse) |
| `contracts` | قوالب العقود ومراجعاتها |
| `project-fatima` | مشروع فاطمة (126,000 ريال — مرحَّل لـ 2026) |
| `project-ghoula` | مشروع الغولاء (أميرة الجمال — 53,000 ريال Q1 2026) |
| `mewa` | علاقة + متطلبات وزارة البيئة والمياه والزراعة |
| `ai-daily-routine` | الموجز اليومي لأخبار/أدوات الذكاء الاصطناعي (راجع `ai-daily/README.md`) |

---

## ⚠️ تحذيرات (Anti-patterns)

| ❌ خطأ | ✅ صحيح | السياق |
|---|---|---|
| "ركن الحديقة الذكية" / "Rukn Al-Hadeeqah Al-Thakiyah" | iGarden | خطأ صياغي قديم في عقد customer-002 |
| customer-002 = الجوهرة القحطاني | customer-002 = نجاة علي حسن حنبولي | افتراض خاطئ في جلسات سابقة |
| موقع customer-002 = الأحساء | موقع customer-002 = هدى الشام (مكة) | confusion مع customer-003 |
| sunbulah = عميل منفصل (customer-004) | sunbulah = customer-002 | خطأ تصنيف |
| قيمة عقد customer-002 = 30,000 | 75,900 ريال شامل VAT | عقد قديم به أخطاء حسابية |
| customer-002 ارتفاع 3.5م | 3.2م | نسخة عقد أحدث |
| customer-002 مراوح صينية | مراوح إيطالية 45,000 م³/س | تصحيح من نسخة العقد المُحدّثة |
| دفعات customer-002 = 40/25/25/10 | 50/20/20/10 | تصحيح من العقد المُحدّث |

---

## 🔗 الاستخدام

عند إضافة حدث في `events.md`:

```bash
# تأكد من استخدام الاسم الـ canonical
grep "^[0-9-]* | customer-002 " events.md  # كل تاريخ نجاة حنبولي
grep "^[0-9-]* | sunbulah " events.md       # ↑ نفس الـ entity (تاريخياً)
```

---

🌱 **iGarden — ازرع بذكاء**
