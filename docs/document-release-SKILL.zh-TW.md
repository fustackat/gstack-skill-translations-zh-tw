---
name: document-release
preamble-tier: 2
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /document-release 時執行。
  Post-ship 文件同步：在 /ship 之後但合併前執行，檢查並更新 README、ARCHITECTURE、CONTRIBUTING、CLAUDE.md 與 CHANGELOG 的措辭，修正跨文件不一致，整理 TODOS。適合在合併或發布前同步文件聲明與使用說明。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - AskUserQuestion
---

# document-release（繁體中文說明）

用途摘要：
- 在代碼上線流程後自動或半自動地把文件更新為與已部署代碼相符，確保 README、ARCHITECTURE 與 CHANGELOG 與實際行為一致。會做小幅措辭潤飾，但不會重寫大段內容或改變原意。

主要步驟：
1. 取得 diff 與 context（git diff / git log）
2. 檢查所有相關文件（README、ARCHITECTURE、CONTRIBUTING、CLAUDE.md、CHANGELOG）
3. 直接套用明確的事實性更正（路徑、參數、版本號），對敘事性或風格性改動則草擬建議並 AskUserQuestion
4. 產出文件變更摘要（檔案、變更說明、為何要改）
5. 若需要 VERSION bump，則 AskUserQuestion 決定

重要規則：
- 不會覆寫或刪除 CHANGELOG 條目；只允許措辭修改
- 有風險或主觀的改動先停止並詢問使用者

原始範例與細節請參見 document-release/SKILL.md（英文）。
