#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# 创建今天的日报文件（基于模板，已存在则跳过）
# 目录结构：logs/月份/每日文件夹/每日文件夹.md
set -e
cd "$(dirname "$0")"

DATE=$(date +%Y-%m-%d)
YEAR_MONTH=$(date +%Y-%m)
DAY_FOLDER=$(date +%y_%-m_%-d)
DIR="logs/$YEAR_MONTH/$DAY_FOLDER"
FILE="$DIR/$DAY_FOLDER.md"

mkdir -p "$DIR"

if [ -f "$FILE" ]; then
  echo "已存在，跳过: $FILE"
else
  if [ -f "templates/daily-template.md" ]; then
    # 把模板标题里的日期替换成今天
    sed "s/^# .*实习日志/# $DATE 实习日志/" templates/daily-template.md > "$FILE"
  else
    printf '# %s 实习日志\n' "$DATE" > "$FILE"
  fi
  echo "已创建: $FILE"
fi
