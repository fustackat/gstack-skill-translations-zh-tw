---
name: land-and-deploy
preamble-tier: 4
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /land-and-deploy 時執行。
  合併並部署工作流程：合併 PR、等待 CI 與部署，並透過 canary 檢查驗證生產環境健康。當 /ship 已建立 PR 時接手。使用情境例如「merge」、「land」、「deploy」、「merge and verify」。
allowed-tools:
  - Bash
  - Read
  - Write
  - Glob
  - AskUserQuestion
---

# land-and-deploy（繁體中文說明）

用途摘要：
- 本技能扮演 Release Engineer 的角色：在 `/ship` 建立 PR 後負責把 PR 上線（merge）並驗證部署是否健康。
- 流程重點：
  1. 事前檢查（GH CLI 認證、PR 狀態、CI 狀態、衝突檢查）
  2. 等待並監控 CI（含超時與重試策略）
  3. 合併前的「準備就緒門檻」（pre-merge readiness gate）：生成準備報告並要求使用者確認
  4. 合併（優先 auto-merge，否則以 repo 規則合併）
  5. 偵測部署策略（GitHub Actions / Fly / Render / Vercel / Netlify / Heroku / 自訂），並等待部署完成
  6. Canary 驗證（根據變更範圍選擇驗證深度，檢查頁面載入、控制台錯誤、效能、截圖證據）
  7. 必要時回滾（revert commit 或建立 revert PR）
  8. 產出部署報告並記錄

重要規則：
- 永不跳過 CI；若 CI 失敗或發現 blocker，應停止並回報
- 合併前的準備就緒門檻是唯一會向使用者請求明確確認的步驟
- 永遠不要強制推送（no force push）

程式碼範例與完整步驟保留於原始檔案 land-and-deploy/SKILL.md（英文）。
