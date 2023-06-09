#!/bin/bash

dotfiles=$HOME/.dotfiles

[ -e ~/.zshrc ] && rm ~/.zshrc
[ -e ~/.zshenv ] && rm ~/.zshenv

[ ! -d ~/.config ] && mkdir -p ~/.config

ln -s $HOME/.dotfiles/zsh $HOME/.config/zsh
ln -s $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $dotfiles/zsh/plugins/powerlevel10k

exec zsh
