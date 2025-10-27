pt() {
  ply to "$1" --cycle "$(ply cycles | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick an application cycle' --height 50)"
}

pn() {
  ply no "$(ply list applications --active | fzf)"
}

alias pyy='ply yes "$(ply list applications --active | fzf)"'

pd() {
  yazi "$(ply data-directory)"
}
