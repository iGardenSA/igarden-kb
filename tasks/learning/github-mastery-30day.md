# 🎓 GitHub Mastery — خطّة 30 يوم

> **آخر تحديث:** 2026-05-01
> **المتعلِّم:** علي محمد غنيمة
> **الهدف:** إتقان GitHub workflow الاحترافي (أساسيات + أمن + تعاون + CI/CD)
> **التقدم:** اشطب البند بعد إنجازه + أضف حدث في `events.md` تحت entity `github-mastery`

---

## 📅 الأسبوع 1: الأساسيات (D1-D7)

- [ ] **D1:** قراءة `git log --graph` وفهم HEAD/branches
- [ ] **D2:** إنشاء branch `dev` + workflow dev → main
- [ ] **D3:** `.gitignore` متقدم + إزالة ملفات مسرّبة من tracking
- [ ] **D4:** تطبيق Conventional Commits (`feat:`, `fix:`, `docs:`)
- [ ] **D5:** `git diff` + `git stash` + `git restore`
- [ ] **D6:** محاكاة merge conflict وحلّه
- [ ] **D7:** إعادة تنظيم commits بـ `git rebase -i`

---

## 🔐 الأسبوع 2: الأمان — الأهم 🚨 (D8-D14)

- [ ] **D8:** تثبيت `git-secrets` + regex للـ tokens
- [ ] **D9:** `git filter-repo` لمسح Anthropic API key من history
- [ ] **D10:** `git filter-repo` لمسح ESPHome keys + Telegram token
- [ ] **D11:** تفعيل GitHub Secret Scanning + Push Protection
- [ ] **D12:** `pre-commit` hooks لمنع commits خطرة
- [ ] **D13:** إعداد `.env.example` + سياسة أسرار واضحة
- [ ] **D14:** force push للـ history النظيف + إخطار GitHub

> 💡 **D9-D10 يستفيدان من** `scripts/igarden-security-fix.sh` — السكربت جاهز ينفّذ filter-repo بأمان (يقرأ الأسرار من ملف خارجي).

---

## 🤝 الأسبوع 3: التعاون والـ PRs (D15-D21)

- [ ] **D15:** Branch protection rules على `main`
- [ ] **D16:** أول PR عبر `gh pr create`
- [ ] **D17:** PR template مخصّص لـ iGarden
- [ ] **D18:** Issue templates (bug / feature / customer-task)
- [ ] **D19:** GitHub Projects (Kanban) + استيراد `tasks/pending.md`
- [ ] **D20:** نظام Labels (P0-P3 + customer-XXX + area:*)
- [ ] **D21:** نقل 3 مهام P0 إلى Issues مع milestone

---

## 🤖 الأسبوع 4: الأتمتة (CI/CD) (D22-D30)

- [ ] **D22:** Action: lint لصيغة `events.md` (فحص `YYYY-MM-DD | entity | desc`)
- [ ] **D23:** Action: بناء `INDEX.md` تلقائياً
- [ ] **D24:** Action: `gitleaks` scan قبل merge
- [ ] **D25:** Action: إشعار Telegram عند push على main
- [ ] **D26:** GitHub CLI متقدم (`gh issue`, `gh pr review`, `gh run watch`)
- [ ] **D27:** Tags + Releases (`v1.0-kb`, `v1.0-bot`، إلخ)
- [ ] **D28:** Dependabot + سياسة security
- [ ] **D29:** إنشاء repo `iGardenSA/igarden-bot` للـ n8n workflows
- [ ] **D30:** PR كامل لـ customer-004 وهمي (workflow شامل من branch → PR → review → merge)

---

## 🔗 ربط بـ events.md

عند إكمال أيّ يوم، أضف:

```
2026-MM-DD | github-mastery | D<n> done — <خلاصة قصيرة>
```

مثال:
```
2026-05-08 | github-mastery | D8 done — git-secrets installed + regex patterns for sk-ant-, ghp_, AIza tested
```

---

## 📋 الأنماط الموصى بها

### Conventional Commits (D4)
```
feat: ميزة جديدة
fix: إصلاح bug
docs: تحديث توثيق
refactor: إعادة هيكلة بدون تغيير سلوك
test: إضافة/تعديل tests
chore: مهام صيانة (deps، configs)
event: إضافة حدث في events.md (خاص بـ KB)
security: تصحيح أمني
```

### Branch Naming
```
feat/<short-name>      → ميزة جديدة
fix/<bug-description>  → إصلاح
event/<entity>         → أحداث events.md
merge/<scope>          → integration branches
claude/<session-id>    → جلسات Claude Code
```

### PR Title Format
```
<type>: <العنوان بالعربي أو الإنجليزي>
```

---

## 🎯 المحطات المهمّة

| المحطّة | متى | ماذا تتقن |
|---|---|---|
| **End of Week 1** | D7 | ✅ git workflow أساسي بدون قلق |
| **End of Week 2** | D14 | 🔐 KB نظيف من الأسرار + history آمن |
| **End of Week 3** | D21 | 🤝 PR/Issues/Projects للعمل الجماعي |
| **End of Week 4** | D30 | 🚀 KB يعمل بـ CI/CD متكامل |

---

🌱 **iGarden — ازرع بذكاء**
