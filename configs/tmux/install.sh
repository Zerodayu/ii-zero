#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR"
TARGET="$HOME/.config/tmux"

echo "[tmux] Installing..."

if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
    echo "[tmux] Already installed, skipping."
else
    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    echo "[tmux] Symlinked → $TARGET"
fi
