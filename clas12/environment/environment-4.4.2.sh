#!/bin/bash

export JLAB_ROOT=/jlab
export JLAB_VERSION=2.4
export CLAS12TAG=4.4.2
export OSRELEASE=Linux_CentOS8-gcc8.5.0
export JLAB_SOFTWARE=/jlab/$JLAB_VERSION/$OSRELEASE

# some OSG nodes have XERCESROOT, QTDIR defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
export XERCESC_VERSION=3.2.3
export XERCESCROOT=$JLAB_SOFTWARE/xercesc/$XERCESC_VERSION
export QT_VERSION=system
export QTSYSTEM=gcc_64
export QT_VERSION=system
export QTDIR=$JLAB_SOFTWARE/qt/$QT_VERSION/$QTSYSTEM
export QTLIB=$QTDIR/lib

# using sqlite
export CCDB_CONNECTION=sqlite:////cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/noarch/data/ccdb/ccdb_$CLAS12TAG".sqlite"

# CLAS12 envs
export CLAS12_LIB=$JLAB_SOFTWARE/clas12/lib
export CLAS12_INC=$JLAB_SOFTWARE/clas12/inc
export CLAS12_BIN=$JLAB_SOFTWARE/clas12/bin

# env does not contain gemc, adding it manually
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.sh keepmine
export GEMC=/jlab/clas12Tags/$CLAS12TAG/source
export GEMC_VERSION=$CLAS12TAG
export PATH=${PATH}:${CLAS12_BIN}:${GEMC}
export PYTHONPATH=${PYTHONPATH}:${GEMC}/api/python
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CLAS12_LIB}

export GEMC_DATA_DIR=/jlab/clas12Tags/$CLAS12TAG
export FIELD_DIR=/cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/noarch/data/magfield/ascii/

# clearing module environment, as suggested by OSG, #67051
unset ENABLE_LMOD
unset _LMFILES_
unset LMOD_ANCIENT_TIME
unset LMOD_arch
unset LMOD_CMD
unset LMOD_COLORIZE
unset LMOD_DEFAULT_MODULEPATH
unset LMOD_DIR
unset LMOD_FULL_SETTARG_SUPPORT
unset LMOD_PACKAGE_PATH
unset LMOD_PKG
unset LMOD_PREPEND_BLOCK
unset LMOD_SETTARG_CMD
unset LMOD_SETTARG_FULL_SUPPORT
unset LMOD_sys
unset LMOD_SYSTEM_DEFAULT_MODULES
unset LMOD_VERSION
unset LOADEDMODULES
unset MODULEPATH
unset MODULEPATH_ROOT
unset MODULESHOME

source /etc/profile.d/modules.sh
source /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/setup.sh

set autolist
alias l='ls -l'
alias lt='ls -lt'
