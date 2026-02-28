# My Claw Skills 🎯

存放 OpenClaw 自动化技能集合

## Skills 列表

| Skill | 路径 | 描述 |
|-------|------|------|
| **PM每日内参** | `skills/pm-daily-briefing/` | 生成PM每日AI情报内参日报，追踪国内外AI大厂动态、新模型进展、AI Agent产品等 |
| **小爱同学用户反馈日报** | `skills/xiaomi-xiaoai-daily/` | 搜索抖音、小红书、B站等平台关于小米小爱同学的用户反馈，按正负面分类整理 |

## 安装使用

### 方式1: 克隆单个 Skill

```bash
# 克隆 pm-daily-briefing
git clone https://github.com/amber-ai-sketch/my-claw-skills.git --depth 1 --branch main --sparse skills/pm-daily-briefing

# 克隆 xiaomi-xiaoai-daily  
git clone https://github.com/amber-ai-sketch/my-claw-skills.git --depth 1 --branch main --sparse skills/xiaomi-xiaoai-daily
```

### 方式2: 克隆整个仓库

```bash
git clone https://github.com/amber-ai-sketch/my-claw-skills.git
cd my-claw-skills
```

## 添加新 Skill

1. 在 `skills/` 目录下创建新文件夹
2. 添加 `SKILL.md` 文件（包含技能说明和使用方法）
3. 提交并推送到 GitHub

```
skills/
├── pm-daily-briefing/
│   ├── SKILL.md
│   ├── README.md
│   └── scripts/
└── xiaomi-xiaoai-daily/
    ├── SKILL.md
    └── ...
```

---
🔥 小火龙整理
