pt() {
  ply to "$1" --cycle "$(ply cycles | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick an application cycle' --height 50)"
}

pd() {
  yazi "$(ply data-directory)"
}
