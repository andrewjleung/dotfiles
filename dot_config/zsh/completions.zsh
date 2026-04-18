if type mise > /dev/null; then
    eval "$(mise completion zsh)"
fi


if type chezmoi > /dev/null; then
    eval "$(chezmoi completion zsh)"
fi

if type zmx > /dev/null; then
    eval "$(zmx completions zsh)"
fi
