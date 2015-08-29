local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT="%2~\$(git-radar --zsh --fetch) "
RPS1="${return_code}"

