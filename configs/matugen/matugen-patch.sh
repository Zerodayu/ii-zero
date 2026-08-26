#!/bin/bash
# matugen-patch.sh - Patches matugen config with custom nvim + opencode templates

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MATUGEN_DIR="$HOME/.config/matugen"
CONFIG="$MATUGEN_DIR/config.toml"

# Template source files
NVIM_TEMPLATE="$SCRIPT_DIR/templates/nvim/colors.json"
OPENCODE_TEMPLATE="$SCRIPT_DIR/templates/opencode/theme.json"

# Copy templates
echo "Copying templates..."
mkdir -p "$MATUGEN_DIR/templates/nvim" "$MATUGEN_DIR/templates/opencode"
cp "$NVIM_TEMPLATE" "$MATUGEN_DIR/templates/nvim/colors.json"
cp "$OPENCODE_TEMPLATE" "$MATUGEN_DIR/templates/opencode/theme.json"

# Config entries to append
NEOVIM_ENTRY='
# my templates
[templates.neovim]
input_path = '\''~/.config/matugen/templates/nvim/colors.json'\''
output_path = '\''~/.config/matugen/templates/nvim/nvim-colors.json'\''
post_hook = "pkill -SIGUSR1 nvim"

[templates.opencode]
input_path = '\''~/.config/matugen/templates/opencode/theme.json'\''
output_path = '\''~/.config/opencode/themes/matugen.json'\''
post_hook = "pkill -SIGUSR2 opencode"'

# Patch config.toml if entries not present
if ! grep -q "\[templates.neovim\]" "$CONFIG" 2>/dev/null; then
  echo "Patching config.toml..."
  echo "$NEOVIM_ENTRY" >>"$CONFIG"
  echo "Config patched."
else
  echo "Config already patched, skipping."
fi

echo "Done."
