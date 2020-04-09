#!/bin/bash

export JLAB_ROOT=/jlab
export JLAB_VERSION=2.3
export CLAS12TAG=4.3.2
export JAVATAG=11.0.5
export JAVAPATHINSIDECLARA=jre/linux-64/jre 


# some OSG nodes have XERCESROOT defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
export XERCESCROOT=/jlab/2.3/Linux_CentOS7.5.1804-x86_64-gcc4.8.5/xercesc/3.2.2
export XERCESC_VERSION=3.2.2

# using sqlite
export CCDB_CONNECTION=sqlite:////jlab/work/ccdb_2020-03-15.sqlite

# sidis, inclusive dis with rad correction, dvcs
export CLASDIS_PDF=/jlab/work/clas12-mcgen/clasdis/pdf
export CLASPYTHIA_DECLIST=/jlab/work/clas12-mcgen/claspyth/pdf
export CLASDVCS_PDF=/jlab/work/clas12-mcgen/dvcsgen
export DISRAD_PDF=/jlab/work/clas12-mcgen/inclusive-dis-rad
export DataKYandOnePion=/jlab/work/clas12-mcgen/genKYandOnePion/data

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
# this environment file is used for both the interactive and production container
# here we discriminate between the two installations
if  [ -d $CLARA_HOME ];
then
	export=COATJAVA $CLARA_HOME/plugins/clas12
	export=JAVA_HOME $CLARA_HOME/$JAVAPATHINSIDECLARA
	export=PATH ${PATH}:${CLARA_HOME}/bin
	export CLAS12DIR=${COATJAVA} 	# CED
else
	export=COATJAVA $JLAB_SOFTWARE/clas12/coatjava
	export=JAVA_HOME $JLAB_SOFTWARE/jdk-$JAVATAG
fi

export PATH=${PATH}:${JAVA_HOME}/bin:${CLAS12_BIN}:${COATJAVA}/bin

set autolist
alias l='ls -l'
alias lt='ls -lt'
