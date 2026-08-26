#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

CONFIGS=(
  fish
  nvim-plugin
  tmux
  opencode
  fastfetch
  xcompose
  matugen
  hyprland
)

usage() {
  echo "Usage: $0 [--fish] [--nvim-plugin] [--tmux] [--opencode] [--fastfetch] [--xcompose] [--matugen] [--hyprland]"
  echo ""
  echo "No flags = install all"
  exit 1
}

install_config() {
  local config="$1"
  local script="$SCRIPT_DIR/configs/$config/install.sh"

  if [ "$config" = "hyprland" ]; then
    script="$SCRIPT_DIR/hyprland/install.sh"
  fi

  if [ ! -f "$script" ]; then
    echo "ERROR: $script not found"
    return 1
  fi

  bash "$script"
}

# Parse args
if [ $# -eq 0 ]; then
  echo "Installing all configs..."
  for config in "${CONFIGS[@]}"; do
    install_config "$config"
    echo ""
  done
else
  for arg in "$@"; do
    case "$arg" in
    --fish | --nvim-plugin | --tmux | --opencode | --fastfetch | --xcompose | --matugen | --hyprland)
      config="${arg#--}"
      install_config "$config"
      echo ""
      ;;
    *)
      usage
      ;;
    esac
  done
fi

echo "Done."
