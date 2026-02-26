---
name: pm-daily-briefing
description: 生成PM每日AI情报内参日报。使用Tavily搜索工具获取最新AI新闻，重点关注国内外AI大厂动态、新模型进展、AI Agent产品等。生成结构化日报包含事实摘要和PM洞察，支持发送飞书消息或保存到文档。使用场景：(1) 每天早上自动生成AI情报日报，(2) 针对特定AI话题进行深度调研，(3) 追踪国内外AI大厂最新动态。
---

# PM每日内参 Skill

## 核心功能

1. **AI新闻搜索**：使用Tavily工具搜索最新AI新闻
2. **内容结构化**：按分类整理新闻（国内大厂、国际大厂、Agent产品、新模型等）
3. **PM洞察生成**：为每条新闻添加产品经理视角的洞察
4. **多渠道输出**：支持飞书消息、文档保存等

## 使用流程

### 标准日报生成流程

1. **搜索阶段**
   ```bash
   node /root/.openclaw/workspace/skills/tavily-search/scripts/search.mjs "搜索关键词" --topic news -n 10 --days 1
   ```
   
   > ⚡ **注意**：使用 `--days 1` 只获取24小时内的新闻，确保日报时效性
   
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

## 脚本使用

### 快速搜索脚本

```bash
# 搜索单个主题
./scripts/search_ai_news.sh "OpenAI 最新 新闻"

# 批量搜索多个主题
./scripts/batch_search.sh

# 生成日报（执行完整流程）
./scripts/generate_daily_briefing.sh --output feishu --target <user_id>
```

## 参考文档

- Tavily搜索工具指南：`references/tavily_usage.md`
- 飞书消息发送指南：`references/feishu_messaging.md`
- AI新闻分类标准：`references/news_categories.md`
- PM洞察写作指南：`references/pm_insights_guide.md`

## 最佳实践

1. **搜索策略**
   - 优先使用英文关键词获取更准确的结果
   - 结合公司名+产品名+时间范围进行精准搜索
   - 关注官方发布渠道（公司博客、Twitter/X、产品更新日志）

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

## 故障排查

### 搜索失败
- 检查Tavily API是否可用
- 尝试更换搜索关键词
- 查看网络连接状态

### 格式错误
- 检查Markdown语法
- 确认分类标签使用正确
- 验证时间格式统一

### 发送失败
- 确认飞书用户/群聊ID正确
- 检查飞书API权限
- 查看消息内容是否超出长度限制