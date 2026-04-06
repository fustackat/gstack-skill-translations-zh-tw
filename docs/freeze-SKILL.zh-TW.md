---
name: freeze
version: 0.1.0
description: |
  手動觸發：僅在使用者輸入 /freeze 時執行。
  將檔案編輯權限限制在指定目錄內，阻止 Edit/Write 在該範圍外的修改。適用於偵錯或想在單一模組內做改動時，避免誤改其他程式碼。
allowed-tools:
  - Bash
  - Read
  - AskUserQuestion
---

# freeze（繁體中文說明）

用途摘要：
- 將所有 Edit/Write 操作限制到指定目錄。任何嘗試編輯範圍外檔案的操作會被阻擋（deny）。

如何使用：
1. 執行 `/freeze`，以 AskUserQuestion 讓使用者輸入要鎖定的目錄路徑
2. 系統會解析為絕對路徑，寫入狀態檔（例如 `~/.gstack/freeze-dir.txt`）以保留 session
3. 要解除限制，執行 `/unfreeze` 或結束 session

重要注意事項：
- Freeze 只影響 Edit/Write 工具；Bash 等其他工具仍能直接修改檔案（非安全隔離）
- 使用時請確認路徑正確且含尾斜線以避免模糊匹配

原始細節與腳本保留於 freeze/SKILL.md（英文）。
