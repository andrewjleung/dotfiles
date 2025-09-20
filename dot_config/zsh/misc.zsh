inspect_path() {
  # shellcheck disable=SC2001
  echo "$PATH" | sed 's/:/\n/g'
}

saul() {
  local j="$(jobs)"

  if [[ -n "$j" ]]; then
    print "background jobs detected:\n\n$j\n\nplease exit them before saul-ing"
    return 1
  fi

  chezmoi apply
  tmux source ~/.config/tmux/tmux.conf
  omz reload
}
