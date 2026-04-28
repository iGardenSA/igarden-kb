# 🚧 مشروع: نشر demo.igarden.sa

> **آخر تحديث:** 2026-04-27
> **الحالة:** ✅ مكتمل (التشغيل) — 🟡 مهام صيانة مفتوحة
> **المسؤول:** علي غنيمة + Claude Code

---

## 📌 الهدف

نقل الديمو الذي طُوِّر (1196 سطر React) من Claude Artifact إلى Production على `demo.igarden.sa`، لاستبدال نسخة HTML ساكنة قديمة كانت موجودة على الـ subdomain.

> تفاصيل المنتج النهائي والـ Stack التقني والميزات المنشورة في [products/demo-igarden-sa.md](../products/demo-igarden-sa.md).

---

## ✅ ما تم إنجازه

### 5 commits على `iGardenSA/igarden-demo`

#### Commit 1: `7670aac` — feat: replace static demo with Next.js Smart OS demo
**التغيير:** استبدال HTML الساكن بـ Next.js project كامل
**النتيجة:** ❌ Build فشل على Vercel (5 محاولات في 29-36 ثانية)

#### Commit 2: `cd40a50` — fix: 5 build errors

| الخطأ | الملف | الإصلاح |
|---|---|---|
| Syntax error: `);` و `}` زائدتان | `app/page.tsx:216` | حذف السطرين |
| `querySelector` بدون generic type | `app/page.tsx:236` | `querySelector<HTMLMetaElement>` |
| `boxSizing: string` غير متوافق مع `CSSProperties` | `app/page.tsx:1164` | `inputStyle: React.CSSProperties` |
| `stages entries` بنوع `unknown` | `app/page.tsx:1089` | cast صريح `keyof typeof CROP_DB` |
| Next.js 15 بدلاً من 16 | `package.json` | `^16.2.4` |
| `jsx: preserve` غير متوافق مع Next 16 | `tsconfig.json` | `jsx: react-jsx` |

**النتيجة:** ✅ Build نجح في Vercel

#### Commit 3: `c28115e` — refactor: localStorage → sessionStorage
**السبب:** ضمان عزل كامل بين زوار الديمو
**التغيير:** 4 مواضع داخل `useEffect` hooks
**النتيجة:** كل tab/زائر يبدأ بـ `DEFAULT_ZONES`، لا تأثير بين الجلسات

#### Commit 4: `1b7a9e5` — feat: green logo + remove tagline from header
- Header: استخدام الأيقونة الخضراء بدلاً من البيضاء
- حذف نص "ازرع بذكاء" من تحت اللوغو في الـ header

---

## 🐛 المشاكل التي واجهتنا

### المشكلة 1: Vercel Project كان Static بدلاً من Next.js
- **الأعراض:** كل deployments فشلت في 29-36 ثانية
- **التشخيص:** Framework Preset في Vercel كان مضبوطاً للديمو القديم
- **الحل:** تغيير Framework Preset إلى Next.js + Redeploy

### المشكلة 2: node_modules تالفة محلياً
- **الأعراض:** `npm install` فشل بـ `TAR_ENTRY_ERROR`
- **التشخيص:** SD card امتلأت 99% (مشكلة تخزين على [HP EliteBook](../infrastructure/hp-elitebook-ali.md))
- **الحل:** Claude Code شخّص المشكلة وأعاد تثبيت dependencies

### المشكلة 3: التحدي اللغوي
- **الأعراض:** خطوط عربية مكسورة في النسخ الأولى
- **الحل:** إضافة Tajawal من Google Fonts عبر `<head>` في layout

---

## ⚠️ تحذيرات حرجة + مهام مفتوحة

### 🔴 P0 — حرج هذا الأسبوع
- [ ] **إضافة بطاقة دفع Vercel** (قبل 2026-05-07)
  - Vercel Pro Trial — 9 أيام متبقية
  - عند انتهاء Trial، كل projects تعود لـ Hobby tier

### 🟡 P1 — صيانة
- [ ] إضافة Vercel Analytics
- [ ] حذف Vercel deployments الفاشلة (تنظيف)
- [ ] إضافة QR code للديمو في Pitch Deck v2.3 (راجع [pitch-sunbolah.md](./pitch-sunbolah.md))
- [ ] إرسال link الديمو لشريك م. أيمن المخزوم للاختبار (راجع [company/team.md](../company/team.md))
- [ ] تحديث `iGarden_Master_v2.0` بالـ URL الحقيقي

### 🛡️ Domain Configuration
- DNS مضبوط على Vercel CNAME
- لو تغيّرت Vercel project IDs → يحتاج إعادة ربط

---

## 🔗 ملفات ذات صلة

- [منتج demo.igarden.sa (التفاصيل التقنية)](../products/demo-igarden-sa.md)
- [Pitch Sunbolah (يستخدم QR للديمو)](./pitch-sunbolah.md)
- [الفريق (شريك م. أيمن للاختبار)](../company/team.md)
- [HP EliteBook (محطة العمل)](../infrastructure/hp-elitebook-ali.md)

---

🌱 **iGarden — ازرع بذكاء**
