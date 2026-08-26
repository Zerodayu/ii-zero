#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/.XCompose"
TARGET="$HOME/.XCompose"

echo "[xcompose] Installing..."

cp "$SOURCE" "$TARGET"
echo "[xcompose] Copied .XCompose → $TARGET"
echo "[xcompose] Edit $TARGET and replace placeholders:"
echo "  NAME_PLACEHOLDER → your name"
echo "  EMAIL_PLACEHOLDER → your email"
echo "  PASSWORD_PLACEHOLDER → your password"
echo "[xcompose] Then relogin for changes to take effect."
