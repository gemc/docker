#!/bin/csh -f
#
# Clara configuration creator, to be used in clas12tags containers
#
# two mandatory arguments
# 1 input file
# 2 number of threads

if($#argv != 3) then
	echo " "
	echo "Usage:   "
	echo  "  >> createClaraCook <inputfilename> <configuration> <nthreads>"
	echo " "
	echo " Configuration can be one of:"
	echo " "
	echo " - clas12-default"
	echo " - rga-fall2018"
	echo " - rga-spring2018"
	echo " - rga-spring2019"
	echo " - rgb-spring2019"
	echo " - rgk-fall2018"
	echo " "
	echo " "
	exit 0
endif

set inputF   = $1
set yamlConf = $2
set nthrea   = $3
set yamlFile = /jlab/clas12Tags/gcards/"$yamlConf".yaml

if ( ! -f $yamlFile ) then
	echo
	echo ERROR: $yamlFile does not exists. Please chose one among `ls /jlab/clas12Tags/gcards/*.gcard | awk -F\/ '{print $NF}' | awk -F\. '{print $1}'`
	echo
	echo Exiting
	exit
endif


# file is stored in a files.txt
rm -f files.txt ; echo $inputF > files.txt

rm -f cook.clara
echo "set fileList files.txt"      > cook.clara
echo "set inputDir ."             >> cook.clara
echo "set outputDir ."            >> cook.clara
echo "set threads "$nthrea        >> cook.clara
echo "set logDir log"             >> cook.clara
echo "set servicesFile "$yamlFile >> cook.clara
echo "run local"                  >> cook.clara
echo "exit"                       >> cook.clara
mkdir -p log
echo
echo Content of cook.clara:
echo
cat cook.clara
echo
echo You can now run clara-shell cook.clara
echo

