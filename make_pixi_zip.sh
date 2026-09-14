#!/bin/bash
set -euo pipefail

# Resolve the script's own directory so paths stay relative regardless of cwd (needed for GHA).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OUTPUT_DIR="$SCRIPT_DIR/_site"
ZIP_NAME="spatial-data-science.zip"

mkdir -p "$OUTPUT_DIR"

zip -j "$OUTPUT_DIR/$ZIP_NAME" "$SCRIPT_DIR/pixi.toml" "$SCRIPT_DIR/pixi.lock"

echo "Created $OUTPUT_DIR/$ZIP_NAME"
