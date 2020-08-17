#!/bin/bash

# Returns a random background hipo file in the selected configuration
# example of command line:
# bgMerginFilename.sh rga_fall2018  tor-1.00_sol-1.00 45nA_10604MeV

configuration=$1
fields=$2
bkmerging=$3
getit=$4

export LD_PRELOAD=/usr/lib64/libXrdPosixPreload.so
# for onsite
# baseDir="xroot://sci-xrootd-ib//osgpool/hallb/"
# for offsite:
baseDir="xroot://sci-xrootd.jlab.org//osgpool/hallb/"
xdir=$baseDir"clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k"

NFILES=`ls $xdir | wc | awk '{print $1}'`

# works only if > 100 files
nzeros="00"

R=$(( $RANDOM % $NFILES ))

if (($R <10))
then
	nzeros="0000"
elif (($R<100))
then
	nzeros="000"
fi

bgfile=$baseDir"clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k/"$nzeros$R".hipo"

echo $bgfile

if [ "$#" == 4 ]; then
	if [ $getit == "get" ]; then
		cp $bgfile .
	fi
fi

unset LD_PRELOAD

