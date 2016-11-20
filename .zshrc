export ZSH=$HOME/.oh-my-zsh

# Oh My Zsh config
ZSH_THEME="hakunin3"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
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
  export EDITOR='subl'
fi

# Hub
eval "$(hub alias -s)"

# Autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh



# Misc
export ARCHFLAGS="-arch x86_64"
test -e ${HOME}/.iterm2_shell_integration.zsh && \
  source ${HOME}/.iterm2_shell_integration.zsh

