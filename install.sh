#!/bin/bash
# Installation scripts for the neovim configuration
VERSION=0.0.1
SOURCE=config
TARGET=~/.config/nvim

printf "Neovim configuration installation v%s\n" $VERSION

# remove the ~/.config/nvim`
printf "Removing %s\n" $TARGET
# rm -rf "~/.config/nvim"

# stow this package
printf "Stowing %s in %s\n" $SOURCE $TARGET
# stow -vSt ~ config
