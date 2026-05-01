# 🌱 iGarden HQ — Notion Workspace Map

> **أُنشئ:** 2026-05-01  
> **الحالة:** Source of Truth الرئيسي (GitHub = backup أسبوعي عبر n8n)  
> **الصفحة الجذر:** https://app.notion.com/p/353d74e79e41812bb77edc7fef783104

---

## قواعد البيانات (9 databases)

| الاسم | الرابط | Data Source ID |
|---|---|---|
| 📊 Events Timeline | https://app.notion.com/p/d68512e20cc54abdbc9bd86cef4ddef1 | `aa9023e4-584a-4c7a-8e2c-24f82e10ef5b` |
| 👥 Customers | https://app.notion.com/p/c3880f97cea041c993b01c378d7b2c72 | `c6b3dfda-77c0-403b-8a04-8533303d5fc9` |
| 🏗️ Projects | https://app.notion.com/p/faf402fec9b14541a32b85e720f7351d | `cbf5bf1d-0a60-452c-b8d8-3d27b4750a7b` |
| ✅ Tasks | https://app.notion.com/p/71424419b31d45d281029dd1f9808338 | `24a90aad-49c3-45b7-a676-373581e1b6f5` |
| 🎯 Decisions | https://app.notion.com/p/0e3fa0fb867349d686b03114e4f296ea | `21118247-2778-41a2-ba13-292c5ca98b69` |
| 🖧 Infrastructure | https://app.notion.com/p/426691293b504fd3938b05db64bd7317 | `052f75ed-4290-418c-bed9-cbd44441b1c0` |
| 👤 Team & Partners | https://app.notion.com/p/bf39908e73c94717a8f8dbbdcb0df3bd | `14e90c67-0d03-4f94-8d3f-e4a386a6b73e` |
| 💰 Finance | https://app.notion.com/p/1a855515884f438caa504f3099b4c61b | `f635e478-1399-43aa-9d64-fce588e61d8b` |
| 🤖 AI Daily Brief | https://app.notion.com/p/6f8617e6ed734531afa5bd703b381a6c | `1e3b8731-2169-4bc1-9205-ef22367f8855` |

---

## العلاقات بين قواعد البيانات

```
Tasks     → Customer  (→ Customers DB)
Tasks     → Project   (→ Projects DB)
Projects  → Customer  (→ Customers DB)
Events    → Customer  (→ Customers DB)
Events    → Project   (→ Projects DB)
```

---

## البيانات المُبذّرة

| القاعدة | السجلات |
|---|---|
| Customers | 4 (001-Khamis, 002-Ghulah, 003-Ahsa, 004-BinLaden) |
| Team & Partners | 5 (علي، أيمن، محمد، عبدالله، كمال) |
| Infrastructure | 4 (CM5-Hub, Pi5-Ghulah, ESP32-Tank, Cloudflare-Tunnel) |
| Finance | 4 (VAT Q1, زكاة 2025، رواتب، Vercel Trial) |
| Tasks | 10 (P0/P1/P2 من pending.md) |
| Decisions | 5 (Architecture + Business) |
| Projects | 5 (002-Ghulah، 003-Ahsa، Smart OS، Compliance، Sunbolah) |
| Events Timeline | 10 (Milestones + Decisions من 2026-02 إلى 2026-05) |
| AI Daily Brief | 0 (يُملأ يومياً 21:00) |

---

## ملاحظات للاستخدام مع Claude

- استخدم **Data Source ID** مع أدوات `notion-create-pages` و`notion-update-data-source`
- استخدم **Database URL** مع أداة `notion-fetch` للاطلاع على الـ schema
- القيم الحساسة (National ID, API Keys, passwords) → `~/igarden-secrets/` **ولا تُخزَّن في Notion**
