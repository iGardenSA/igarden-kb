# 🧠 استراتيجية Knowledge Base لـ iGarden

> **التاريخ:** 2026-04-27
> **النوع:** قرار استراتيجي + خطة تنفيذ
> **الحالة:** ✅ Layer 1 قيد التنفيذ

---

## 📌 الملخص

بناء قاعدة معرفية حيّة لـ iGarden تمنع **ضياع التفاصيل** عند compaction المحادثات في Claude. الهدف: الذكاء الاصطناعي يبدأ كل محادثة جديدة **بمعرفة كاملة بالسياق**.

---

## ❌ المشكلة الحقيقية

### ما يحدث الآن:
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

## 🎯 الحل المقترح (3 طبقات)

### 🟢 Layer 1: Conversation Vault (يدوي)
**الجهد:** يومان عمل
**الفائدة:** فوري — يحلّ 60% من المشكلة

```
~/iGarden_KB/
├── conversations/YYYY-MM-DD/   (ملفات تفصيلية لكل جلسة)
├── customers/                   (معرفة منظّمة)
├── infrastructure/
├── decisions/
└── INDEX.md                     (الفهرس الذكي)
```

**كيف يعمل:**
1. بعد كل محادثة، اطلب من Claude ملفات معرفية تفصيلية
2. احفظها في المجلد المناسب
3. ارفع الكل لـ GitHub
4. ارفع ZIP لـ Project Knowledge شهرياً

**الحالة الآن:** ✅ **هذا ما نبنيه الآن — هذا الملف نفسه جزء منه!**

### 🟡 Layer 2: Self-Updating KB (نصف-آلي)
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

**متى نبدأ:** بعد إكمال Layer 1 (الأسبوع القادم).

### 🔴 Layer 3: iGarden Knowledge OS (آلي بالكامل)
**الجهد:** 3 أسابيع عمل
**الفائدة:** 99% من المشكلة محلولة + منتج SaaS محتمل

```
Claude.ai → Conversation Ingest → Knowledge Graph
                                         │
                                         ▼
                                  MCP Server (يخدم Claude)
                                         │
                                         ▼
                                  Doc Generator → GitHub
```

**المكوّنات:**
- Conversation API (يجلب محادثات Claude.ai)
- Knowledge Extractor (Haiku 4.5 لاستخراج المعلومات)
- Knowledge Graph (PostgreSQL على CM5)
- MCP Server مخصّص (يخدم Claude بشكل حيّ)
- Conflict Detector
- Doc Generator (يحدّث MD files)

**متى نبدأ:** بعد سنبلة (يونيو-يوليو 2026).

**فرصة تجارية:**
> هذا الحل يمكن بيعه لشركات IoT أخرى تواجه نفس المشكلة. SaaS @ $29-299/شهر.

---

## 📁 هيكل Layer 1 (الذي نبنيه الآن)

```
igarden_kb/
├── README.md                    ← دليل الاستخدام
├── INDEX.md                     ← الفهرس الرئيسي
│
├── customers/
│   ├── 001-khamis-mushait.md
│   ├── 002-ghulah-lettuce.md
│   └── 003-ahsa-rayana.md
│
├── infrastructure/
│   ├── pi5-customer2-ghulah.md
│   ├── cm5-osfan-hub.md
│   └── pi5-fastapi-native.md
│
├── architecture/
│   ├── three-projects-evolution.md
│   └── ha-vs-fastapi-decision.md
│
├── decisions/
│   └── 2026-04-27-demo-deployment.md
│
├── operations/
│   ├── deployment-checklist.md
│   └── customer-onboarding.md
│
├── conversations/               ← الأرشيف
│   └── 2026-04-27/
│       ├── 01-demo-deployment.md
│       ├── 02-architecture-evolution.md
│       ├── 03-claude-models-strategy.md
│       └── 04-knowledge-base-strategy.md ← هذا الملف!
│
└── scripts/
    ├── new-conversation.sh      ← إنشاء مجلد جلسة جديدة
    └── git-sync.sh              ← دفع التحديثات لـ GitHub
```

---

## 🐙 GitHub كـ Single Source of Truth

### المزايا:
- ✅ **مجاني** (private repo بـ $4/شهر إذا لزم)
- ✅ **Version control** — كل تغيير له history
- ✅ **Diff view** — تشاهد الفروقات بصرياً
- ✅ **Search** — بحث نصي قوي
- ✅ **Mobile-friendly** — يفتح على الجوال
- ✅ **GitHub MCP** — Claude يقرأ مباشرة (Layer 2/3)
- ✅ **Backup مزدوج** — الجهاز + GitHub

### Repo المقترح:
```
github.com/iGardenSA/igarden-kb
```

**الإعدادات:**
- Private (لأن فيه معلومات عملاء)
- Default branch: `main`
- Branch protection: لا (للسرعة)
- Issues: مفعّلة (لتتبع المهام)

---

## 📱 الاستخدام من الجوال

### الخيار 1: Claude.ai App + GitHub MCP

```
1. Settings → Add Tool → GitHub Connector
2. Authorize iGardenSA org
3. في كل محادثة:
   "اقرأ INDEX.md من iGardenSA/igarden-kb"
4. Claude يقرأ الـ KB مباشرة
```

### الخيار 2: SSH إلى Pi/CM5

```bash
# من Termius على الجوال:
ssh igarden@192.168.8.21

# داخل Pi:
cd /opt/igarden_kb
claude
```

### الخيار 3: مباشرة من GitHub

من الجوال، افتح:
```
https://github.com/iGardenSA/igarden-kb/blob/main/INDEX.md
```

---

## 🔄 Workflow اليومي المقترح

### بعد كل محادثة Claude مهمة:

```bash
# 1. اطلب من Claude
"اكتب ملف معرفي تفصيلي لما تم في هذه الجلسة"

# 2. احفظ الملف
mkdir -p ~/iGarden_KB/conversations/$(date +%Y-%m-%d)
cd ~/iGarden_KB/conversations/$(date +%Y-%m-%d)
# الصق محتوى Claude في ملف .md جديد

# 3. ادفع لـ GitHub
cd ~/iGarden_KB
git add .
git commit -m "Add: $(date +%Y-%m-%d) — وصف ما حدث"
git push origin main
```

أو استخدم سكربت الأتمتة:
```bash
~/iGarden_KB/scripts/git-sync.sh "وصف ما حدث"
```

### أسبوعياً:

```bash
# 1. مراجعة TODOs
grep -r "- \[ \]" ~/iGarden_KB/

# 2. تحديث INDEX.md إذا احتاج
nano ~/iGarden_KB/INDEX.md

# 3. ZIP ورفع لـ Project Knowledge
cd ~/iGarden_KB
zip -r igarden_kb.zip . -x "*.git*"
# ارفع ZIP لـ Claude.ai → Project Knowledge
```

---

## 🎯 معايير الجودة لكل ملف

### الملف الجيّد يحتوي:

```markdown
# عنوان واضح

> تاريخ + نوع + حالة

## ملخص (3-5 أسطر)
ما هو هذا الملف، لماذا وُجد

## التفاصيل التقنية
كل شيء بدقة — لا تختصر

## القرارات المتخذة
- [x] قرار 1
- [x] قرار 2

## المهام المفتوحة
- [ ] مهمة 1
- [ ] مهمة 2

## ملفات ذات صلة
- روابط للملفات الأخرى
```

### قواعد:
1. **اكتب بالعربية** (لأن الفريق عربي)
2. **استخدم emojis للتنقل البصري** 🟢🟡🔴
3. **لا تختصر** — التفاصيل أهم من الجمال
4. **استخدم جداول** للمقارنات
5. **أضف diagrams ASCII** عند الحاجة
6. **رابط بين الملفات** عبر relative links

---

## 🚦 المهام المفتوحة لـ Layer 1

### عاجل 🔴
- [x] إنشاء هيكل المجلد ✅ (هذا الملف!)
- [x] كتابة README.md ✅
- [x] كتابة INDEX.md ✅
- [x] توثيق جلسة 2026-04-27 (4 ملفات) ✅
- [ ] إنشاء GitHub repo `iGardenSA/igarden-kb`
- [ ] دفع الملفات الأولى
- [ ] رفع ZIP لـ Project Knowledge

### قريب 🟡
- [ ] توثيق العميل 001 بالتفصيل (يحتاج معلومات من علي)
- [ ] توثيق Pi 5 العميل 002 بالتفصيل (مع YAML)
- [ ] توثيق CM5 Hub بالتفصيل
- [ ] إنشاء سكربت `git-sync.sh`
- [ ] إنشاء سكربت `new-conversation.sh`

### مستقبل 🟢
- [ ] Layer 2: Claude Code curator script
- [ ] Layer 3: MCP Server مخصّص
- [ ] (محتمل) منتج SaaS منفصل

---

## 🔗 ملفات ذات صلة

- [INDEX.md](../../INDEX.md)
- [README.md](../../README.md)
- [نموذج Claude الاستراتيجية](./03-claude-models-strategy.md)

---

🌱 **iGarden — ازرع بذكاء**

> "حتى المعرفة تستحق أن تُزرع بذكاء."
