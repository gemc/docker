#!/bin/sh

# on fedora and ubuntu installation dir is different for modules
[[ -f /usr/share/Modules/init/sh ]] && source /usr/share/Modules/init/sh
[[ -f /usr/share/modules/init/sh ]] && source /usr/share/modules/init/sh

export TERM=xterm-256color
export SIM_HOME=templateSim

currentDir=$(pwd)

cd $SIM_HOME
# if ceInstall is not there, clone it, otherwise pull
if [ ! -d "ceInstall" ]; then
  git clone https://github.com/JeffersonLab/ceInstall
else
  cd ceInstall
  git pull
  cd ..
fi

# root on ubuntu is installed with tarball, so we need to source it
[[ -d /etc/profile.d/root.sh ]] && source /etc/profile.d/root.sh

source $SIM_HOME/ceInstall/setup.sh install
cd $currentDir

alias l='ls -l'
alias lt='ls -lhrt'
alias ll='ls -lah'
alias gist='git status -s | grep -v \?'
alias gista='git status -s'


