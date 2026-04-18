if type mise > /dev/null; then
    source <(mise completion zsh)
fi


if type chezmoi > /dev/null; then
    source <(chezmoi completion zsh)
fi

if type zmx > /dev/null; then
    source <(zmx completions zsh)
fi
