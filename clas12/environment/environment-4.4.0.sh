#!/bin/bash

export JLAB_ROOT=/jlab
export JLAB_VERSION=devel
export CLAS12TAG=4.4.0
export JAVAPATHNOCLARA=jre1.8.0_191
export JAVAPATHINSIDECLARA=jre/linux-64/jre
export OSRELEASE=Linux_CentOS8.1.1911-x86_64-gcc8

# some OSG nodes have XERCESROOT defined. Since we use keepmine we
# need to re-define those here. Notice: this is dependent on the Dockerfile (CentOS version)
export XERCESC_VERSION=3.2.2
export XERCESCROOT=/jlab/$JLAB_VERSION/$OSRELEASE/xercesc/$XERCESC_VERSION

# using sqlite
export CCDB_CONNECTION=sqlite:////jlab/work/ccdb_2020-04-05.sqlite

# sidis, inclusive dis with rad correction, dvcs
export CLASDIS_PDF=/jlab/work/clas12-mcgen/clasdis/pdf
export CLASPYTHIA_DECLIST=/jlab/work/clas12-mcgen/claspyth/pdf
export CLASDVCS_PDF=/jlab/work/clas12-mcgen/dvcsgen
export DISRAD_PDF=/jlab/work/clas12-mcgen/inclusive-dis-rad
export DataKYandOnePion=/jlab/work/clas12-mcgen/genKYandOnePion/data

export GEMC=/jlab/clas12Tags/$CLAS12TAG/source
export GEMC_VERSION=$CLAS12TAG

source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.sh  keepmine
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
	export COATJAVA=$CLARA_HOME/plugins/clas12
	export JAVA_HOME=$CLARA_HOME/$JAVAPATHINSIDECLARA
	export PATH=${CLARA_HOME}/bin:${PATH}
	export CLAS12DIR=${COATJAVA} 	# CED
else
	export COATJAVA=$JLAB_SOFTWARE/clas12/coatjava
	export JAVA_HOME=$JLAB_SOFTWARE/$JAVAPATHNOCLARA
fi

export PATH=${JAVA_HOME}/bin:${CLAS12_BIN}:${COATJAVA}/bin:/jlab/work/cedbuild:${PATH}

set autolist
alias l='ls -l'
alias lt='ls -lt'
