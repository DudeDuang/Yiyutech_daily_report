#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# 提交并推送日报
# 用法：
#   ./push-day.sh                 # 默认提交说明：日报: 2026-08-12
#   ./push-day.sh "批量生成脚本跑通"  # 自定义项目相关的说明
set -e
cd "$(dirname "$0")"

MSG="${1:-日报: $(date +%Y-%m-%d)}"

git add .

if git commit -m "$MSG"; then
  echo "已提交"
else
  echo "没有需要提交的更改"
fi

echo "正在推送到 GitHub ..."
git push
echo "推送完成"
