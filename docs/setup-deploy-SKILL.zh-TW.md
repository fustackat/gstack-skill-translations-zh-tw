---
name: setup-deploy
preamble-tier: 2
version: 1.0.0
description: |
  手動觸發：僅在使用者輸入 /setup-deploy 時執行。
  為 /land-and-deploy 設定部署相關資訊。會偵測部署平台（Fly.io、Render、Vercel、Netlify、Heroku、GitHub Actions 或自訂），找出 production URL、健康檢查端點與部署狀態指令，並把設定寫入 CLAUDE.md，讓後續自動化部署流程能直接讀取。
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
---

# setup-deploy（繁體中文說明）

用途摘要：
- 偵測與設定專案的部署資訊，將結果儲存在 CLAUDE.md 的 `## Deploy Configuration` 區段，讓 /land-and-deploy 可以跳過偵測直接使用。

主要步驟：
1. 檢查是否已有部署設定（若存在，提供覆寫 / 編輯 選項）
2. 自動偵測平台（檔案如 fly.toml、render.yaml、vercel.json、netlify.toml、Procfile 等）
3. 平台專屬設定流程（例如從 fly.toml 擷取 app 名稱並推斷 URL）
4. 若偵測不到平台：以 AskUserQuestion 詢問部署觸發方式、production URL、健康檢查方法
5. 將偵測/輸入結果寫入 CLAUDE.md（`## Deploy Configuration`），並驗證（如可達性檢查或狀態命令）

重要規則：
- 絕不輸出或暴露 secrets（API keys、tokens 等）
- 在寫入前先向使用者確認偵測到的設定
- 設定是幂等（多次執行會覆寫舊設定而不破壞環境）

原始指令範例保留於 setup-deploy/SKILL.md（英文），本檔為繁體說明與摘要。
