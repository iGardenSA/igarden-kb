# 🌱 iGarden Knowledge Base

> **قاعدة معرفية مركزية لشركة iGarden — ازرع بذكاء**

نظام معرفي حيّ يحفظ كل قرار، تركيب، عميل، وقرار تقني تم في شركة iGarden. الهدف: **عدم تكرار الشرح من الصفر في كل محادثة Claude جديدة**.

---

## 📁 الهيكل

```
igarden_kb/
├── README.md                    ← هذا الملف
├── INDEX.md                     ← الفهرس الرئيسي (ابدأ هنا)
│
├── customers/                   ← العملاء النشطون
│   ├── 001-khamis-mushait.md
│   ├── 002-ghulah-lettuce.md
│   └── 003-ahsa-rayana.md
│
├── infrastructure/              ← البنية التحتية
│   ├── pi5-customer1-haos.md
│   ├── cm5-osfan-hub.md
│   └── pi5-fastapi-native.md
│
├── architecture/                ← المعماريات
│   ├── ha-vs-fastapi-decision.md
│   └── three-projects-evolution.md
│
├── decisions/                   ← القرارات الاستراتيجية
│   └── 2026-04-27-demo-deployment.md
│
├── operations/                  ← العمليات اليومية
│   ├── deployment-checklist.md
│   └── customer-onboarding.md
│
├── conversations/               ← أرشيف المحادثات الخام
│   ├── 2026-04-22/
│   ├── 2026-04-27/
│   └── 2026-04-28/
│
└── scripts/                     ← أتمتة
    ├── new-conversation.sh
    └── git-sync.sh
```

---

## 🚀 كيفية الاستخدام

### للقراءة (في Claude.ai):

1. ارفع المجلد كـ ZIP لـ Project Knowledge في Claude.ai
2. ابدأ كل محادثة بـ: **"اقرأ INDEX.md"**
3. Claude سيعرف الخريطة كاملة ويتنقّل بذكاء

### للكتابة (بعد كل محادثة):

1. اطلب من Claude: **"اكتب ملف معرفي تفصيلي لما تم في هذه الجلسة"**
2. احفظه في `conversations/YYYY-MM-DD/`
3. شغّل: `./scripts/git-sync.sh "وصف ما حدث"`

### من الجوال:

- استخدم **Termius app** للـ SSH للجهاز
- أو استخدم **Claude.ai App + GitHub MCP**

---

## 🔄 سياسة التحديث

| التكرار | المهمة |
|---|---|
| **بعد كل محادثة** | حفظ ملخص في `conversations/YYYY-MM-DD/` |
| **يومياً** | تحديث `INDEX.md` إذا حدثت تغييرات كبرى |
| **أسبوعياً** | مراجعة `customers/` و `infrastructure/` |
| **شهرياً** | رفع ZIP كامل لـ Project Knowledge في Claude.ai |

---

## 📝 معايير الملفات

كل ملف يجب أن يحوي:

```markdown
# عنوان الملف

> **تاريخ آخر تحديث:** YYYY-MM-DD
> **المسؤول:** علي غنيمة
> **الحالة:** [نشط / مؤرشف / مسودة]

## 1. الملخص (3-5 أسطر)
...

## 2. التفاصيل
...

## 3. القرارات المتخذة
- [x] قرار 1
- [x] قرار 2

## 4. المهام المفتوحة
- [ ] مهمة 1
- [ ] مهمة 2

## 5. الروابط
- [ملف ذو صلة](../path/file.md)
```

---

## 🛡️ النسخ الاحتياطي

- **Local:** على HP EliteBook في `~/iGarden_KB/`
- **Cloud 1:** GitHub repo `iGardenSA/igarden-kb`
- **Cloud 2:** Google Drive (تلقائي مع Linux Mint)

---

## 📞 للتواصل

- **المالك:** علي محمد غنيمة
- **البريد:** info@igarden.sa
- **الموقع:** https://igarden.sa

---

🌱 **iGarden — ازرع بذكاء**
*حين تزرع بذكاء، تحصد بثقة*
