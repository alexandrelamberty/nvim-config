#!/bin/bash
# Nvim configuration installation

PACKAGE=config
TARGET=$HOME

printf "Nvim configuration installation\n"
stow -vDt "$TARGET" $PACKAGE
rm -rf "$HOME/.config/nvim"
stow -vSt "$TARGET" $PACKAGE

