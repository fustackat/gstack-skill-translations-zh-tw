---
name: codex
preamble-tier: 3
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /codex 時執行。
  OpenAI Codex 的 CLI 包裝器 — 提供三種模式：code review（獨立 diff 審查）、challenge（對程式發起攻擊式測試以找弱點）、consult（會話式詢問以獲得第二意見）。適合需要不同 AI 視角的情況。
allowed-tools:
  - Bash
  - Read
  - Write
  - Glob
  - Grep
  - AskUserQuestion
---

# codex（繁體中文說明）

用途摘要：
- 提供來自 Codex 的獨立第二意見：結構化、直接且技術導向。用於 code review、對抗式測試、或作為快速問答顧問。

模式：
- Review：針對 diff 做通過/不通過判定
- Challenge：模擬 adversarial 輸入或邊緣情境以找漏洞
- Consult：會話式提問與後續追問

注意事項：
- 若本地沒有 codex CLI，會提示安裝指引
- 輸出請以原文呈現（不要過度摘要）以保留技術細節

原始範例請見 codex/SKILL.md（英文）。
