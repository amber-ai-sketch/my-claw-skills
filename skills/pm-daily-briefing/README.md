# PM每日内参 Skill

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-green.svg)](https://openclaw.ai)

> 生成PM每日AI情报内参日报的OpenClaw Skill

## 功能特性

- 🔍 **AI新闻搜索** - 使用Tavily搜索工具获取最新AI新闻
- 📊 **内容结构化** - 按分类整理（国内大厂、国际大厂、Agent产品、新模型等）
- 💡 **PM洞察生成** - 为每条新闻添加产品经理视角的洞察
- 📤 **多渠道输出** - 支持飞书消息、文档保存等

## 安装

### 方式一：通过 Skill 文件安装

1. 下载 `pm-daily-briefing.skill` 文件
2. 在 OpenClaw 中导入：
   ```bash
   openclaw skill install pm-daily-briefing.skill
   ```

### 方式二：手动安装

1. 将本仓库克隆到 OpenClaw workspace：
   ```bash
   cd ~/.openclaw/workspace/skills
   git clone https://github.com/yourusername/pm-daily-briefing.git
   ```

2. 安装依赖（如需要）

## 使用方式

### 标准日报生成流程

#### 1. 搜索阶段

使用 Tavily 搜索工具获取最新AI新闻：

```bash
# 搜索国际AI大厂动态
node /root/.openclaw/workspace/skills/tavily-search/scripts/search.mjs "OpenAI 最新 新闻" --topic news -n 10

# 搜索国内AI大厂动态
node /root/.openclaw/workspace/skills/tavily-search/scripts/search.mjs "阿里巴巴 Qwen AI 模型 最新" --topic news -n 10

# 搜索AI Agent产品
node /root/.openclaw/workspace/skills/tavily-search/scripts/search.mjs "AI Agent 产品 最新" --topic news -n 10
```

**推荐搜索主题清单：**

| 分类 | 搜索关键词 |
|------|-----------|
| 国际大厂 | OpenAI 最新 新闻 |
| 国际大厂 | Anthropic Claude 最新 |
| 国际大厂 | Google AI 最新 新闻 |
| 国际大厂 | Meta AI 最新 新闻 |
| 国内大厂 | 阿里巴巴 Qwen AI 模型 最新 |
| 国内大厂 | 字节跳动 AI 产品 最新 |
| 国内大厂 | 百度 AI 模型 最新 |
| Agent产品 | AI Agent 产品 最新 |
| Agent产品 | ChatGPT Plugin 最新 |
| 新模型 | 大语言模型 最新 发布 |

#### 2. 内容整理

按以下分类整理新闻：

- 📊 **国内AI大厂动态**（阿里、字节、百度等）
- 🌍 **国际AI大厂动态**（OpenAI、Anthropic、Google等）
- 🤖 **AI Agent产品动态**
- ⚡ **新模型进展**

每条新闻包含：
- **事实**：具体新闻内容描述
- **PM洞察**：💡 产品经理视角的分析

#### 3. 格式输出

日报标准格式：

```markdown
📅 **PM每日内参 | 2026年02月24日**
---

### 📊 国内AI大厂动态
- **【阿里巴巴】** Qwen 3.5模型发布
  - **事实**：Qwen 3.5在多模态能力上显著提升，支持更长的上下文窗口
  - **PM洞察**：💡 阿里正在加速追赶GPT-4，建议关注其Agent生态建设

### 🌍 国际AI大厂动态
- **【OpenAI】** GPT-5研发进展曝光
  - **事实**：据内部消息，GPT-5在推理能力上有重大突破
  - **PM洞察**：💡 多模态+推理能力将是下一代模型的核心竞争力

### 🤖 AI Agent产品动态
...

### ⚡ 新模型进展
...

---
**今日核心洞察**：AI行业正从"模型竞赛"进入"Agent生态"新阶段
```

#### 4. 发送/保存

**发送到飞书：**
```bash
# 使用 message 工具发送到指定群聊
openclaw message send --chat <chat_id> --content "日报内容"
```

**保存到文档：**
```bash
# 保存到飞书文档或本地文件
```

### 批量搜索脚本

本项目提供批量搜索脚本，可一次性搜索多个主题：

```bash
# 运行批量搜索
bash /root/.openclaw/workspace/skills/pm-daily-briefing/scripts/batch_search.sh
```

脚本会自动搜索预设主题，并将结果保存到指定目录。

## 目录结构

```
pm-daily-briefing/
├── README.md              # 本文件
├── SKILL.md               # OpenClaw Skill 定义文件
├── scripts/               # 辅助脚本
│   ├── search_ai_news.sh  # AI新闻搜索脚本
│   └── batch_search.sh    # 批量搜索脚本
└── references/            # 参考资料
```

## 依赖项

- OpenClaw >= 0.1.0
- Tavily Search Skill（用于新闻搜索）
- Feishu Connector（用于消息发送，可选）

## 配置

如需自定义配置，可创建 `.env` 文件：

```bash
# 搜索配置
SEARCH_DEFAULT_TOPICS="OpenAI,Anthropic,Google,阿里巴巴"
SEARCH_RESULT_LIMIT=10

# 飞书配置（如需自动发送）
FEISHU_DEFAULT_CHAT_ID=your_chat_id
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

---

**作者**：您的名字  
**维护者**：OpenClaw Community  
**项目主页**：https://github.com/yourusername/pm-daily-briefing
