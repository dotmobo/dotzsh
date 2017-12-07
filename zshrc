# Theme
autoload -U compinit promptinit colors
compinit
promptinit
colors
PROMPT="%{$fg[cyan]%}%n@%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
source ~/.zsh/rprompt

# History
source ~/.zsh/history

# Complétion 
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'

# User configuration
export LANG=fr_FR.UTF-8
export EDITOR='vim'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
if [ -f ~/.zsh/aliases ]; then
    . ~/.zsh/aliases
fi

# VIRTUALENV PYTHON
export WORKON_HOME=~/.virtualenvs/
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/morgan/.sdkman"
[[ -s "/home/morgan/.sdkman/bin/sdkman-init.sh" ]] && source "/home/morgan/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
