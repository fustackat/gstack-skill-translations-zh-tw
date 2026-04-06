---
name: benchmark
version: 1.0.0
description: |
  執行效能基準測試與回歸檢查的工具集合，支援比較不同分支或提交的指標。
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# benchmark（繁體中文說明）

用途摘要：
- 執行並收集各種效能指標（延遲、吞吐、記憶體、頁面載入），並生成對比報告以偵測回歸。

使用重點：
- 支援重複執行樣本、環境隔離與報告匯出
- 在 CI 中常與 perf harness 結合

原始詳情請見 benchmark/SKILL.md（英文）。
