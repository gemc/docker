#!/bin/csh

setenv JLAB_ROOT /jlab
setenv JLAB_VERSION 2.4
setenv CLAS12TAG 4.4.0
setenv JAVAPATHNOCLARA jre1.8.0_191
setenv JAVAPATHINSIDECLARA jre/linux-64/jre
setenv OSRELEASE Linux_CentOS8.2.2004-gcc8.3.1
setenv LD_PRELOAD /usr/lib64/libXrdPosixPreload.so

# some OSG nodes have XERCESROOT, QTDIR defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
setenv XERCESC_VERSION 3.2.2
setenv XERCESCROOT $JLAB_SOFTWARE/xercesc/$XERCESC_VERSION
setenv QT_VERSION system
setenv QTSYSTEM gcc_64
setenv QT_VERSION system
setenv QTDIR $JLAB_SOFTWARE/qt/$QT_VERSION/$QTSYSTEM
setenv QTLIB $QTDIR/lib

# using sqlite
setenv CCDB_CONNECTION sqlite:////jlab/work/ccdb_$CLAS12TAG".sqlite"

# sidis, inclusive dis with rad correction, dvcs
setenv CLASDIS_PDF /jlab/work/clas12-mcgen/clasdis/pdf
setenv CLASPYTHIA_DECLIST /jlab/work/clas12-mcgen/claspyth/pdf
setenv CLASDVCS_PDF /jlab/work/clas12-mcgen/dvcsgen
setenv DISRAD_PDF /jlab/work/clas12-mcgen/inclusive-dis-rad
setenv DataKYandOnePion /jlab/work/clas12-mcgen/genKYandOnePion/data

setenv GEMC /jlab/clas12Tags/$CLAS12TAG/source
setenv GEMC_VERSION $CLAS12TAG

source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh keepmine
setenv GEMC_DATA_DIR /jlab/clas12Tags/$CLAS12TAG
setenv FIELD_DIR /jlab/noarch/data

# CLAS12 Reconstruction
setenv CLAS12_LIB $JLAB_SOFTWARE/clas12/lib
setenv CLAS12_INC $JLAB_SOFTWARE/clas12/inc
setenv CLAS12_BIN $JLAB_SOFTWARE/clas12/bin

setenv CLARA_HOME $JLAB_ROOT/$JLAB_VERSION/claraHome
# this environment file is used for both the interactive and production container
# here we discriminate between the two installations
if (-d $CLARA_HOME) then

	setenv COATJAVA $CLARA_HOME/plugins/clas12
	setenv JAVA_HOME $CLARA_HOME/$JAVAPATHINSIDECLARA
	setenv PATH ${PATH}:${CLARA_HOME}/bin
	setenv CLAS12DIR ${COATJAVA} 	# CED
else
	setenv COATJAVA $JLAB_SOFTWARE/clas12/coatjava
	setenv JAVA_HOME $JLAB_SOFTWARE/$JAVAPATHNOCLARA
endif

setenv PATH ${JAVA_HOME}/bin:${CLAS12_BIN}:${COATJAVA}/bin:/jlab/work/cedbuild:${PATH}

set autolist
alias l ls -l
alias lt ls -lt
