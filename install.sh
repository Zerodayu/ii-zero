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
)

usage() {
    echo "Usage: $0 [--only <config>]"
    echo ""
    echo "Configs: ${CONFIGS[*]}"
    echo ""
    echo "Examples:"
    echo "  $0              # install all"
    echo "  $0 --only fish  # install only fish"
    exit 1
}

install_config() {
    local config="$1"
    local script="$SCRIPT_DIR/configs/$config/install.sh"

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
elif [ $# -eq 2 ] && [ "$1" = "--only" ]; then
    config="$2"
    if [[ ! " ${CONFIGS[*]} " =~ " ${config} " ]]; then
        echo "ERROR: Unknown config '$config'"
        usage
    fi
    install_config "$config"
else
    usage
fi

echo "Done."
