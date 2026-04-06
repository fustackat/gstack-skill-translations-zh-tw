---
name: cso
preamble-tier: 2
version: 2.0.0
description: |
  手動觸發：僅在使用者輸入 /cso 時執行。
  Chief Security Officer 模式：以基礎設施為先的安全稽核，檢查 secrets、依賴供應鏈、CI/CD 安全、LLM/AI 風險、OWASP 與 STRIDE 等。支援快速每日掃描與月度深度掃描。
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Agent
  - WebSearch
  - AskUserQuestion
---

# cso（繁體中文說明）

用途摘要：
- 產出 Security Posture Report：具體發現、嚴重度評分、與可執行的補救建議。優先檢查依賴與 CI/CD 配置，而非只看程式碼。

模式：
- Daily — 低噪音快速檢查（8/10 信心水準）
- Comprehensive — 深度掃描（更寬但噪音高，2/10 信心水準）

重要規則：
- 不直接修改程式碼（產出報告與修復建議）
- 使用 Grep 工具來做代碼檢索（避免直接複製 bash grep 到終端）
- 若包含 --diff，則只針對當前分支差異執行相應檢查

原始詳情與分階段流程請見 cso/SKILL.md（英文）。
