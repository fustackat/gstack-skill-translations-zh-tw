---
name: browse
preamble-tier: 1
version: 1.1.0
description: |
  手動觸發：僅在使用者輸入 /browse 時執行。
  快速的無頭瀏覽器（headless Chromium）用於 QA 測試與內部 dogfooding。可瀏覽任何 URL、與元素互動、驗證頁面狀態、比較動作前後差異、截取註解式截圖、檢查響應式佈局、測試表單與上傳、處理對話框，並斷言元素狀態。
  執行速度快（約 100ms/指令），適用於測試功能、驗證部署、內部流程驗證或製作含證據的 Bug 報告。
allowed-tools:
  - Bash
  - Read
  - AskUserQuestion
---

# browse（繁體中文說明）

說明：
- 使用時機：當需要在真實瀏覽器環境下檢查 UI 或重現前端問題、擷取可回報的截圖、比較 staging / prod 差異、或對使用者流程做快速驗證時使用。
- 重要：保留所有程式碼區塊與 CLI 範例的原文（英文），以免破壞可執行指令；本檔翻譯側重人類可讀說明與流程。

前置作業（先執行）：
- 本技能在呼叫前會執行環境檢查（更新提示、session 建立、REPO_MODE 偵測等），這些是自動化環境設定與遙測（telemetry）說明。

核心用途摘要：
- 驗證頁面載入與關鍵元素是否存在（text / console / network / is visible）
- 測試完整使用者流程（goto → fill → click → snapshot -D）
- 擷取視覺證據（snapshot -a / screenshot）以便附在 bug report 中
- 測試響應式佈局、檔案上傳、對話框處理與 element state 斷言

示例（程式碼區塊保持原文）:
```bash
# 以下為原始指令範例（保留英文原文以維持可執行性）
$B goto https://yourapp.com
$B text
$B console
$B is visible ".main-content"
```

更多細節請參考原始英文檔案：browse/SKILL.md（本檔為繁體中文註解與摘要，原始範例保留）
