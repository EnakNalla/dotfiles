#!/bin/bash

dotfiles=$HOME/.dotfiles

source $ZDOTDIR/.zshrc

### homebrew ###
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file $dotfiles/Brewfile

### backups ###
[ ! -d ~/Library/scripts ] && mkdir -p ~/Library/scripts
cp $dotfiles/backup_scripts/com.enak.backup.sh $HOME/Library/scripts/com.enak.backup.sh
sudo chown $USER:wheel $HOME/Library/scripts/com.enak.backup.sh
sudo chmod +x $HOME/Library/scripts/com.enak.backup.sh
cp $dotfiles/backup_scripts/com.enak.backup.plist $HOME/Library/LaunchAgents/com.enak.backup.plist
sudo chown $USER:wheel $HOME/Library/LaunchAgents/com.enak.backup.plist
sudo chmod 755 $HOME/Library/LaunchAgents/com.enak.backup.plist
sed -i "s+replace+$HOME/Library/scripts/com.enak.backup.sh+g" $HOME/Library/LaunchAgents/com.enak.backup.plist
launchctl load $HOME/Library/LaunchAgents/com.enak.backup.plist

### git ###
[ -e ~/.gitconfig ] && rm ~/.gitconfig
ln -s $dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $dotfiles/git/gitignore_global $HOME/.gitignore_global

### amethyst ###
ln -s $dotfiles/amethyst.yml $HOME/.amethyst.yml

### vim ###
ln -s $dotfiles/nvim $HOME/.config/nvim
ln -s $dotfiles/ideavimrc $HOME/.ideavimrc

### misc ###
sudo sed -i "1s/^/auth sufficient pam_tid.so \n/" /etc/pam.d/sudo # sudo with fingerprint

# hide desktop icons
defaults write com.apple.finder CreateDesktop false
killall Finder

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # allow key repeat

### node ###
nvm install --lts
nvm use --lts

### git ###
gh auth login
