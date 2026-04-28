# 🌱 iGarden Knowledge Base

> **قاعدة معرفية مركزية لشركة iGarden — ازرع بذكاء**

نظام معرفي حيّ يحفظ كل قرار، تركيب، عميل، وقرار تقني تم في شركة iGarden. الهدف: **عدم تكرار الشرح من الصفر في كل محادثة Claude جديدة**.

---

## 📁 الهيكل

```
igarden-kb/
├── README.md                  ← هذا الملف
├── INDEX.md                   ← الفهرس الرئيسي (ابدأ هنا)
│
├── company/                   ← هوية الشركة
│   ├── profile.md             ← الهوية، الـ domains، البنك، الحسابات
│   └── team.md                ← الفريق + استراتيجية المساعد التقني
│
├── customers/                 ← ملف لكل عميل
│   ├── 001-khamis-mushait.md
│   ├── 002-ghulah-lettuce.md
│   └── 003-ahsa-rayana.md
│
├── infrastructure/            ← ملف لكل جهاز فعلي
│   ├── pi5-customer1-khamis.md
│   ├── pi5-customer2-ghulah.md
│   ├── esp32-ghulah-tank.md
│   ├── cm5-osfan-hub.md
│   ├── pi5-fastapi-native.md
│   ├── hp-elitebook-ali.md
│   └── ahsa-master-hub.md
│
├── products/                  ← ملف لكل منتج / خط
│   ├── ha-stack-product.md    ← المنتج التشغيلي الحالي
│   ├── igarden-hub.md         ← Backend مركزي (R&D)
│   ├── smart-os-native.md     ← المنتج النهائي (FastAPI)
│   ├── demo-igarden-sa.md     ← Marketing demo
│   └── knowledge-os.md        ← رؤية SaaS مستقبلية
│
├── projects/                  ← حالة كل مشروع جارٍ
│   ├── 002-ghulah-completion.md
│   ├── 003-ahsa-installation.md
│   ├── master-image.md
│   ├── demo-deployment.md
│   ├── website-v1.4.md
│   ├── pitch-sunbolah.md
│   └── knowledge-base.md
│
└── old/                       ← الأرشيف القديم (مؤقتاً)
    ├── conversations/2026-04-27/
    ├── scripts/
    └── …
```

---

## 🧭 قواعد الكتابة في الـ KB

1. **لا تكرار** — كل معلومة تُكتب في **ملف واحد فقط**؛ بقية الملفات تُشير إليها بـ relative link.
2. **ملف واحد لكل كيان** — عميل، جهاز، منتج، مشروع.
3. **company/ = الهوية** | **customers/ = من** | **infrastructure/ = على ماذا** | **products/ = ماذا نقدّم** | **projects/ = ما نعمل عليه الآن**.
4. **اكتب بالعربية** (الفريق عربي).
5. **استخدم الجداول والـ emojis للحالة** 🟢🟡🔴.
6. **اربط بين الملفات** عبر relative links بدلاً من نسخ المحتوى.
7. **لا تحذف معلومة** — انقلها لـ `old/` إذا قديمة.

---

## 🚀 كيفية الاستخدام

### للقراءة (في Claude.ai):

1. ارفع المجلد كـ ZIP لـ Project Knowledge في Claude.ai
2. ابدأ كل محادثة بـ: **"اقرأ INDEX.md"**
3. Claude سيعرف الخريطة كاملة ويتنقّل بذكاء عبر الروابط

### للقراءة (Claude.ai + GitHub MCP):

```
"اقرأ INDEX.md من iGardenSA/igarden-kb"
```

### للكتابة (بعد كل محادثة):

1. اطلب من Claude: **"حدّث الملفات المعنية في الـ KB"** (لا تنشئ ملف archive جديد إلا إذا كان قراراً مرجعياً مهماً)
2. اعتمد قاعدة "ملف واحد لكل كيان" — لا تُكرر المعلومات
3. ادفع لـ GitHub:
   ```bash
   git add . && git commit -m "وصف التحديث" && git push
   ```

### من الجوال:

- **Termius app** للـ SSH للجهاز
- **Claude.ai App + GitHub MCP** للوصول المباشر للـ KB
- مباشرة من GitHub: `https://github.com/iGardenSA/igarden-kb/blob/main/INDEX.md`

---

## 🔄 سياسة التحديث

| التكرار | المهمة |
|---|---|
| **بعد كل محادثة** | تحديث الملفات المعنية في `customers/`/`infrastructure/`/`projects/` |
| **يومياً** | تحديث `INDEX.md` إذا حدثت تغييرات كبرى |
| **أسبوعياً** | مراجعة `customers/`، `infrastructure/`، والمهام المفتوحة |
| **شهرياً** | رفع ZIP كامل لـ Project Knowledge في Claude.ai |

---

## 📝 معايير الملفات

كل ملف يحوي:

```markdown
# عنوان الملف

> **آخر تحديث:** YYYY-MM-DD
> **الحالة:** [🟢 نشط / 🟡 قيد العمل / 🔴 مشكلة / ✅ مكتمل]

## 📌 الملخص (3-5 أسطر)
…

## (أقسام تفصيلية حسب نوع الملف)

## 🔗 ملفات ذات صلة
- [ملف ذو صلة](../path/file.md)
```

---

## 🛡️ النسخ الاحتياطي

| الطبقة | الموقع |
|---|---|
| **Local** | على HP EliteBook في `~/iGarden_KB/` (راجع [infrastructure/hp-elitebook-ali.md](./infrastructure/hp-elitebook-ali.md)) |
| **Cloud 1** | GitHub repo `iGardenSA/igarden-kb` |
| **Cloud 2** | Google Drive (تلقائي مع Linux Mint) |

---

## 📞 للتواصل

راجع [company/profile.md](./company/profile.md) و [company/team.md](./company/team.md).

---

🌱 **iGarden — ازرع بذكاء**
*حين تزرع بذكاء، تحصد بثقة*
