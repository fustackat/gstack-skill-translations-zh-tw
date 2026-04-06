---
name: guard
preamble-tier: 1
version: 0.1.0
description: |
  綜合安全模式：同時啟用 careful（確認）與 freeze（鎖目錄）以在高風險操作期間提供更嚴格的保護。
allowed-tools:
  - Read
  - Write
  - AskUserQuestion
  - Bash
---

# guard（繁體中文說明）

用途摘要：
- 在敏感維運或大型重構期間同時啟用多重護欄：限制編輯範圍並對破壞性命令做二次確認，減少意外損害風險。

使用建議：
- 用於部署前、資料庫遷移或敏感分支操作

原始詳情請見 guard/SKILL.md（英文）。
