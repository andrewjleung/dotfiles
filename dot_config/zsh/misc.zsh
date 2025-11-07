alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}

inspect_path() {
  # shellcheck disable=SC2001
  echo "$PATH" | sed 's/:/\n/g'
}

saul() {
  chezmoi apply
  tmux source ~/.config/tmux/tmux.conf
  source ~/.zshrc
}

saulr() {
  local j="$(jobs)"

  if [[ -n "$j" ]]; then
    print "background jobs detected:\n\n$j\n\nplease exit them before saulr-ing (this will run 'omz reload')"
    return 1
  fi

  chezmoi apply
  tmux source ~/.config/tmux/tmux.conf
  omz reload
}

init() {
  "$DEV/$1/init.sh" $2
}
