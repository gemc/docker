#!/bin/bash

export JLAB_ROOT=/jlab
export JLAB_VERSION=2.3
export CLAS12TAG=4.3.1
export JAVATAG=11.0.5

# some OSG nodes have XERCESROOT defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
export XERCESCROOT=/jlab/2.3/Linux_CentOS7.5.1804-x86_64-gcc4.8.5/xercesc/3.2.2
export XERCESC_VERSION=3.2.2

# using sqlite
export CCDB_CONNECTION=sqlite:////jlab/work/ccdb_2019-08-04.sqlite

# sidis, inclusive dis with rad correction, dvcs
export CLASDIS_PDF=/jlab/work/clasdis-nocernlib/pdf
export DISRAD_PDF=/jlab/work/inclusive-dis-rad
export CLASDVCS_PDF=/jlab/work/dvcsgen
export DataKYandOnePion=/jlab/work/genKYandOnePion/data

export GEMC=/jlab/clas12Tags/$CLAS12TAG/source
export GEMC_VERSION=$CLAS12TAG

source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.sh keepmine
export GEMC_DATA_DIR=/jlab/clas12Tags/$CLAS12TAG
export FIELD_DIR=/jlab/noarch/data

# CLAS12 Reconstruction
export CLAS12_LIB=$JLAB_SOFTWARE/clas12/lib
export CLAS12_INC=$JLAB_SOFTWARE/clas12/inc
export CLAS12_BIN=$JLAB_SOFTWARE/clas12/bin

export CLARA_HOME=$JLAB_ROOT/$JLAB_VERSION/claraHome
if  [ -d $CLARA_HOME ];
then
	export COATJAVA=$CLARA_HOME/plugins/clas12
	export JAVA_HOME=$CLARA_HOME/jre/$JRE
	export PATH=${JAVA_HOME}/bin:${PATH}:${CLAS12_BIN}:${COATJAVA}/bin:${CLARA_HOME}/bin
else
	export COATJAVA=$JLAB_SOFTWARE/clas12/coatjava
	export JAVA_HOME=$JLAB_SOFTWARE/jdk-$JAVATAG
fi



export PATH=${JAVA_HOME}/bin:${PATH}:${CLAS12_BIN}:${COATJAVA}/bin

set autolist
alias l='ls -l'
alias lt='ls -lt'

# CED
export CLAS12DIR=${COATJAVA}

