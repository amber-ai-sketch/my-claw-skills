#!/bin/bash

# PM每日内参 - 批量AI新闻搜索脚本
# 自动搜索多个AI相关主题

echo "🔥 PM每日内参 - 批量AI新闻搜索"
echo "============================================"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEARCH_SCRIPT="$SCRIPT_DIR/search_ai_news.sh"

# 定义搜索主题
SEARCH_TOPICS=(
    "OpenAI 最新 新闻 2026"
    "Anthropic Claude 最新 发布"
    "Google AI Gemini 最新 动态"
    "阿里巴巴 Qwen AI 模型 最新"
    "字节跳动 AI 产品 最新"
    "AI Agent 产品 最新 发布"
    "中国 AI 大模型 最新 进展"
)

# 执行批量搜索
for topic in "${SEARCH_TOPICS[@]}"; do
    echo ""
    echo "============================================"
    bash "$SEARCH_SCRIPT" "$topic"
    echo "============================================"
    
    # 添加短暂延迟避免API限制
    sleep 2
done

echo ""
echo "============================================"
echo "✅ 批量搜索完成！共搜索 ${#SEARCH_TOPICS[@]} 个主题"
echo "============================================"