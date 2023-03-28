#!/bin/bash

# Returns a random background hipo file in the selected configuration
# example of command line:
# bgMerginFilename.sh rgk_fall2018_FTOff tor+1.00_sol-1.00 60nA_6535MeV get
# this script can be tested on cue machines
# exit codes defined in Submit documentation repo

# xrootd usage:

# - ls: xrdfs xroot://sci-xrootd.jlab.org ls /osgpool/hallb/clas12/backgroundfiles/rga_fall2018/tor+1.00_sol-1.00/40nA_10604MeV/10k/00095.hipo
# - cp: xrdcp xroot://sci-xrootd.jlab.org//osgpool/hallb/clas12/backgroundfiles/rga_fall2018/tor+1.00_sol-1.00/40nA_10604MeV/10k/00095.hipo .

configuration=$1
fields=$2
bkmerging=$3
getit=$4

# for onsite
# server="xroot://sci-xrootd.ib" actually the below works on cue machines, not ib
# for offsite:
server="xroot://sci-xrootd.jlab.org"
xdir="/osgpool/hallb/clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k"

NFILES=`xrdfs $server ls $xdir | wc | awk '{print $1}'`
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

bgfile="/osgpool/hallb/clas12/backgroundfiles/"$configuration"/"$fields"/"$bkmerging"/10k/"$nzeros$R".hipo"
if [[ ! $? -eq 0 ]]; then
        echo "bgMerginFilename: " $bgfile does not exist
        exit 223
fi

echo $bgfile

if [ "$#" == 4 ]; then
	if [ $getit == "get" ]; then
		xrdcp "$server/$bgfile" . # double // is necessary
		exit $?
	fi
fi


exit 0
