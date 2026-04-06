---
name: qa
preamble-tier: 4
version: 2.0.0
description: |
  手動觸發：僅在使用者輸入 /qa 時執行。
  系統化的 QA 測試並修正流程：執行測試、尋找 bug、逐一修正（每次修正以原子 commit 提交）並重新驗證。提供 before/after 健康分數、修正證據與上線準備報告。若只需要報告，請使用 /qa-only。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
  - WebSearch
---

# qa（繁體中文說明）

用途摘要：
- QA 會像真實使用者一樣操作網站（點擊、填表、瀏覽路徑），發現高/中/低嚴重度的問題；對於可自動修復的問題會直接修正並提交，然後重新驗證。

測試分級：
- Quick：僅修復 critical/high
- Standard（預設）：包含 medium
- Exhaustive：包含 cosmetic

輸出：修正紀錄、截圖、重現步驟、健康分數與 ship-ready 判定

重要規則：
- 任何會改變生產的操作需先獲得授權
- 如果環境需要登入，可搭配 setup-browser-cookies 導入 cookie

原始範例與指令保留於 qa/SKILL.md（英文）。
