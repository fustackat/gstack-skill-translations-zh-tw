---
name: investigate
preamble-tier: 2
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /investigate 時執行。
  系統性的除錯與根因調查。四個階段：調查（investigate）、分析（analyze）、假設（hypothesize）、實作（implement）。原則：未找出根因前不做修正（Iron Law: no fixes without root cause investigation）。用於「debug this」、「fix this bug」、「why is this broken」等。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - AskUserQuestion
  - WebSearch
hooks:
  PreToolUse:
    - matcher: "Edit"
      hooks:
        - type: command
          command: "bash ${CLAUDE_SKILL_DIR}/../freeze/bin/check-freeze.sh"
          statusMessage: "Checking debug scope boundary..."
    - matcher: "Write"
      hooks:
        - type: command
          command: "bash ${CLAUDE_SKILL_DIR}/../freeze/bin/check-freeze.sh"
          statusMessage: "Checking debug scope boundary..."
---

# investigate（繁體中文說明）

用途摘要：
- 系統性根因分析（RCA）：四階段流程保證在修正前先確認根因，以避免只修表面症狀。

流程要點：
1. Phase 1 — Root Cause Investigation：收集症狀、閱讀錯誤訊息與 stack trace、檢查近期變更、嘗試重現問題
2. Scope Lock（範圍鎖定）：在可用時以 freeze 機制鎖定受影響模組，避免 scope creep
3. Phase 2 — Pattern Analysis：比對已知錯誤模式（race condition、nil propagation、state corruption、integration failure、config drift 等），如有必要使用 WebSearch（注意隱私）
4. Phase 3 — Hypothesis Testing：以可驗證的方式加入暫時日誌或 assertion 測試假設；3 次失敗則停止並提報
5. Phase 4 — Implementation：在確認根因後做最小修改、寫回歸測試、執行完整測試套件
6. Phase 5 — Verification & Report：重現確認，產出結構化的 DEBUG REPORT（包含症狀、根因、修正、證據與測試）

重要規則：
- 未驗證前不要修復；修復後必須能證明問題消失且沒有回歸
- 若嘗試 3 次假設仍無結果，應升級為人力審查或更高層級調查

原始腳本與範例指令請見 investigate/SKILL.md（英文原檔）。
