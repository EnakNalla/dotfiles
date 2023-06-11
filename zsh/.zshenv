### XDG BASE DIRECTORIES ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

### ZSH ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$ZDOTDIR/.zhistory"

export EDITOR="vim"
export VISUAL="vim"

### HOMEBREW ###
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

### PATH ###
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

### EXPO ###
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
