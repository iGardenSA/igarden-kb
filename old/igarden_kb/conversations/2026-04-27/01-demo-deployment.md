# 🚀 نشر demo.igarden.sa — Production Deployment

> **التاريخ:** 2026-04-27
> **النوع:** عملية نشر تقنية
> **الحالة:** ✅ مكتمل بنجاح
> **المسؤول:** علي غنيمة + Claude Code

---

## 📌 الملخص التنفيذي

تم نشر النسخة الجديدة من **iGarden Smart OS Demo** على `demo.igarden.sa` بنجاح، بعد سلسلة إصلاحات تقنية. الديمو يعرض الآن لوحة تحكم تفاعلية كاملة بـ 4 تبويبات لجمهور الزوار والمستثمرين.

---

## 🎯 الهدف

نقل الديمو الذي تم تطويره (1196 سطر React) من Claude Artifact إلى Production على `demo.igarden.sa`، لاستبدال نسخة HTML ساكنة قديمة كانت موجودة على الـ subdomain.

---

## 🏗️ البنية التقنية النهائية

```
┌─────────────────────────────────────────────────────────────┐
│  demo.igarden.sa                                             │
│  ───────────────                                             │
│                                                              │
│  Frontend Stack:                                             │
│  ├── Next.js 16.2.4                                          │
│  ├── React 19                                                │
│  ├── TypeScript 5.x                                          │
│  ├── Recharts 2.x                                            │
│  └── lucide-react 0.468                                      │
│                                                              │
│  Hosting:                                                    │
│  ├── Vercel Pro (Trial — 9 days remaining)                   │
│  ├── Region: Frankfurt (fra1)                                │
│  └── HTTPS: Auto SSL                                         │
│                                                              │
│  Source:                                                     │
│  ├── GitHub: iGardenSA/igarden-demo                          │
│  ├── Branch: main                                            │
│  └── Auto-deploy on push                                     │
└─────────────────────────────────────────────────────────────┘
```

---

## 📋 الميزات المنشورة

### 1. Header
- شعار iGarden (الأيقونة الخضراء)
- النص: "iGarden Smart OS"
- شارة "البث المباشر — البيانات تُحدَّث كل ثانيتين"
- ❌ بدون tagline في الـ header (تم حذفها بناءً على طلب المستخدم)

### 2. التبويبات الأربعة

| التبويب | الوصف | الحالة |
|---|---|---|
| لوحة المعطيات الحية | 4 وحدات تحكم (Climate/Fertigation/Irrigation/Energy) | ✅ |
| محرّك التوصيات | 12 محصول × 4 مناطق سعودية = ~150 وصفة | ✅ |
| السجل التاريخي | 90 يوم بيانات + رسوم تفاعلية | ✅ |
| إعدادات المناطق | CRUD كامل + 4 أجهزة لكل منطقة | ✅ |

### 3. Footer
- الأيقونة الخضراء + اسم الشركة
- Tagline: "ازرع بذكاء" (بارز)
- Signature line: "حين تزرع بذكاء، تحصد بثقة"
- رابط `igarden.sa`

### 4. خصائص تقنية
- ✅ Responsive (mobile breakpoint 640px)
- ✅ RTL كامل
- ✅ خط Tajawal من Google Fonts
- ✅ sessionStorage isolation (كل tab مستقل)

---

## 🔧 الإصلاحات التقنية (5 commits)

### Commit 1: `7670aac` — feat: replace static demo with Next.js Smart OS demo
**التغيير:** استبدال HTML الساكن بـ Next.js project كامل
**النتيجة:** ❌ Build فشل على Vercel (5 محاولات في 29-36 ثانية)

### Commit 2: `cd40a50` — fix: 5 build errors
**الإصلاحات:**

| الخطأ | الملف | الإصلاح |
|---|---|---|
| Syntax error: `);` و `}` زائدتان | `app/page.tsx:216` | حذف السطرين |
| `querySelector` بدون generic type | `app/page.tsx:236` | `querySelector<HTMLMetaElement>` |
| `boxSizing: string` غير متوافق مع `CSSProperties` | `app/page.tsx:1164` | `inputStyle: React.CSSProperties` |
| `stages entries` بنوع `unknown` | `app/page.tsx:1089` | cast صريح `keyof typeof CROP_DB` |
| Next.js 15 بدلاً من 16 | `package.json` | `^16.2.4` |
| `jsx: preserve` غير متوافق مع Next 16 | `tsconfig.json` | `jsx: react-jsx` |

**النتيجة:** ✅ Build نجح في Vercel

### Commit 3: `c28115e` — refactor: localStorage → sessionStorage
**السبب:** ضمان عزل كامل بين زوار الديمو
**التغيير:** 4 مواضع داخل `useEffect` hooks
**النتيجة:** كل tab/زائر يبدأ بـ `DEFAULT_ZONES`، لا تأثير بين الجلسات

### Commit 4: `1b7a9e5` — feat: green logo + remove tagline from header
**التغييرات:**
- Header: استخدام الأيقونة الخضراء بدلاً من البيضاء
- حذف نص "ازرع بذكاء" من تحت اللوغو في الـ header

---

## 🐛 المشاكل التي واجهتنا

### المشكلة 1: Vercel Project كان Static بدلاً من Next.js
**الأعراض:** كل deployments فشلت في 29-36 ثانية
**التشخيص:** Framework Preset في Vercel كان مضبوطاً للديمو القديم
**الحل:** تغيير Framework Preset إلى Next.js + Redeploy

### المشكلة 2: node_modules تالفة محلياً
**الأعراض:** `npm install` فشل بـ `TAR_ENTRY_ERROR`
**التشخيص:** SD card امتلأت 99% (مشكلة تخزين)
**الحل:** Claude Code شخّص المشكلة وأعاد تثبيت dependencies

### المشكلة 3: التحدي اللغوي
**الأعراض:** خطوط عربية مكسورة في النسخ الأولى
**الحل:** إضافة Tajawal من Google Fonts عبر `<head>` في layout

---

## 🌐 الـ URLs النهائية

| النوع | الـ URL | الحالة |
|---|---|---|
| Production | https://demo.igarden.sa | ✅ حيّ |
| Vercel | https://igarden-demo.vercel.app | ✅ مرآة |
| GitHub | https://github.com/iGardenSA/igarden-demo | ✅ Public |

---

## 📦 ملفات المشروع

```
demo-igarden/
├── app/
│   ├── page.tsx              ← الديمو الكامل (1199 سطر)
│   ├── layout.tsx            ← Metadata + RTL + Tajawal
│   └── globals.css           ← CSS reset
├── public/
│   └── branding/
│       ├── icon-master-white.png    (12KB)
│       └── icon-master-original.png (32KB)
├── package.json              ← Next 16.2.4 + React 19
├── tsconfig.json             ← strict: false
├── next.config.js            ← Headers أمنية + Cache
├── vercel.json               ← Region: fra1 (Frankfurt)
├── .gitignore
└── README.md
```

**حجم Bundle:** ~140KB (مع الشعارات)

---

## ⚠️ تحذيرات حرجة

### 🔴 1. Vercel Trial — 9 أيام متبقية
- **الموعد النهائي:** 2026-05-07
- **الإجراء:** إضافة بطاقة دفع في Vercel Dashboard
- **الخطر:** عند انتهاء Trial، كل projects تعود لـ Hobby tier

### 🟡 2. Domain Configuration
- DNS مضبوط على Vercel CNAME
- لو تغيّرت Vercel project IDs → يحتاج إعادة ربط

---

## 🎯 الدور الاستراتيجي للديمو

### ما هو:
- ✅ أداة تسويق + Sales
- ✅ Marketing demo (للزوار/المستثمرين)
- ✅ Pitch deck companion (QR code)

### ما ليس هو:
- ❌ ليس النظام الذي يصل للعميل
- ❌ لا يتصل بحساسات حقيقية
- ❌ بياناته محاكاة بالكامل

### العلاقة بـ iGarden Smart OS الحقيقي:
```
demo.igarden.sa     ──── منفصل عن ────►   نظام العميل (Pi 5 + HA + ESP32)
(Sales tool)                                (Production)
```

---

## 📝 المهام المفتوحة

- [ ] إضافة بطاقة دفع Vercel (قبل 2026-05-07) 🔴
- [ ] إضافة Vercel Analytics
- [ ] حذف Vercel deployments الفاشلة (تنظيف)
- [ ] إضافة QR code للديمو في Pitch Deck v2.3
- [ ] إرسال link الديمو لشريك م. أيمن المخزوم للاختبار
- [ ] تحديث `iGarden_Master_v2.0` بالـ URL الحقيقي

---

## 🔗 ملفات ذات صلة

- [قرار معماري: Demo vs Production](../architecture/three-projects-evolution.md)
- [العميل 002 — الغولاء](../customers/002-ghulah-lettuce.md)
- [INDEX.md](../INDEX.md)

---

🌱 **iGarden — ازرع بذكاء**
