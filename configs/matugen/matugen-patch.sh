#!/bin/bash
# matugen-patch.sh - Patches matugen config with custom nvim template

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MATUGEN_DIR="$HOME/.config/matugen"
CONFIG="$MATUGEN_DIR/config.toml"

# Template source files
NVIM_TEMPLATE="$SCRIPT_DIR/templates/nvim/colors.json"

# Copy templates
echo "Copying templates..."
mkdir -p "$MATUGEN_DIR/templates/nvim"
cp "$NVIM_TEMPLATE" "$MATUGEN_DIR/templates/nvim/colors.json"

# Config entries to append
NEOVIM_ENTRY='
# my templates
[templates.neovim]
input_path = '\''~/.config/matugen/templates/nvim/colors.json'\''
output_path = '\''~/.config/matugen/templates/nvim/nvim-colors.json'\''
post_hook = "pkill -SIGUSR1 nvim"'

# Patch config.toml if entries not present
if ! grep -q "\[templates.neovim\]" "$CONFIG" 2>/dev/null; then
  echo "Patching config.toml..."
  echo "$NEOVIM_ENTRY" >>"$CONFIG"
  echo "Config patched."
else
  echo "Config already patched, skipping."
fi

echo "Done."
