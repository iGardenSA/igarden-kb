#!/bin/bash
# new-conversation.sh — إنشاء مجلد لجلسة Claude جديدة
# الاستخدام: ./new-conversation.sh

set -e

KB_DIR="$(dirname "$(realpath "$0")")/.."
DATE=$(date +%Y-%m-%d)
CONV_DIR="$KB_DIR/conversations/$DATE"

# إنشاء المجلد
mkdir -p "$CONV_DIR"

# عرض الملفات الموجودة (إن وجدت)
echo "📁 المجلد: $CONV_DIR"

if [ "$(ls -A "$CONV_DIR")" ]; then
    echo "📋 الملفات الموجودة:"
    ls -la "$CONV_DIR"
fi

# طلب اسم الجلسة
echo ""
read -p "📝 اسم الجلسة (مثل: ahsa-contract-review): " session_name

# تنظيف الاسم
session_name=$(echo "$session_name" | tr ' ' '-' | tr -cd '[:alnum:]-')

# إيجاد الرقم التالي
NEXT_NUM=$(ls "$CONV_DIR" 2>/dev/null | grep -oP '^\d+' | sort -n | tail -1 || echo "0")
NEXT_NUM=$((NEXT_NUM + 1))
NUM_PADDED=$(printf "%02d" $NEXT_NUM)

FILE="$CONV_DIR/${NUM_PADDED}-${session_name}.md"

# إنشاء قالب
cat > "$FILE" << EOF
# 📝 [عنوان الجلسة]

> **التاريخ:** $DATE
> **النوع:** [نقاش / تنفيذ / قرار]
> **الحالة:** [قيد العمل / مكتمل]
> **النموذج:** [Opus 4.7 / Sonnet 4.5]

---

## 📌 الملخص التنفيذي

[3-5 أسطر عن ما تم في الجلسة]

---

## 🎯 الهدف

[ما الذي أردت تحقيقه في هذه المحادثة]

---

## 📋 ما تم إنجازه

### ✅ منجز
- [ ] إنجاز 1
- [ ] إنجاز 2

### ⏳ قيد العمل
- [ ] مهمة قيد الإنجاز

### 🔴 لم يبدأ
- [ ] مهمة مستقبلية

---

## 🔧 التفاصيل التقنية

[كل التفاصيل الدقيقة — لا تختصر]

---

## 📝 القرارات المتخذة

1. **قرار 1:** [وصف + المبرّر]
2. **قرار 2:** [وصف + المبرّر]

---

## 🚨 المهام المفتوحة

- [ ] مهمة 1
- [ ] مهمة 2

---

## 🔗 ملفات ذات صلة

- [INDEX.md](../../INDEX.md)

---

🌱 **iGarden — ازرع بذكاء**
EOF

echo ""
echo "✅ تم إنشاء: $FILE"
echo ""
echo "📝 افتح الملف الآن للتعديل:"
echo "   nano $FILE"
echo "   أو"
echo "   code $FILE"
