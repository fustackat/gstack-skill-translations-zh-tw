---
name: design-review
preamble-tier: 4
version: 2.0.0
description: |
  手動觸發：僅在使用者輸入 /design-review 時執行。
  設計面向的 QA：檢查視覺不一致、間距、層級、互動延遲等，並在必要時直接修正前端程式碼（每次修正以原子 commit 提交）並驗證前後效果。適合想做視覺打磨或修正 AI 產生的 UI 問題。
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

# design-review（繁體中文說明）

用途摘要：
- 以設計師的視角審查 UI，並能在許可下直接小幅修正（例如 spacing、字體、顏色對比、按鈕樣式），每次修正為獨立 commit，並提供 before/after 截圖證據。

工作流程：
1. 解析參數（URL、Scope、Depth、Auth）
2. 檢查是否存在 DESIGN.md 或 design-system，若有則以其為基準
3. 若工作樹不乾淨，請求使用者先 commit 或 stash
4. 掃描頁面並產生設計修正（若可自動修正即 apply 並 commit）

重要規則：
- 每個修正需有對應截圖與描述
- 當需要操作未授權的環境或大幅重構時先詢問使用者

原始詳情請見 design-review/SKILL.md（英文）。
