#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR"
TARGET="$HOME/.config/hypr/custom"

echo "[hyprland] Installing..."

if [ -L "$TARGET" ] && [ "$(readlink "$TARGET")" = "$SOURCE" ]; then
  echo "[hyprland] Already installed, skipping."
elif [ -e "$TARGET" ]; then
  mv "$TARGET" "${TARGET}.bak"
  echo "[hyprland] Backed up existing → ${TARGET}.bak"
fi

ln -s "$SOURCE" "$TARGET"
echo "[hyprland] Symlinked → $TARGET"
echo "[hyprland] Run 'hyprctl reload' to apply."
