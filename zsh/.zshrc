### P10K ###
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"

### GENERAL ###
unsetopt BEEP # beep is annoying

### SOURCE CONFIGS ###
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

### autocompletions ###
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept # ctrl + space accept

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
#compinit
__comp_options+=(globdots) # include hidden files

### VIMODE ###
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backwards-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char 
bindkey -M menuselect 'j' vi-down-line-or-history

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

### syntax highlighting ###
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern regexp root line cursor) 

### load stuff ###
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f $XDG_CONFIG_HOME/zsh/fzf.zsh ] && source $XDG_CONFIG_HOME/zsh/fzf.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

if [[ ${chpwd_functions[(r)list_all]} != "list_all" ]];then
  chpwd_functions=(${chpwd_functions[@]} "list_all")
fi

