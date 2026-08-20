#!/usr/bin/env bash
set -e

# Run the initial environment setup end-to-end.
# Each step below can also be run standalone via its own script.
SCRIPT_DIR=$(dirname "$(realpath "$0")")

"$SCRIPT_DIR/apt.sh"
"$SCRIPT_DIR/brew.sh"
"$SCRIPT_DIR/tmux.sh"
"$SCRIPT_DIR/link.sh"
"$SCRIPT_DIR/tools.sh"

# Authenticate GitHub CLI
gh auth login
