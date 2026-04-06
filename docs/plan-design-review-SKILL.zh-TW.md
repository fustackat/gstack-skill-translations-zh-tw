---
name: plan-design-review
preamble-tier: 3
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /plan-design-review 時執行。
  設計層面的計畫審查：評估設計系統、視覺一致性、可用性測試計畫與實作風險，提供建議與執行步驟。
allowed-tools:
  - Read
  - Write
  - AskUserQuestion
  - Glob
  - Grep
---

# plan-design-review（繁體中文說明）

用途摘要：
- 在設計與開發交接前檢視設計可行性、切割範圍、測試計畫與優先順序，產出明確可執行的設計實作方案。

重點：
- 檢查 design-system、元件庫與文件（如果存在）
- 提供分階段交付、驗收準則與可回滾策略

原始詳情請見 plan-design-review/SKILL.md（英文）。
