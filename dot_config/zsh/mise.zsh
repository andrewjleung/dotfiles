miseg() {
  mise "$@" -p "$HOME/.config/mise/mise.toml"
}

misel() {
  mise "$@" -p "$HOME/.config/mise/mise.local.toml"
}

miser() {
  misel use "$(mise registry | sed 's/[[:space:]].*//' | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Available tools' --no-strip-ansi)"
}

