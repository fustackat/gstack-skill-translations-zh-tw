---
name: gstack-upgrade
preamble-tier: 2
version: 0.1.0
description: |
  手動觸發：僅在使用者輸入 /gstack-upgrade 時執行。
  升級 gstack 本體：抓最新變更、重置 skills、重建並重新部署到本地 skill 目錄（有明確步驟與回滾建議）。
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# gstack-upgrade（繁體中文說明）

用途摘要：
- 幫助把本地安裝的 gstack/skill 更新到 upstream 最新版本：fetch、reset、build（bun run build）與提示重啟或重新部署步驟。

風險與規則：
- 在自動執行前會要求使用者先 commit 或 stash
- 提供回滾指引與備份建議

原始詳情請見 gstack-upgrade/SKILL.md（英文）。
