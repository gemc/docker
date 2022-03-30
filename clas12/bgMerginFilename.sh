#!/bin/bash

# Returns a random background hipo file in the selected configuration
# example of command line:
# bgMerginFilename.sh rga_fall2018 tor-1.00_sol-1.00 45nA_10604MeV
# exit codes defined in Submit documentation repo


# notice: in newer OSses we use xrdfs and xrdcp as follows:
# - no need to export LD_PRELOAD
# - ls: xrdfs xroot://sci-xrootd.jlab.org ls /osgpool/hallb/clas12/backgroundfiles/rga_fall2018/tor+1.00_sol-1.00/40nA_10604MeV/10k/00095.hipo
# - cp: xrdcp xroot://sci-xrootd.jlab.org//osgpool/hallb/clas12/backgroundfiles/rga_fall2018/tor+1.00_sol-1.00/40nA_10604MeV/10k/00095.hipo .

configuration=$1
fields=$2
bkmerging=$3
getit=$4

if [ ! -h /usr/lib64/libXrdPosixPreload.so ]; then
    echo "bgMerginFilename: /usr/lib64/libXrdPosixPreload.so does not exist. exiting"
    exit 220
fi

export LD_PRELOAD=/usr/lib64/libXrdPosixPreload.so
# for onsite
# baseDir="xroot://sci-xrootd-ib//osgpool/hallb/"
# for offsite:
baseDir="xroot://sci-xrootd.jlab.org//osgpool/hallb/"
xdir=$baseDir"clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k"

NFILES=`ls $xdir | wc | awk '{print $1}'`
if [[ $NFILES -eq 0 ]]; then
    echo "wrong NFILES: " $NFILES " not found. exiting"
    exit 221
fi

# works only if > 100 files
nzeros="00"

R=$(( $RANDOM % $NFILES + 1))
if [[ ! $? -eq 0 ]]; then
        echo "bgMerginFilename: RANDOM Number not valid: " $R
        exit 223
fi

if (($R < 10))
then
	nzeros="0000"
elif (($R < 100))
then
	nzeros="000"
fi

bgfile=$baseDir"clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k/"$nzeros$R".hipo"
if [[ ! $? -eq 0 ]]; then
        echo "bgMerginFilename: " $bgfile does not exist
        exit 223
fi

echo $bgfile

if [ "$#" == 4 ]; then
	if [ $getit == "get" ]; then
		cp $bgfile .
		exit $?
	fi
fi

unset LD_PRELOAD

exit 0
