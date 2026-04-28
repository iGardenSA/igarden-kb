# 📦 iGarden Smart OS Demo — `demo.igarden.sa`

> **آخر تحديث:** 2026-04-27
> **الحالة:** ✅ حيّ في الإنتاج
> **النوع:** أداة تسويق + Sales (ليس منتج للعميل)

---

## 📌 الملخص

النسخة الجديدة من **iGarden Smart OS Demo** على `demo.igarden.sa`. لوحة تحكم تفاعلية بـ 4 تبويبات تستهدف الزوار والمستثمرين، تعرض ما يستطيع iGarden تقديمه.

> **مهم:** هذا الديمو **منفصل** عن نظام العميل الحقيقي ([HA Stack](./ha-stack-product.md))، ولا يتصل بحساسات حقيقية — بياناته محاكاة بالكامل.

---

## 🏗️ البنية التقنية

```
Frontend Stack:
├── Next.js 16.2.4
├── React 19
├── TypeScript 5.x
├── Recharts 2.x
└── lucide-react 0.468

Hosting:
├── Vercel Pro (Trial — 9 أيام متبقية، ينتهي 2026-05-07)
├── Region: Frankfurt (fra1)
└── HTTPS: Auto SSL

Source:
├── GitHub: iGardenSA/igarden-demo
├── Branch: main
└── Auto-deploy on push
```

> ⚠️ **حرج:** بطاقة دفع Vercel يجب إضافتها قبل 2026-05-07. تتبَّع المهمة في [projects/demo-deployment.md](../projects/demo-deployment.md).

---

## 📋 الميزات المنشورة

### Header
- شعار iGarden (الأيقونة الخضراء)
- النص: "iGarden Smart OS"
- شارة "البث المباشر — البيانات تُحدَّث كل ثانيتين"
- ❌ بدون tagline في الـ header (تم حذفها بناءً على طلب المستخدم)

### التبويبات الأربعة

| التبويب | الوصف | الحالة |
|---|---|---|
| لوحة المعطيات الحية | 4 وحدات تحكم (Climate/Fertigation/Irrigation/Energy) | ✅ |
| محرّك التوصيات | 12 محصول × 4 مناطق سعودية = ~150 وصفة | ✅ |
| السجل التاريخي | 90 يوم بيانات + رسوم تفاعلية | ✅ |
| إعدادات المناطق | CRUD كامل + 4 أجهزة لكل منطقة | ✅ |

### Footer
- الأيقونة الخضراء + اسم الشركة
- Tagline: `ازرع بذكاء` (بارز)
- Signature line: `حين تزرع بذكاء، تحصد بثقة`
- رابط `igarden.sa`

### خصائص تقنية
- ✅ Responsive (mobile breakpoint 640px)
- ✅ RTL كامل
- ✅ خط Tajawal من Google Fonts
- ✅ sessionStorage isolation (كل tab مستقل)

---

## 📦 ملفات المشروع

```
demo-igarden/
├── app/
│   ├── page.tsx              ← الديمو الكامل (1199 سطر)
│   ├── layout.tsx            ← Metadata + RTL + Tajawal
│   └── globals.css           ← CSS reset
├── public/branding/
│   ├── icon-master-white.png    (12KB)
│   └── icon-master-original.png (32KB)
├── package.json              ← Next 16.2.4 + React 19
├── tsconfig.json             ← strict: false
├── next.config.js            ← Headers أمنية + Cache
├── vercel.json               ← Region: fra1
├── .gitignore
└── README.md
```

**حجم Bundle:** ~140KB (مع الشعارات)

---

## 🌐 الـ URLs

| النوع | الـ URL | الحالة |
|---|---|---|
| Production | https://demo.igarden.sa | ✅ حيّ |
| Vercel mirror | https://igarden-demo.vercel.app | ✅ |
| GitHub | https://github.com/iGardenSA/igarden-demo | ✅ Public |

---

## 🎯 الدور والعلاقة بالمنتجات الأخرى

```
demo.igarden.sa     ── منفصل عن ──►   نظام العميل
(Sales tool, Vercel)                  (HA Stack على Pi 5)
```

- ✅ أداة تسويق + Sales
- ✅ Marketing demo (للزوار/المستثمرين)
- ✅ Pitch deck companion (QR code)
- ❌ ليس النظام الذي يصل للعميل
- ❌ لا يتصل بحساسات حقيقية

---

## 🔗 ملفات ذات صلة

- [مشروع نشر الديمو (الإصلاحات + المهام)](../projects/demo-deployment.md)
- [iGarden HA Stack (المنتج الحقيقي للعميل)](./ha-stack-product.md)
- [Pitch Sunbolah (يستخدم QR للديمو)](../projects/pitch-sunbolah.md)
- [igarden.sa الموقع الرئيسي](../projects/website-v1.4.md)

---

🌱 **iGarden — ازرع بذكاء**
