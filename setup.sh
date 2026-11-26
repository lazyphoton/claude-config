#!/usr/bin/env bash
# Sync the universal CLAUDE.md into ~/.claude. Works locally and in cloud sessions.
set -euo pipefail
REPO="https://github.com/lazyphoton/claude-config.git"
DIR="$HOME/claude-config"
mkdir -p "$HOME/.claude"
if [ -d "$DIR/.git" ]; then
  git -C "$DIR" pull --ff-only
else
  git clone --depth 1 "$REPO" "$DIR"
fi
ln -sf "$DIR/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
echo "CLAUDE.md linked: $HOME/.claude/CLAUDE.md"
