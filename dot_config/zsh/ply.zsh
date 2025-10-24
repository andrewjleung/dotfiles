pt() {
  ply to "$1" --cycle "$(ply cycles | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick an application cycle' --height 50)"
}

pn() {
  ply no "$(eza --absolute $(ply data-directory) | fzf)"
}

alias pyy='ply yes "$(eza --absolute $(ply data-directory) | fzf)"'

pd() {
  yazi "$(ply data-directory)"
}
