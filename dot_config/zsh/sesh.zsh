seshls() {
  sesh connect "$(
    sesh list -i | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a sesh' --height 50 --prompt='⚡' --no-strip-ansi
  )"
}

seshk() {
  local session="$(sesh list -t | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a sesh to kill' --height 50 --prompt='⚔️' --no-strip-ansi)"

  if [[ -z "$session" ]]; then
    echo "none selected"
    return 1
  fi

  tmux kill-session -t "$session"
}

