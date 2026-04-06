---
name: retro
preamble-tier: 2
version: 2.0.0
description: |
  手動觸發：僅在使用者輸入 /retro 時執行。
  每週工程回顧（retrospective）：分析提交歷史、工作模式與程式碼品質指標，提供趨勢追蹤與按人員分類的回饋（稱讚與成長建議）。用於週報或 sprint 結束時的回顧。
allowed-tools:
  - Bash
  - Read
  - Write
  - Glob
  - AskUserQuestion
---

# retro（繁體中文說明）

用途摘要：
- 產出結構化回顧：以時間窗口（24h / 7d / 14d / 30d）分析提交量、PR 活動、測試變化、bug 數與趨勢。支援跨專案（global）比較。

重要點：
- 以本地時區呈現時間（midnight-aligned windows）
- 輸出包含 per-person 貢獻與可操作的建議
- 若使用 global 模式，會跨專案彙整（不需在 git repo 內）

原始細節請見 retro/SKILL.md（英文）。
