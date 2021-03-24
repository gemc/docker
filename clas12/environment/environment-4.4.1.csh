#!/bin/csh

setenv JLAB_ROOT /jlab
setenv JLAB_VERSION 2.4
setenv CLAS12TAG 4.4.1
setenv OSRELEASE Linux_CentOS8.2.2004-gcc8.3.1
setenv JLAB_SOFTWARE /jlab/$JLAB_VERSION/$OSRELEASE

# some OSG nodes have XERCESROOT, QTDIR defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
setenv XERCESC_VERSION 3.2.3
setenv XERCESCROOT $JLAB_SOFTWARE/xercesc/$XERCESC_VERSION
setenv QT_VERSION system
setenv QTSYSTEM gcc_64
setenv QT_VERSION system
setenv QTDIR $JLAB_SOFTWARE/qt/$QT_VERSION/$QTSYSTEM
setenv QTLIB $QTDIR/lib

# using sqlite
setenv CCDB_CONNECTION sqlite:////cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/noarch/data/ccdb/ccdb_$CLAS12TAG".sqlite"

# CLAS12 envs
setenv CLAS12_LIB $JLAB_SOFTWARE/clas12/lib
setenv CLAS12_INC $JLAB_SOFTWARE/clas12/inc
setenv CLAS12_BIN $JLAB_SOFTWARE/clas12/bin

# env does not contain gemc, adding it manually
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh keepmine
setenv GEMC /jlab/clas12Tags/$CLAS12TAG/source
setenv GEMC_VERSION $CLAS12TAG
setenv PATH ${PATH}:${CLAS12_BIN}:${GEMC}
setenv PYTHONPATH ${PYTHONPATH}:${GEMC}/api/python
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${CLAS12_LIB}

setenv GEMC_DATA_DIR /jlab/clas12Tags/$CLAS12TAG
setenv FIELD_DIR /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/noarch/data/magfield/ascii/

source /etc/profile.d/modules.csh
source /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/setup.csh

set autolist
alias l ls -l
alias lt ls -lt
