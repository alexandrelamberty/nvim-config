#!/bin/bash
# Nvim configuration installation

PACKAGE=config
TARGET=$HOME
DIR="$(dirname "$0")"

printf "Nvim configuration installation\n"
stow -d "$DIR" -vDt "$TARGET" $PACKAGE
rm -rf "$HOME/.config/nvim"
stow -d "$DIR" -vSt "$TARGET" $PACKAGE

