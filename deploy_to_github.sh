#!/usr/bin/env bash
set -euo pipefail
# deploy_to_github.sh
# Usage:
#   export GITHUB_TOKEN=ghp_...   # PAT with repo scope
#   ./deploy_to_github.sh [--repo NAME] [--org ORG] [--private true|false]

REPO_NAME=${REPO_NAME:-gstack-skill-translations-zh-TW}
PRIVATE=${PRIVATE:-false}
GITHUB_ORG=${GITHUB_ORG:-}
BRANCH=${BRANCH:-main}
DOCS_PATH=${DOCS_PATH:-/docs}

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "Error: GITHUB_TOKEN not set. Export a PAT with 'repo' scope and run again."
  exit 1
fi

# Ensure inside a git repo
if [ ! -d .git ]; then
  git init
  git checkout -b "$BRANCH"
  git config user.name "Translator Bot"
  git config user.email "copilot@example.com"
fi

# Prepare docs folder for Pages
mkdir -p docs
cp -n *.SKILL.zh-TW.md docs/ || true
# Create index
cat > docs/index.md <<'INDEX'
# gstack SKILL 繁體中文翻譯

以下為專案中各 SKILL 的繁體中文說明（保留 code blocks 原文）。

INDEX
for f in *.SKILL.zh-TW.md; do
  echo "- [${f}](./${f})" >> docs/index.md
done

git add docs

# Commit any changes
if git diff --staged --quiet; then
  echo "No docs changes to commit"
else
  git commit -m "docs: add docs/ for GitHub Pages" -m "Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>" || true
fi

# Determine owner
if [ -n "$GITHUB_ORG" ]; then
  OWNER="$GITHUB_ORG"
  CREATE_URL="https://api.github.com/orgs/$OWNER/repos"
else
  OWNER=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user | python3 -c "import sys,json;print(json.load(sys.stdin).get('login',''))")
  if [ -z "$OWNER" ]; then
    echo "Failed to determine authenticated user. Check GITHUB_TOKEN."; exit 1
  fi
  CREATE_URL="https://api.github.com/user/repos"
fi

echo "Creating repository $OWNER/$REPO_NAME (private=$PRIVATE) ..."
create_resp=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" -d "{\"name\": \"${REPO_NAME}\", \"private\": ${PRIVATE}}" "$CREATE_URL")
html_url=$(echo "$create_resp" | python3 -c "import sys,json;print(json.load(sys.stdin).get('html_url',''))")
if [ -n "$html_url" ]; then
  echo "Created: $html_url"
else
  echo "Create response:"; echo "$create_resp"; echo "If repository already exists, continue."
fi

# Push to remote using token-authenticated URL
REMOTE_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/${OWNER}/${REPO_NAME}.git"
# Ensure remote
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${OWNER}/${REPO_NAME}.git"

echo "Pushing branch $BRANCH to $OWNER/$REPO_NAME ..."
git push "$REMOTE_URL" $BRANCH -u

# Configure Pages to use branch/docs
echo "Configuring GitHub Pages to use branch=${BRANCH}, path=${DOCS_PATH} ..."
pages_resp=$(curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" "https://api.github.com/repos/${OWNER}/${REPO_NAME}/pages" -d "{\"source\":{\"branch\":\"${BRANCH}\",\"path\":\"${DOCS_PATH}\"}}")
echo "$pages_resp"

echo "Done. Project page will be at: https://${OWNER}.github.io/${REPO_NAME} (may take a minute to build)."
