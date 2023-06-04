function mkcd {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

function list_all() {
  emulate -L zsh
  ls
}
