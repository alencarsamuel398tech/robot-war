#!/bin/bash
# Prepara o codespace: Claude Code + dependências do sandbox Linux (bubblewrap, socat).
set -euo pipefail
sudo apt-get update -qq
sudo apt-get install -y -qq bubblewrap socat
npm install -g @anthropic-ai/claude-code
echo "Pronto. Rode: claude"
