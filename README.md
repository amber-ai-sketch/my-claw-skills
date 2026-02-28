# My Claw Skills 🎯

> OpenClaw 自动化技能集合

## Skills 列表

| Skill | 路径 | 描述 | 状态 |
|-------|------|------|------|
| **PM每日内参** | `skills/pm-daily-briefing/` | 生成PM每日AI情报内参日报，追踪国内外AI大厂动态、新模型进展、AI Agent产品等 | ✅ 完善中 |
| **小爱同学用户反馈日报** | `skills/xiaomi-xiaoai-daily/` | 搜索抖音、小红书、B站等平台关于小米小爱同学的用户反馈，按正负面分类整理 | ✅ 完善中 |

## 安装使用

### 克隆整个仓库

```bash
git clone https://github.com/amber-ai-sketch/my-claw-skills.git
cd my-claw-skills
```

### 克隆单个 Skill（推荐）

使用 Git sparse-clone 单独克隆某个 skill：

```bash
# 创建空仓库
git init my-claw-skills
cd my-claw-skills

# 添加远程
git remote add origin https://github.com/amber-ai-sketch/my-claw-skills.git

# 开启 sparse 模式
git config core.sparseCheckout true

# 设置要克隆的目录
echo "skills/pm-daily-briefing/" > .git/info/sparse-checkout

# 克隆
git pull origin main
```

或者直接下载单个文件夹（GitHub 支持）：
访问 `https://github.com/amber-ai-sketch/my-claw-skills/tree/main/skills/xxx` 然后点击 "Download ZIP"

## 添加新 Skill

1. 在 `skills/` 目录下创建新文件夹
2. 添加 `SKILL.md` 文件（包含技能说明和使用方法）
3. 提交并推送到 GitHub

```
skills/
├── pm-daily-briefing/
│   ├── SKILL.md      # 必选：Skill 定义
│   ├── README.md     # 可选：详细说明
│   └── scripts/      # 可选：辅助脚本
└── xiaomi-xiaoai-daily/
    ├── SKILL.md
    └── ...
```

## 依赖

部分 Skill 需要以下依赖：

- **Tavily Search Skill** - 用于搜索新闻/用户反馈
- **飞书** - 用于发送消息（部分 Skill）

---

🔥 小火龙整理 | https://github.com/amber-ai-sketch/my-claw-skills
