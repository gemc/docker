#!/bin/csh

setenv JLAB_ROOT    /jlab
setenv JLAB_VERSION 2.3
setenv CLAS12TAG    4.3.1
setenv JAVATAG      11.0.5

# some OSG nodes have XERCESROOT defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
setenv XERCESCROOT /jlab/2.3/Linux_CentOS7.5.1804-x86_64-gcc4.8.5/xercesc/3.2.2
setenv XERCESC_VERSION 3.2.2

# using sqlite
setenv CCDB_CONNECTION sqlite:////jlab/work/ccdb_2019-08-04.sqlite

# sidis, inclusive dis with rad correction, dvcs
setenv CLASDIS_PDF      /jlab/work/clasdis-nocernlib/pdf
setenv DISRAD_PDF       /jlab/work/inclusive-dis-rad
setenv CLASDVCS_PDF     /jlab/work/dvcsgen
setenv DataKYandOnePion /jlab/work/genKYandOnePion/data

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

if (-d $CLARA_HOME) then
	setenv COATJAVA   $CLARA_HOME/plugins/clas12
	setenv JAVA_HOME  $CLARA_HOME/jre/$JRE
	setenv PATH ${PATH}:${CLARA_HOME}/bin
else
	setenv COATJAVA  $JLAB_SOFTWARE/clas12/coatjava
	setenv JAVA_HOME $JLAB_SOFTWARE/jdk-$JAVATAG
endif

setenv PATH ${PATH}:${JAVA_HOME}/bin:${CLAS12_BIN}:${COATJAVA}/bin

set autolist
alias l ls -l
alias lt ls -lt

# CED
setenv CLAS12DIR ${COATJAVA}

