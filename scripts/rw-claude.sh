#!/bin/bash
# Abre o Claude Code do Robot War isolado do vault Axenya.
# Config própria (sem CLAUDE.md, memória, hooks nem MCPs da Axenya) e cwd só neste repo.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
export CLAUDE_CONFIG_DIR="$HOME/.robotwar-claude"
mkdir -p "$CLAUDE_CONFIG_DIR"

# Trava de identidade: só a conta pessoal pode empurrar daqui.
ATIVA="$(gh api user --jq .login 2>/dev/null || true)"
if [ "$ATIVA" != "alencarsamuel398tech" ]; then
  echo "gh ativo é '$ATIVA'. Rode: gh auth switch -u alencarsamuel398tech" >&2
  exit 1
fi

cd "$REPO"
exec claude --model claude-sonnet-5-5 --effort medium "$@"
