#!/bin/sh

git add .
git commit -a -m "AutoSave - For reset"

# Possibly with adoptation
bash stow.sh cli
bash stow.sh gui
bash stow.sh home

# Reset to the last autosave
git reset --hard HEAD
