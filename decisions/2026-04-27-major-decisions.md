# 🎯 القرارات الكبرى — جلسة 2026-04-27 (HQ2)

> **التاريخ:** 2026-04-27
> **المسؤول:** علي محمد غنيمة
> **الحالة:** ✅ معتمدة
> **السياق:** جلسة HQ2 الطويلة على Claude.ai (راجع `conversations/2026-04-27/`)

---

## 📌 الملخص

تسعة قرارات استراتيجية تم اعتمادها في جلسة HQ2 لتثبيت اتجاه iGarden قصير ومتوسط المدى: من العلامة (Tagline) إلى المعمارية والبنية المعرفية. كل قرار هنا له **مبرّر**، **بديل مرفوض**، و**أثر عملي**.

---

## 1️⃣ اعتماد «ازرع بذكاء» كـ Tagline نهائي

| البند | القيمة |
|---|---|
| **القرار** | "ازرع بذكاء" هو الـ tagline الرسمي والوحيد |
| **المبرر** | يجمع بين القيمة (الذكاء) + الفعل (ازرع) — قصير، عربي أصيل، قابل للترجمة |
| **البديل المرفوض** | "حين تزرع بذكاء، تحصد بثقة" (طويل، ليس tagline بل شعار ختامي) |
| **الأثر العملي** | يُستخدم في Header الموقع، Pitch Deck، LinkedIn، Email signature |

**ملاحظة:** الجملة الطويلة تبقى **شعاراً ختامياً (footer)** في الوثائق الرسمية فقط.

---

## 2️⃣ حذف Tagline من Header + الأيقونة الخضراء

| البند | القيمة |
|---|---|
| **القرار** | إزالة "ازرع بذكاء" من Header الموقع + إزالة الأيقونة الخضراء بجانب الشعار |
| **المبرر** | Header مزدحم بصرياً → يقلّل من جاذبية CTA الرئيسي. الـ tagline يبقى في Hero section فقط |
| **البديل المرفوض** | الإبقاء على Tagline + Icon لـ "تعزيز الهوية" — رفضناه لأنه يشتت |
| **الأثر العملي** | Commit على repo الموقع — يحتاج push لـ Vercel |

---

## 3️⃣ sessionStorage بدل localStorage في الديمو

| البند | القيمة |
|---|---|
| **القرار** | استخدام `sessionStorage` لتخزين حالة الديمو (التبويب النشط، الفلاتر) |
| **المبرر** | الديمو **تجريبي** — لا نريد أن تبقى الحالة بين الجلسات. كل زائر يبدأ نظيفاً |
| **البديل المرفوض** | `localStorage` (يبقى للأبد) — يربك الزائر العائد |
| **الأثر العملي** | تعديل في `app/page.tsx` على demo.igarden.sa — مُطبَّق |

---

## 4️⃣ HA Container كأساس للعملاء (001، 002، 003)

| البند | القيمة |
|---|---|
| **القرار** | جميع التركيبات الميدانية تستخدم Home Assistant Container على Pi 5 + Docker |
| **المبرر** | مُجرَّب ميدانياً (شعير + خس)، نشر في 3-5 أيام، 2,000+ integration، Mobile App جاهز |
| **البديل المرفوض** | iGarden FastAPI Native (يحتاج 3-6 أشهر، maintenance burden عالٍ) |
| **الأثر العملي** | كل العملاء حتى رقم 10 على HA. ما بعد ذلك يُعاد التقييم |

تفاصيل كاملة في: [`architecture/ha-vs-fastapi-decision.md`](../architecture/ha-vs-fastapi-decision.md)

---

## 5️⃣ iGarden Smart OS Native في Pause

| البند | القيمة |
|---|---|
| **القرار** | إيقاف العمل النشط على iGarden Smart OS Native (FastAPI) — مع الإبقاء على ما تم |
| **المبرر** | لا قيمة تجارية فورية. 208 unit tests passing لكن Phases 3B/3C/3D/4/5 لم تكتمل |
| **البديل المرفوض** | استكمال Phases 3-5 بالتوازي مع الميدان (يستهلك Sonnet credits بدون عائد فوري) |
| **الأثر العملي** | الكود محفوظ على Pi 5 — يستأنف بعد 5-10 عملاء HA |

تفاصيل البنية في: [`infrastructure/pi5-fastapi-native.md`](../infrastructure/pi5-fastapi-native.md)

---

## 6️⃣ Subdomains منفصلة (demo / app / shop)

| البند | القيمة |
|---|---|
| **القرار** | فصل المنتجات الرقمية على subdomains مستقلة بدلاً من routes داخل النطاق الرئيسي |
| **التوزيع** | `demo.igarden.sa` (Next.js)، `app.igarden.sa` (لاحقاً للعملاء)، `shop.igarden.sa` (لاحقاً للمبيعات) |
| **المبرر** | كل subdomain له stack مختلف + dev cycle منفصل + إمكانية نقل provider بدون كسر |
| **البديل المرفوض** | `igarden.sa/demo`, `/app`, `/shop` — يربط كل شيء بـ stack واحد |
| **الأثر العملي** | DNS records جاهزة على Vercel. مبدأ التصميم معتمد لكل مشروع جديد |

---

## 7️⃣ اختيار نماذج Claude حسب التعقيد

| البند | القيمة |
|---|---|
| **القرار** | لا يُستخدم Opus 4.7 إلا للقرارات الاستراتيجية والمراجعات القانونية. Sonnet 4.5 هو default |
| **التوزيع** | 20% Opus (قرارات) + 70% Sonnet (تنفيذ + Claude Code) + 10% Haiku (أتمتة) |
| **المبرر** | استخدام Opus لكل شيء = إهدار 3-5× من الرصيد. $24 رصيد = 5 محادثات Opus عميقة فقط |
| **البديل المرفوض** | Opus default — رفضناه بناءً على حساب TCO |
| **الأثر العملي** | تغيير Default Model في Claude.ai → Sonnet 4.5 |

تفاصيل كاملة: [`conversations/2026-04-27/03-claude-models-strategy.md`](../conversations/2026-04-27/03-claude-models-strategy.md)

---

## 8️⃣ Knowledge Base على GitHub كـ Single Source of Truth

| البند | القيمة |
|---|---|
| **القرار** | جميع المعرفة المهنية لـ iGarden في repo `iGardenSA/igarden-kb` على GitHub |
| **المبرر** | Version control + Diff + بحث + Mobile-friendly + GitHub MCP لـ Claude |
| **البديل المرفوض** | Notion / Google Docs (لا version control قابل للقراءة آلياً) |
| **الأثر العملي** | **Public** repo (لا أسرار حرجة). Claude يقرأه عبر `raw.githubusercontent.com` |

> ⚠️ **تنبيه:** التوكنات الحساسة (Telegram bot, API keys) **لا** يجب وضعها في الـ repo العام. تُحفظ في `.env` خارج Git أو في password manager.

تفاصيل الاستراتيجية: [`conversations/2026-04-27/04-knowledge-base-strategy.md`](../conversations/2026-04-27/04-knowledge-base-strategy.md)

---

## 9️⃣ منهج Layer 1 → Layer 2 → Layer 3 للـ KB

| الطبقة | الوصف | الجهد | الفائدة | الحالة |
|---|---|---|---|---|
| **Layer 1: Conversation Vault** | ملفات MD يدوية بعد كل محادثة | يومان | 60% | 🟢 قيد التنفيذ |
| **Layer 2: Self-Updating KB** | سكربت `claude curate` على CM5 يحدّث الـ KB تلقائياً | أسبوع | 80% | 🟡 لاحقاً |
| **Layer 3: iGarden Knowledge OS** | MCP Server + Knowledge Graph + احتمال SaaS | 3 أسابيع | 99% | 🔴 بعد سنبلة |

| البند | القيمة |
|---|---|
| **المبرر** | بناء تدريجي بدلاً من قفزة كبيرة. كل طبقة تُثبت قيمتها قبل الانتقال |
| **البديل المرفوض** | بناء Layer 3 مباشرة (over-engineering قبل وجود محتوى يستحق) |
| **الأثر العملي** | اليوم نحن في **منتصف Layer 1**. Layer 2 يبدأ بعد 5 جلسات موثّقة |

---

## 📊 ملخص الأثر على الأولويات

```
✅ معتمد فوراً:           Tagline + Header + sessionStorage + KB Layer 1
⏳ بدء فوري على HA:       العملاء 001، 002، 003
⏸️ Pause مدروس:           FastAPI Native
🔄 إعادة تقييم لاحقة:      KB Layer 2/3، CM5 كـ Cloud Backend
```

---

## 🔗 ملفات ذات صلة

- [تطوّر المعماريات الـ 3](../architecture/three-projects-evolution.md)
- [قرار HA vs FastAPI المفصّل](../architecture/ha-vs-fastapi-decision.md)
- [استراتيجية Claude models](../conversations/2026-04-27/03-claude-models-strategy.md)
- [استراتيجية KB](../conversations/2026-04-27/04-knowledge-base-strategy.md)
- [العميل 003 — الأحساء (مُضاعَف)](../customers/003-ahsa-rayana.md)

---

🌱 **iGarden — ازرع بذكاء**
