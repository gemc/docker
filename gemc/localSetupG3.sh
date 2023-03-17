#!/bin/sh

source /usr/share/Modules/init/sh

export TERM=xterm-256color
export SIM_HOME=/work

source $SIM_HOME/ceInstall/setup.sh install


module load gemc3/1.0


alias l='ls -l'
alias lt='ls -lhrt'
alias ll='ls -lah'
alias gist='git status -s | grep -v \?'
alias gista='git status -s'


