#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR"
TARGET="$HOME/.config/opencode"

echo "[opencode] Installing..."

if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
    echo "[opencode] Already installed, skipping."
else
    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    echo "[opencode] Symlinked → $TARGET"
fi
