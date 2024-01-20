#!/bin/bash

brew bundle dump --force --file $HOME/.config/dotfiles/Brewfile

pushd $HOME/.config/dotfiles

git add .
git commit -m "nightly backup"
git push

popd
