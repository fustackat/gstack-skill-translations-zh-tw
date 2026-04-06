---
name: plan-eng-review
preamble-tier: 3
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /plan-eng-review 時執行。
  工程經理模式的計畫審查：鎖定執行計畫（架構、資料流、測試覆蓋、性能、邊界情況），提供具體且具意見性的建議，幫助在實作前修正設計缺陷。
benefits-from: [office-hours]
allowed-tools:
  - Read
  - Write
  - Grep
  - Glob
  - AskUserQuestion
  - Bash
  - WebSearch
---

# plan-eng-review（繁體中文說明）

用途摘要：
- 在開發前評估計畫是否可行：審查架構、資料流、邊界條件、測試計畫與測試覆蓋。提供 ASCII 圖、資料流程圖與明確的執行步驟。

工作重點：
- Step 0（必做）：檢測 base branch 與環境
- 產出測試圖與意見化建議（包括回滾策略、SLO/性能門檻、最小可行測試集）
- 優先順序：Step 0 > Test diagram > Opinionated recommendations > 其他

重要規則：
- 建議以最小侵入改動達成目標（minimal diff）
- 明文列出 tradeoffs 與可回滾策略

原始詳情請見 plan-eng-review/SKILL.md（英文）。
