#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR"
TARGET="$HOME/.config/fastfetch"

echo "[fastfetch] Installing..."

if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
    echo "[fastfetch] Already installed, skipping."
else
    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    echo "[fastfetch] Symlinked → $TARGET"
fi
