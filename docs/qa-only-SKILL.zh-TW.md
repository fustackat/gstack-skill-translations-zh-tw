---
name: qa-only
preamble-tier: 4
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /qa-only 時執行。
  僅產出報告的 QA：系統性測試網站並生成健康分數、截圖與重現步驟，但不會進行任何修正。用於需要獨立證據或不允許修改代碼的情境。
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
  - WebSearch
---

# qa-only（繁體中文說明）

用途摘要：
- 與 /qa 類似，但僅收集與報告，不會修復任何問題。輸出結構化報告，適合審核或合規需求。

主要輸出：健康分數、逐頁截圖、控制台錯誤統計、重現步驟、建議優先順序

重要規則：
- 報告中應明確標示是否包含敏感訊息（例如 cookies、API keys）

原始詳情請見 qa-only/SKILL.md（英文）。
