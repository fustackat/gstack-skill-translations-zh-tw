---
name: review
preamble-tier: 4
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /review 時執行。
  上線前的 PR 審查流程。分析與 base branch 的 diff，檢查 SQL 安全性、LLM 信任邊界、副作用、測試缺口等結構性問題。當使用者要求「review this PR」或要合併時建議執行。
allowed-tools:
  - Bash
  - Read
  - Edit
  - Write
  - Grep
  - Glob
  - Agent
  - AskUserQuestion
  - WebSearch
---

# review（繁體中文說明）

用途摘要：
- 針對 feature branch 與 base branch 的差異做兩階段審查（Pass 1: 關鍵項目；Pass 2: 資訊性項目）
- 自動化檢查項目包括：SQL 與資料安全、race condition、LLM 信任邊界、enum 值完整性等
- 採用 Fix-First 原則：對可自動修復（AUTO-FIX）的項目直接修正並提交；對需判斷（ASK）的項目一次性詢問使用者

審查要點：
1. 檢查當前分支與 base branch 的 diff（若無 diff 則停止）
2. Scope Drift 偵測：確認變更是否偏離原始意圖或引入 scope creep
3. 讀取 checklist 與設計檢查表（若存在）後進行兩階段審查
4. 測試覆蓋審查（Step 4.75 / Test Coverage Diagram）：逐路徑檢查測試缺口，分類為 AUTO-FIX 或 ASK
5. 對 AUTO-FIX 類型自動應用修正並提交；對 ASK 類型匯總並以單一 AskUserQuestion 呈現給使用者

輸出格式：簡潔明確 — 每個 issue 一行問題、一行修正建議；必要時附 ASCII 覆蓋圖與測試計畫

詳細程序與例外處理請參考原始英文檔 review/SKILL.md（本檔為繁體說明摘要）。
