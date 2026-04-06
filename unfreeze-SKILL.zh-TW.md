---
name: unfreeze
version: 0.1.0
description: |
  手動觸發：僅在使用者輸入 /unfreeze 時執行。
  解除先前 /freeze 設定的目錄編輯限制，還原 Edit/Write 權限到原有狀態。
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# unfreeze（繁體中文說明）

用途摘要：
- 解除 freeze 設定，恢復一般編輯權限。用於結束受限修改階段。

使用流程：
1. 執行 /unfreeze，系統確認並刪除 freeze 狀態檔。
2. 回報已解除的目錄路徑。

重要注意事項：
- 解除後仍建議檢查工作樹狀態以避免不小心提交未審核的更動。

原始詳情請見 unfreeze/SKILL.md（英文）。
