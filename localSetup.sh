#!/bin/sh

# on fedora and ubuntu installation dir is different for modules
[[ -f /usr/share/Modules/init/sh ]] && source /usr/share/Modules/init/sh
[[ -f /usr/share/modules/init/sh ]] && source /usr/share/modules/init/sh

export TERM=xterm-256color














alias l='ls -l'
alias lt='ls -lhrt'
alias ll='ls -lah'
alias gist='git status -s | grep -v \?'
alias gista='git status -s'


