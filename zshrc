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
export LANG=fr_FR.UTF-9
export EDITOR='nvim'

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

# vi mode
#bindkey -v
#bindkey '^R' history-incremental-search-backward

# term with 256 color
if [ -e /lib/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm'
fi

# Aliases
if [ -f ~/.zsh/aliases ]; then
    . ~/.zsh/aliases
fi

# ORACLE CLIENT
export ORACLE_HOME=/home/morgan/APPLICATIONS/ARC/instantclient_11_2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

# VIRTUALENV PYTHON
export WORKON_HOME=~/.virtualenvs/
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh

# Completion django
. ~/.zsh/django_completion

# Perl
export PERL5LIB=/home/morgan/perl5/lib/perl5/

# GO
export GOPATH=~/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# SSH ADD
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add < /dev/null;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

#HASKELL CABAL
export PATH=$PATH:$HOME/.cabal/bin

#Rakudo perl 6
export PATH=~/.rakudobrew/bin:$PATH


