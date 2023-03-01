#!/bin/bash

source /usr/share/Modules/init/bash
source /work/ceInstall/setup.sh install

export TERM=${TERM:-xterm}

module load gemc3/1.0
module load .c12s/1.0
module load .ccdb


