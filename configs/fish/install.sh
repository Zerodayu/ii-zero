#!/bin/bash
set -euo pipefail

FISH_CONFIG="$HOME/.config/fish/config.fish"
SOURCE_LINE='source ~/.config/ii-zero/configs/fish/@config.fish'

echo "[fish] Installing..."

if [ ! -f "$FISH_CONFIG" ]; then
    echo "[fish] config.fish not found, creating..."
    mkdir -p "$(dirname "$FISH_CONFIG")"
    echo "$SOURCE_LINE" > "$FISH_CONFIG"
    echo "[fish] Created config.fish with source line."
elif grep -qF "$SOURCE_LINE" "$FISH_CONFIG"; then
    echo "[fish] Already installed, skipping."
else
    echo "" >> "$FISH_CONFIG"
    echo "$SOURCE_LINE" >> "$FISH_CONFIG"
    echo "[fish] Added source line to config.fish."
fi
