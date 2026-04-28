#!/bin/bash
# init-repo.sh — تهيئة Knowledge Base كـ git repo + ربطه بـ GitHub
# يُشغّل مرة واحدة فقط

set -e

KB_DIR="$(dirname "$(realpath "$0")")/.."
cd "$KB_DIR"

echo "🚀 تهيئة iGarden Knowledge Base"
echo "================================"

# 1. التأكد من git
if ! command -v git &> /dev/null; then
    echo "❌ git غير مثبّت. ثبّته أولاً:"
    echo "   sudo apt install git"
    exit 1
fi

# 2. التأكد من gh CLI (للتسهيل)
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI غير مثبّت (اختياري لكنه يُسهّل)"
    echo "   للتثبيت: sudo apt install gh"
    echo ""
fi

# 3. تهيئة git
if [ ! -d ".git" ]; then
    git init
    git branch -M main
    echo "✅ git repo مُهيَّأ"
else
    echo "ℹ️  git repo موجود مسبقاً"
fi

# 4. .gitignore
cat > .gitignore << 'EOF'
# Backups
*.bak
*.swp
.DS_Store

# Secrets (لا ترفع هذه الملفات لـ GitHub أبداً)
secrets/
*.pem
*.key
.env*

# OS
Thumbs.db
.DS_Store

# IDE
.vscode/
.idea/

# Temporary
*.tmp
*.log
EOF
echo "✅ .gitignore جاهز"

# 5. أول commit
if [ -z "$(git log --oneline 2>/dev/null)" ]; then
    git add .
    git commit -m "init: iGarden Knowledge Base v1.0

- README + INDEX
- Customer files (001, 002, 003)
- Architecture documents
- Conversation archive (2026-04-27)
- Automation scripts"
    echo "✅ أول commit جاهز"
fi

# 6. إنشاء GitHub repo (إذا gh متوفر)
echo ""
read -p "🌐 هل تريد إنشاء GitHub repo الآن؟ (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    if command -v gh &> /dev/null; then
        gh repo create iGardenSA/igarden-kb \
            --private \
            --source=. \
            --remote=origin \
            --push \
            --description "iGarden Knowledge Base — قاعدة معرفية لشركة iGarden"
        
        echo ""
        echo "✅ Repo جاهز على GitHub!"
        echo "🌐 https://github.com/iGardenSA/igarden-kb"
    else
        echo ""
        echo "⚠️  GitHub CLI غير مثبّت"
        echo ""
        echo "📋 الخطوات اليدوية:"
        echo "1. اذهب لـ: https://github.com/new"
        echo "2. اسم Repo: igarden-kb"
        echo "3. Owner: iGardenSA"
        echo "4. Visibility: Private"
        echo "5. ❌ لا تضع README/gitignore (موجودة عندنا)"
        echo "6. اضغط Create"
        echo ""
        echo "ثم في Terminal:"
        echo "   git remote add origin https://github.com/iGardenSA/igarden-kb.git"
        echo "   git push -u origin main"
    fi
fi

# 7. تنظيم الصلاحيات
chmod +x scripts/*.sh
echo "✅ سكربتات قابلة للتنفيذ"

echo ""
echo "🎉 تم! Knowledge Base جاهزة"
echo ""
echo "📚 الخطوات القادمة:"
echo "1. لإنشاء جلسة جديدة:    ./scripts/new-conversation.sh"
echo "2. لدفع التحديثات:        ./scripts/git-sync.sh \"وصف\""
echo "3. لرفع لـ Project KB:    zip -r kb.zip . -x '*.git*' && ارفع لـ Claude.ai"
echo ""
echo "🌱 iGarden — ازرع بذكاء"
