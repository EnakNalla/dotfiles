alias vim='nvim'

# tmux
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# replace ls with exa
TREE_IGNORE="cache|log|logs|node_modules|vendor"
alias ls=' exa --group-directories-first'
alias la=' ls -a'
alias ll=' ls --git -l'
alias lt=' ls --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltt=' ls --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttt=' ls --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt=' ls --tree -D -L 5 -I ${TREE_IGNORE}'

# laravel sail
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

function mkcd() {
  mkdir -p "$1" && cd "$1"
}
