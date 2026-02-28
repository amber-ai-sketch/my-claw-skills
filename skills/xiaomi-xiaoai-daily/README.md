# 小爱同学用户反馈日报 Skill

> 搜索抖音、小红书、B站等平台关于小米小爱同学的用户反馈，按正负面分类整理

## 功能特性

- 🔍 **多平台搜索** - 使用Tavily搜索各平台用户反馈
- 📊 **正负面分类** - 按正面、负面分类梳理
- 📤 **定时发送** - 支持cron定时发送到飞书

## 安装

将本文件夹复制到 OpenClaw workspace 的 `skills/` 目录下：

```bash
# 克隆整个仓库
git clone https://github.com/amber-ai-sketch/my-claw-skills.git

# 或单独克隆本 skill
git clone https://github.com/amber-ai-sketch/my-claw-skills.git --sparse skills/xiaomi-xiaoai-daily
```

## 使用方式

### 1. 搜索用户反馈

使用 Tavily 搜索工具：

```bash
# 搜索正面评价
tavily-search "小爱同学 好评 体验" --topic general -n 10

# 搜索负面评价
tavily-search "小爱同学 吐槽 差评" --topic general -n 10

# 搜索功能动态
tavily-search "小爱同学 新功能 更新" --topic general -n 10
```

### 2. 分类整理

- ✅ **正面反馈**：音质、AI能力、实用功能
- ⚠️ **负面反馈**：唤醒问题、响应卡顿、体验问题
- 📢 **功能动态**：新功能、更新、升级

### 3. 定时任务（可选）

```bash
openclaw cron add --name "小爱同学日报" \
  --schedule "0 9 * * *" \
  --payload '{"kind":"agentTurn","message":"生成今日小爱同学用户反馈日报"}' \
  --sessionTarget isolated
```

## 依赖

- OpenClaw
- Tavily Search Skill
- 飞书（可选）

---

**维护者**： amber-ai-sketch  
**项目主页**： https://github.com/amber-ai-sketch/my-claw-skills
