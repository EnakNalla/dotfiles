dotfiles=$HOME/.dotfiles

### homebrew ###
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file $dotfiles/Brewfile

### backups ###
[ ! -d ~/Library/scripts ] && mkdir -p ~/Library/scripts
cp $dotfiles/backup_scripts/com.enak.backup.sh $HOME/Library/scripts/com.enak.backup.sh
chown $USER:wheel $HOME/Library/scripts/com.enak.backup.sh
chmod +x $HOME/Library/scripts/com.enak.backup.sh
cp $dotfiles/backup_scripts/com.enak.backup.plist $HOME/Library/LaunchAgents/com.enak.backup.plist
chown $USER:wheel $HOME/Library/LaunchAgents/com.enak.backup.plist
chmod 755 $HOME/Library/LaunchAgents/com.enak.backup.plist
sed -i "s+replace/$HOME/Library/scripts/com.enak.backup.sh" $HOME/Library/LaunchAgents/scripts/com.enak.backup.plist
launchctl load $home/Library/LaunchAgents/com.enak.backup.plist

### git ###
[ -e ~/.gitconfig ] && rm ~/.gitconfig
ln -s $dotfiles/git/.gitconfig $HOME/.gitconfig
ln -s $dotfiles/git/.gitignore_global $HOME/.gitignore_global

### amethyst ###
ln -s $dotfiles/.amethyst $HOME/.amethyst

### zsh ###
ln -s $dotfiles/nvim $HOME/.config/nvim
ln -s $dotfiles/.ideavimrc $home/.ideavimrc

### misc ###
sudo sed -i "1s/^/auth sufficient pam_tid.so \n/" /ect/pam.d/sudo # sudo with fingerprint

# node
nvm install --lts
nvm use --lts
