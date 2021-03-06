export ZSH=$HOME/.oh-my-zsh

# Oh My Zsh config
ZSH_THEME="hakunin3"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
plugins=(git brew history-substring-search rsync)

# User config
export PATH=$HOME/Binaries:$HOME/.secrets/bin:/usr/local/share/npm/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
source $HOME/.secrets/env

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -nw'
fi

# Hub
eval "$(hub alias -s)"

# Autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

function prepend_or_remove_path() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  elif [[ ! -d "$1" ]] && [[ ":$PATH:" == *":$1:"* ]]; then
    PATH=$(echo $PATH | sed -e 's|^./bin:||')
  fi
}

function set_local_bin_path() {
  prepend_or_remove_path "./bin"
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *set_local_bin_path* ]]; then
    preexec_functions+=("set_local_bin_path")
  fi
fi

# Misc
export ARCHFLAGS="-arch x86_64"
test -e ${HOME}/.iterm2_shell_integration.zsh && \
  source ${HOME}/.iterm2_shell_integration.zsh

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
