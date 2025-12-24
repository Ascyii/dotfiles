#!/bin/sh

git add .
git commit -a -m "AutoSave - For reset"

bash stow.sh cli
bash stow.sh gui
bash stow.sh home

git reset HEAD
