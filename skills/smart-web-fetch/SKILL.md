# Smart Web Fetch Skill

智能网页抓取技能，自动处理简单和复杂页面。

## 技能简介

当需要获取网页内容时，使用本技能可以自动处理：
- 简单页面：直接用 web_fetch 快速获取
- 复杂页面（需要登录、内容动态加载等）：自动降级使用 Jina Reader

## 使用方法

### 触发指令示例

- "帮我抓取这个网页 XXX"
- "提取这个链接的内容 XXX"
- "获取网页 XXX 的要点"

### 执行流程

1. **第一步**：使用 `web_fetch` 工具尝试获取
2. **检查结果**：如果返回内容 < 2000 字符或包含 "Loading"、"Not Found"，视为失败
3. **自动降级**：使用 Jina Reader 作为备选方案

```bash
# 直接使用 web_fetch
web_fetch url="https://example.com"

# 如果失败，使用 Jina Reader
curl -s "https://r.jina.ai/https://example.com"
```

## 适用场景

- 小红书内容抓取（需要登录的页面）
- 知乎长文章提取
- 动态加载的页面
- 常规网页内容获取

## 降级逻辑

| 情况 | 处理方式 |
|------|----------|
| 返回 < 2000 字符 | 降级到 Jina Reader |
| 包含 "Loading" | 降级到 Jina Reader |
| 包含 "Not Found" | 降级到 Jina Reader |
| 正常内容 | 直接返回 |

## 注意事项

- Jina Reader 免费版有调用频率限制
- 如需更好性能，可配置 Jina API Key
- 部分页面可能需要额外处理（CSS选择器、等待元素等）

## 安装使用

```bash
# 克隆本技能
git clone https://github.com/amber-ai-sketch/my-claw-skills.git --depth 1 --branch main --sparse skills/smart-web-fetch

# 或克隆整个仓库
git clone https://github.com/amber-ai-sketch/my-claw-skills.git
```

## 相关技能

- Tavily Search：AI优化的网页搜索
- 小爱同学用户反馈日报：用户反馈收集

---
小火龙整理
