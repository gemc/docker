#!/bin/bash

export JLAB_ROOT=/jlab
export JLAB_VERSION=2.4
export CLAS12TAG=4.4.1
export OSRELEASE=Linux_CentOS8.2.2004-gcc8.3.1
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

# sidis, inclusive dis with rad correction, dvcs
export CLASDIS_PDF=/jlab/work/clas12-mcgen/clasdis/pdf
export CLASPYTHIA_DECLIST=/jlab/work/clas12-mcgen/claspyth/pdf
export CLASDVCS_PDF=/jlab/work/clas12-mcgen/dvcsgen
export DISRAD_PDF=/jlab/work/clas12-mcgen/inclusive-dis-rad
export DataKYandOnePion=/jlab/work/clas12-mcgen/genKYandOnePion/data

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

source /etc/profile.d/modules.sh
source /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/setup.sh
module load coatjava/6.5.9
module load jdk/1.8.0_31

set autolist
alias l='ls -l'
alias lt='ls -lt'
