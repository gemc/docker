#!/bin/sh

source /usr/share/Modules/init/sh

export TERM=xterm-256color
export SIM_HOME=templateSim

cd $SIM_HOME
# if ceInstall is not there, clone it, otherwise pull
if [ ! -d "ceInstall" ]; then
  git clone https://github.com/JeffersonLab/ceInstall
else
  cd ceInstall
  git pull
  cd ..
fi

source $SIM_HOME/ceInstall/setup.sh install

alias l='ls -l'
alias lt='ls -lhrt'
alias ll='ls -lah'
alias gist='git status -s | grep -v \?'
alias gista='git status -s'


