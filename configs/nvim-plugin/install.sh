#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR"
TARGET="$HOME/.config/nvim/lua/plugins"

echo "[nvim-plugin] Installing..."

if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
    echo "[nvim-plugin] Already installed, skipping."
elif [ -e "$TARGET" ]; then
    mv "$TARGET" "${TARGET}.bak"
    echo "[nvim-plugin] Backed up existing → ${TARGET}.bak"
fi

mkdir -p "$(dirname "$TARGET")"
ln -s "$SOURCE" "$TARGET"
echo "[nvim-plugin] Symlinked → $TARGET"
