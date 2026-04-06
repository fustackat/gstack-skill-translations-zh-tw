---
name: ship
preamble-tier: 4
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /ship 時執行。
  完整發佈流程（Ship workflow）：偵測 base branch、執行測試、審查 diff、更新 VERSION 與 CHANGELOG、建立 PR 並嘗試合併。此流程預設非互動式（若遇重大選擇或無法自動處理的情況會停止並提示使用者）。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - Agent
  - AskUserQuestion
  - WebSearch
---

# ship（繁體中文說明）

用途摘要：
- /ship 是一個高度自動化的發佈工作流，目標是把開發分支的變更打包、測試、生成必要的發佈文件（CHANGELOG、VERSION），並建立 PR 或直接合併（視專案規則）。
- 只有在使用者明確輸入 `/ship` 時才執行；遇到需要人類判斷的情況（例如 major/minor bump、複雜的合併衝突），會暫停並 AskUserQuestion。

主要步驟（摘要）：
1. 檢測 base branch（決定目標分支）
2. 收集 diff 與 context（git diff / git log）
3. 運行測試套件（bun test / CI 指令）並收集結果
4. 自動產生 CHANGELOG 條目並更新 VERSION（依政策可自動或詢問）
5. 建立 PR（gh pr create）或嘗試 auto-merge
6. 若合併成功：回報 PR/merge URL 並結束；若失敗則產出阻斷報告

重要規則（安全）：
- 絕不在沒有測試或明顯失敗情況下自動合併
- 對於可能造成重大破壞的決定（major bump / 回滾）必須向使用者確認
- 嚴禁強制推送（no force push）與跳過 CI

注意：本技能含高風險操作（合併、版本發佈）。本檔為翻譯摘要，所有原始命令範例保留於 ship/SKILL.md（英文）。
