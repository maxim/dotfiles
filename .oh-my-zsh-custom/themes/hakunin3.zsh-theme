local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function contracted_dir() {
  current_dir=`print -P "%1d"`
  current_2dir=`print -P "%2~"`

  len=${#current_dir}
  if (( $len > 12 )); then
    a=("${(@s/_/)${current_dir}}")
    result=""
    for w in $a; do
      a2=("${(@s/-/)${w}}")
      for w2 in $a2; do
        result="$result${w2:0:1}"
      done
    done
    result="$result*"

    echo "${current_2dir/$current_dir/$result}"
  else
    echo $current_2dir
  fi
}

PROMPT="%D{%I:%M:%S} \$(contracted_dir)\$(git-radar --zsh --fetch) "
RPS1="${return_code}"
