set -o vi
export EDITOR=nvim
export VISUAL=nvim

# history
HISTSIZE=99999
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias vi='nvim'
alias history='history 1'

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export MAVEN_OPTS="-Xmx2048M -Xss128M -XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=1024M -XX:+CMSClassUnloadingEnabled"
PATH=$JAVA_HOME/bin:$PATH

# GNU Tools
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Golang
export GOPATH=$HOME/.go
PATH=$PATH:$(go env GOPATH)/bin

# Python
export PYENV_ROOT=$HOME/.pyenv
PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Misc Tools
PATH=$HOME/opt/bin:$PATH

export PATH
