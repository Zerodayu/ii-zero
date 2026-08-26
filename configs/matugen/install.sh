#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[matugen] Installing..."
bash "$SCRIPT_DIR/matugen-patch.sh"
