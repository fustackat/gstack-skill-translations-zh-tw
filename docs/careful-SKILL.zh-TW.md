---
name: careful
preamble-tier: 1
version: 0.1.0
description: |
  交互式安全護欄：在可能破壞性的操作前（rm -rf、force push、DROP TABLE）詢問使用者二次確認並提出替代方案。
allowed-tools:
  - AskUserQuestion
  - Read
  - Bash
---

# careful（繁體中文說明）

用途摘要：
- 在即將執行高風險命令前插入確認步驟與風險說明，並提供更安全的替代指令或回滾策略。

重要規則：
- 不會阻止操作，只作為提醒與二次確認
- 當自動化腳本需要無人值守執行時，應先停用此護欄

原始詳情請見 careful/SKILL.md（英文）。
