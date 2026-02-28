---
name: pm-daily-briefing
description: 生成PM每日AI情报内参日报。使用Tavily搜索工具获取最新AI新闻，重点关注国内外AI大厂动态、新模型进展、AI Agent产品等。生成结构化日报包含事实摘要和PM洞察，支持发送飞书消息或保存到文档。使用场景：(1) 每天早上自动生成AI情报日报，(2) 针对特定AI话题进行深度调研，(3) 追踪国内外AI大厂最新动态。
---

# PM每日内参 Skill

> 📌 安装方式：克隆仓库后，将此文件夹复制到 OpenClaw workspace 的 `skills/` 目录下

## 核心功能

1. **AI新闻搜索**：使用Tavily工具搜索最新AI新闻
2. **内容结构化**：按分类整理新闻（国内大厂、国际大厂、Agent产品、新模型等）
3. **PM洞察生成**：为每条新闻添加产品经理视角的洞察
4. **多渠道输出**：支持飞书消息、文档保存等

## 使用流程

### 标准日报生成流程

1. **搜索阶段**
   
   使用 Tavily 搜索工具（或内置脚本）搜索新闻：
   ```bash
   # 搜索 OpenAI 最新新闻
   tavily-search "OpenAI 最新 新闻" --topic news -n 10 --days 1
   
   # 搜索 Claude 最新动态
   tavily-search "Anthropic Claude 最新" --topic news -n 10 --days 1
   
   # 搜索 AI Agent 产品
   tavily-search "AI Agent 产品 最新" --topic news -n 10 --days 1
   ```
   
   推荐搜索主题：
   - "OpenAI 最新 新闻"
   - "Anthropic Claude 最新"
   - "Google AI 最新 新闻"
   - "阿里巴巴 Qwen AI 模型 最新"
   - "字节跳动 AI 产品 最新"
   - "AI Agent 产品 最新"

2. **内容整理**
   - 按分类整理新闻
   - 为每条新闻编写事实摘要
   - 添加PM洞察（💡 emoji标记）

3. **格式输出**
   
   日报标准格式：
   ```markdown
   📅 **PM每日内参 | YYYY年MM月DD日**
   ---
   
   ### 📊 国内AI大厂动态
   - **【公司名】** 新闻标题
     - **事实**：具体新闻内容描述
     - **PM洞察**：💡 产品经理视角的分析
   
   ### 🌍 国际AI大厂动态
   ...
   
   ### 🤖 AI Agent产品动态
   ...
   
   ### ⚡ 新模型进展
   ...
   
   ---
   
   **📌 今日观察**：用1-2句话总结今日AI行业趋势。
   
   ---
   🔥 **小火龙整理完毕！**
   
   📌 *信息来源：xxx | 更新时间：YYYY-MM-DD HH:MM*
   ```

4. **发送/保存**
   - 飞书私信：`message send --channel feishu --target <user_id>`
   - 飞书群聊：`message send --channel feishu --target <chat_id>`
   - 保存文档：`feishu_doc write --action create` 或 `feishu_wiki create`

## 定时任务（可选）

设置每日自动生成日报：

```bash
openclaw cron add --name "PM每日内参" \
  --schedule "0 8 * * *" \
  --payload '{"kind":"agentTurn","message":"生成今日PM每日AI情报内参日报"}' \
  --sessionTarget isolated \
  --delivery '{"mode":"announce","channel":"feishu"}'
```

## 最佳实践

1. **搜索策略**
   - 优先使用英文关键词获取更准确的结果
   - 结合公司名+产品名+时间范围进行精准搜索
   - 关注官方发布渠道（公司博客、Twitter/X、产品更新日志）
   - 使用 `--days 1` 获取24小时内的新闻

2. **内容筛选**
   - 优先选择权威来源（官方发布、知名科技媒体）
   - 区分事实报道和观点评论
   - 关注对用户/产品有实际影响的新闻

3. **PM洞察写作**
   - 从产品经理视角分析新闻影响
   - 关注产品策略、市场定位、用户体验等方面
   - 提供可操作的建议或启示
   - 使用💡 emoji标记洞察部分

4. **格式一致性**
   - 统一使用日报标准格式
   - 保持分类结构清晰
   - 确保时间、来源等信息完整准确

## 依赖

- **Tavily Search Skill** - 用于搜索AI新闻
- **飞书** - 用于发送日报（可选）
