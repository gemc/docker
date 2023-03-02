#!/bin/sh

source /usr/share/Modules/init/sh

source /work/ceInstall/setup.sh install

export TERM=xterm-256color

module load gemc3/1.0
module load .c12s/1.0
module load .ccdb

alias l='ls -l'
alias lt='ls -lhrt'
alias ll='ls -lah'
alias gist='git status -s | grep -v \?'
alias gista='git status -s'

