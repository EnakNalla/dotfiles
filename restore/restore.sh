#!/bin/bash

DOTFILES="$HOME/.config/dotfiles"

print() {
	printf "\033[1;32m$1\033[0m\n"
}

### brew ###
print "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file $DOTFILES/Brewfile

### git ###
print "Linking git config..."
[ -e ~/.gitconfig ] && rm ~/.gitconfig
ln -s $dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $dotfiles/git/gitignore_global $HOME/.gitignore_global
gh auth login

### backup task ###
print "Registering backup task..."
[ ! -d ~/Library/scripts ] && mkdir -p ~/Library/scripts
ln -s $DOTFILES/backups/com.enak.backup.sh $HOME/Library/scripts/
sudo chown $USER:wheel $HOME/Library/scripts/com.enak.backup.sh
sudo chmod +x $DOTFILES/backups/com.enak.backup.sh

ln -s $DOTFILES/backups/com.enak.backup.plist $HOME/Library/LaunchAgents/
sudo chown $USER:wheel $DOTFILES/backups/com.enak.backup.plist
launchctl load $HOME/Library/LaunchAgents/com.enak.backup.plist

### zsh ###
print "Linking zsh config..."
ln -s $DOTFILES/zsh $HOME/.config/zsh
ln -s $DOTFILES/zsh/.zshenv $HOME/.zshenv # zshenv needs to be in $HOME
source $HOME/.config/zsh/.zshenv

### vim ###
print "Linking vim config..."
ln -s $DOTFILES/nvim $HOME/.config/nvim
ln -s $DOTFILES/ideavimrc $HOME/.ideavimrc

### alacritty ###
ln -s $DOTFILES/alacritty/alacritty.toml $HOME/.config/alacritty

### tmux ###
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

### node ###
print "Installing node..."
nvm install --lts
nvm use --lts

### macos ###
print "Configuring macOS..."
defaults write com.apple.finder CreateDesktop false # hide desktop icons
killall Finder

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # allow key repeat
