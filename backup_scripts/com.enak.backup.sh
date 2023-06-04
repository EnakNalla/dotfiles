# !/bin/bash

brew bundle dump --file $HOME/.dotfiles/Brewfile

pushd $HOME/.dotfiles

git add .
git commit -m "nightly backup"
git push

popd
