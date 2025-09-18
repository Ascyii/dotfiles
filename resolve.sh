#!/usr/bin/env bash

set -e

pkg="$1"

stow --dotfiles --no "$pkg" 2>&1 |
	grep 'cannot stow' |
	sed -E 's/.*existing target ([^ ]+).*/\1/' |
	while read -r f; do
		echo "Removing $HOME/$f with force"
		rm -rf -- "$HOME/$f"
	done

stow --dotfiles "$pkg"
echo "Stowed $pkg"
