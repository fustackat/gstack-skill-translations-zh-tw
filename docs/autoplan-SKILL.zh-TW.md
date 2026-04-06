---
name: autoplan
preamble-tier: 3
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /autoplan 時執行。
  自動審查管線：依序執行 CEO、Design、Eng 三階段的完整審查流程，並依六項決策原則自動做出中間判斷。將有味道的決策（taste decisions）收斂到最終核准門檻供使用者決定。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - WebSearch
  - AskUserQuestion
---

# autoplan（繁體中文說明）

用途摘要：
- 一鍵啟動完整的自動化審查（CEO → Design → Eng），中間的 AskUserQuestion 由自動決策原則代為回覆，僅把「味道型」的判斷在最後呈給使用者。

六項決策原則（摘要）：
1. 優先完整性（Choose completeness）
2. 范圍擴張時優先在 blast radius 內處理（Boil lakes）
3. 講求務實（Pragmatic）— 取較簡潔的方案
4. 重用既有（DRY）
5. 明確優於巧妙（Explicit over clever）
6. 偏向採取行動（Bias toward action）

執行要點：
- 嚴格順序：CEO → Design（若偵測到 UI scope）→ Eng
- 每個階段仍保留完整分析、讀取原始 skill 檔及代碼、產出要求的工件（ASCII 圖、試驗計畫、決策稽核紀錄等）
- 產出審查結果與決策稽核（Decision Audit Trail）寫入 plan file

此技能在自動化審查、產出測試計畫與生成決策日志方面特別有用；原始詳細流程請見 autoplan/SKILL.md（英文）。
