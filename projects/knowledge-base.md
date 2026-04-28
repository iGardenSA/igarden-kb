# 🚧 مشروع: بناء Knowledge Base

> **آخر تحديث:** 2026-04-28
> **الحالة:** 🟢 Layer 1 قيد التنفيذ (هذا الـ repo)

---

## 📌 الهدف

بناء قاعدة معرفية حيّة لـ iGarden تمنع **ضياع التفاصيل** عند compaction المحادثات في Claude. الذكاء الاصطناعي يبدأ كل محادثة جديدة **بمعرفة كاملة بالسياق** بدل تكرار الشرح من الصفر.

---

## ❌ المشكلة

```
محادثة 1 → ملخص → ضياع التفاصيل
محادثة 2 → ملخص → ضياع التفاصيل
محادثة 3 → فُتحت → Claude لا يعرف السياق
              ↓
       تكرار شرح كل شيء من الصفر
```

### الفجوة في Project Knowledge:
- ❌ لا يتم تحديثه تلقائياً
- ❌ المحادثات معزولة
- ❌ لا يكتشف التعارضات
- ❌ يفقد التفاصيل

---

## 🎯 الحل (3 طبقات)

### 🟢 Layer 1: Conversation Vault (يدوي) — الحالي
**الجهد:** يومان عمل
**الفائدة:** فوري — يحلّ 60% من المشكلة

```
igarden-kb/
├── company/         (هوية + فريق)
├── customers/       (ملف لكل عميل)
├── infrastructure/  (ملف لكل جهاز)
├── products/        (ملف لكل منتج/خط)
├── projects/        (حالة كل مشروع)
├── old/             (الأرشيف القديم)
├── INDEX.md
└── README.md
```

**كيف يعمل:**
1. بعد كل محادثة، اطلب من Claude ملفات معرفية تفصيلية
2. احفظها في المجلد المناسب
3. ارفع الكل لـ GitHub
4. ارفع ZIP لـ Project Knowledge شهرياً

### 🟡 Layer 2: Self-Updating KB (نصف-آلي) — قادم
**الجهد:** أسبوع عمل
**الفائدة:** 80% من المشكلة محلولة

```
أنت ──محادثة──→ Claude.ai
                    │
                    ▼
            ملخصات تفصيلية
                    │
                    ▼
        على Pi/CM5: claude curate
                    │
                    ├── يقرأ المحادثة الجديدة
                    ├── يقارنها بالـ KB الموجود
                    ├── يستخرج: قرارات + حقائق + TODOs
                    ├── يحدّث الملفات المناسبة
                    ├── يكشف التعارضات
                    ├── git commit + push
                    └── يُحدّث INDEX.md
                    │
                    ▼
        github.com/iGardenSA/igarden-kb
```

**التكلفة:** ~$1-3 لكل تحديث (Sonnet 4.5)
**متى نبدأ:** بعد إكمال Layer 1.

### 🔴 Layer 3: iGarden Knowledge OS (آلي بالكامل) — رؤية
راجع [products/knowledge-os.md](../products/knowledge-os.md) للتفاصيل الكاملة + الفرصة التجارية SaaS.
**متى نبدأ:** بعد سنبلة (يونيو-يوليو 2026).

---

## 🐙 GitHub كـ Single Source of Truth

**Repo:** `github.com/iGardenSA/igarden-kb`

### الإعدادات:
- Private (لأن فيه معلومات عملاء)
- Default branch: `main`
- Branch protection: لا (للسرعة)
- Issues: مفعّلة (لتتبع المهام)

### المزايا:
- ✅ مجاني (private repo بـ $4/شهر إذا لزم)
- ✅ Version control — كل تغيير له history
- ✅ Diff view — تشاهد الفروقات بصرياً
- ✅ Search — بحث نصي قوي
- ✅ Mobile-friendly — يفتح على الجوال
- ✅ GitHub MCP — Claude يقرأ مباشرة (Layer 2/3)
- ✅ Backup مزدوج — الجهاز + GitHub (راجع [infrastructure/hp-elitebook-ali.md](../infrastructure/hp-elitebook-ali.md))

---

## 📱 الاستخدام من الجوال

### الخيار 1: Claude.ai App + GitHub MCP
```
1. Settings → Add Tool → GitHub Connector
2. Authorize iGardenSA org
3. في كل محادثة: "اقرأ INDEX.md من iGardenSA/igarden-kb"
4. Claude يقرأ الـ KB مباشرة
```

### الخيار 2: SSH إلى Pi/CM5
```bash
# من Termius:
ssh i@192.168.8.21
cd /opt/igarden_kb && claude
```

### الخيار 3: مباشرة من GitHub
`https://github.com/iGardenSA/igarden-kb/blob/main/INDEX.md`

---

## 🤖 استراتيجية نماذج Claude

| السيناريو | النموذج | السبب |
|---|---|---|
| مراجعة عقد العميل | Opus 4.7 | تحليل قانوني دقيق |
| كتابة ESPHome YAML | Sonnet 4.5 (Claude Code) | برمجة عالية الجودة |
| إصلاح bug في Vercel | Sonnet 4.5 (Claude Code) | تشخيص سريع |
| كتابة Pitch Deck | Opus 4.7 | محتوى عالي القيمة |
| ترجمة Operating Manual | Haiku 4.5 | مهمة بسيطة متكررة |
| نقاش معماري عميق | Opus 4.7 | قرار استراتيجي |
| تحديث Master Doc | Sonnet 4.5 | كتابة احترافية |
| WhatsApp bot للعملاء | Haiku 4.5 | سرعة + اقتصاد |
| تحليل بيانات حساسات | Sonnet 4.5 | كافٍ تماماً |

> **القاعدة الذهبية:** Opus للقرار، Sonnet للتنفيذ، Haiku للأتمتة. الاستخدام الأعمى لـ Opus = إهدار 80% من الموارد. لتفاصيل الأسعار وسياسة Token Budget والمفاهيم (Token, Context Window, Compaction) راجع الأرشيف [old/conversations/2026-04-27/03-claude-models-strategy.md](../old/conversations/2026-04-27/03-claude-models-strategy.md).

---

## 🚦 المهام المفتوحة لـ Layer 1

### عاجل 🔴
- [x] إنشاء هيكل المجلد ✅
- [x] كتابة README.md ✅
- [x] كتابة INDEX.md ✅
- [x] توثيق جلسة 2026-04-27 (4 ملفات أصلية) ✅
- [x] إعادة هيكلة لـ company/customers/infrastructure/products/projects ✅ (2026-04-28)
- [ ] إنشاء GitHub repo `iGardenSA/igarden-kb`
- [ ] دفع الملفات الأولى
- [ ] رفع ZIP لـ Project Knowledge

### قريب 🟡
- [ ] توثيق العميل 001 بالتفصيل (يحتاج معلومات من علي)
- [ ] توثيق Pi 5 العميل 002 بالتفصيل (مع YAML)
- [ ] توثيق CM5 Hub بالتفصيل
- [x] إنشاء سكربت `git-sync.sh` (في old/scripts/)
- [x] إنشاء سكربت `new-conversation.sh` (في old/scripts/)
- [ ] استرجاع/تحديث السكربتات لتعكس البنية الجديدة

### مستقبل 🟢
- [ ] Layer 2: Claude Code curator script
- [ ] Layer 3: MCP Server مخصّص — راجع [products/knowledge-os.md](../products/knowledge-os.md)
- [ ] (محتمل) منتج SaaS منفصل

---

## 🔗 ملفات ذات صلة

- [INDEX.md](../INDEX.md)
- [README.md](../README.md)
- [iGarden Knowledge OS (Layer 3 رؤية)](../products/knowledge-os.md)
- [أرشيف الجلسات الأصلية](../old/conversations/)

---

🌱 **iGarden — ازرع بذكاء**

> "حتى المعرفة تستحق أن تُزرع بذكاء."
