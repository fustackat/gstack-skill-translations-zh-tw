---
name: setup-browser-cookies
preamble-tier: 1
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /setup-browser-cookies 時執行。
  將本機 Chromium 瀏覽器的 cookies 匯入到無頭瀏覽器的 session，使 QA 能夠測試需要登入的頁面。提供互動式選取器以選擇要匯入的 domain。
allowed-tools:
  - Bash
  - Read
  - AskUserQuestion
---

# setup-browser-cookies（繁體中文說明）

用途摘要：
- 在進行登入相關的 QA 時使用。可開啟互動式 picker（或直接指定 domain）以將瀏覽器 cookies 匯入 Playwright 的無頭 session。

步驟概覽：
1. 偵測 browse binary
2. 開啟 cookie picker（互動式 UI）或使用直接匯入參數
3. 使用者在瀏覽器中選取要匯入的 domains
4. 匯入並驗證（$B cookies）

重要注意事項：
- 不會在 UI 中顯示 cookie 值（僅 domain 與數量）
- macOS 首次匯入可能會觸發 Keychain 權限提示
- 匯入後的 cookies 會即時在後續 browse 指令中生效

原始詳細範例請見 setup-browser-cookies/SKILL.md（英文）。
