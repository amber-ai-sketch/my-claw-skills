#!/bin/bash

# PM每日内参 - AI新闻搜索脚本
# 使用方法: ./search_ai_news.sh "搜索关键词"

if [ -z "$1" ]; then
    echo "❌ 错误：请提供搜索关键词"
    echo "用法: $0 \"OpenAI 最新 新闻\""
    exit 1
fi

SEARCH_QUERY="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TAVILY_SCRIPT="/root/.openclaw/workspace/skills/tavily-search/scripts/search.mjs"

echo "🔍 正在搜索: $SEARCH_QUERY"
echo "----------------------------------------"

if [ ! -f "$TAVILY_SCRIPT" ]; then
    echo "❌ 错误：Tavily搜索脚本不存在"
    exit 1
fi

# 执行搜索（只获取24小时内的新闻）
node "$TAVILY_SCRIPT" "$SEARCH_QUERY" --topic news -n 10 --days 1

echo "----------------------------------------"
echo "✅ 搜索完成"