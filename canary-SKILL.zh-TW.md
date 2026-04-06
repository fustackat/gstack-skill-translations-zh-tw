---
name: canary
preamble-tier: 2
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /canary 時執行。
  部署後的 canary 監控：在部署後監視生產站，檢查控制台錯誤、效能退化、頁面故障，並與部署前的 baseline 比較。會擷取截圖、收集 console 與 perf，並在異常時發出警報。適用於「monitor deploy」、「watch production」等情境。
allowed-tools:
  - Bash
  - Read
  - Write
  - Glob
  - AskUserQuestion
---

# canary（繁體中文說明）

用途摘要：
- Canary 用以在部署後短時間內（預設 10 分鐘）監控生產健康，透過截圖、console error、load time 及其他指標比對 baseline 來偵測回歸。

主要階段：
1. Baseline Capture（可選）：在部署前擷取樣本作為參考
2. Page Discovery：自動或由使用者指定要監控的頁面
3. Continuous Monitoring Loop：每隔固定時間檢查頁面並擷取證據
4. Alerting：在偵測到持續性異常時（2 次以上）發出 CANARY ALERT，並提供證據與建議選項（Investigate / Continue / Rollback / Dismiss）
5. Health Report：監控結束後產出總結報告並儲存到 `.gstack/canary-reports`

重要規則：
- 以變化為警報依據（compare vs baseline），而非絕對閾值
- 只有持續出現的問題才會觸發告警以避免誤報
- 只做觀察與通報（read-only），不會自動變更生產環境

原始詳細流程與範例保留於 canary/SKILL.md（英文）。
