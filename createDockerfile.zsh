#!/bin/zsh

# Purpose: creates the dockerfile using an argument
#
# Arguments: exactly one argument: JLAB_VERSION

printUsage() {
        echo " "        >&2
        echo " Usage:"  >&2
        echo " "        >&2
        echo  " $0 GEMC Version"  >&2
        echo " "        >&2
        echo " GEMC Version can be:"       >&2
        echo " "        >&2
        echo " - 2.4"   >&2
        echo " - devel" >&2
        echo " "        >&2
        exit 0
}

centosVersion() {
	case "$1" in
	devel)
		centos=centos8
	;;
	2.4)
		centos=centos8
	;;
	esac
}

jlabVersion() {
	case "$1" in
	devel)
		jlab=jlabDevel
	;;
	2.8)
		jlab=jlab2.4
	;;
	esac
}


if [ "$#" -ne 1 ]; then
    printUsage
fi
version=$1

if [[ "$version" != "devel" && "$version" != "2.3" ]]; then
    printUsage
fi

centosVersion $1
jlabVersion $1

dockerCentos=Dockerfile-$centos
dockerJLab=Dockerfile-$jlab

dockerFile=Dockerfile-$1
rm -f $dockerFile ; touch $dockerFile

echo " "
echo " Using GEMC Version: "$version
echo " Using centos:       "$centos", with dockerfile: "$dockerCentos
echo " Using JLab version: "$jlab", with dockerfile: "$dockerJLab
echo " "
echo " Creating dockerfile: "$dockerFile
echo " "

for container in $dockerCentos $dockerJLab;
do
	echo " Merging "$container
	grep "### START" -A1000 $container | grep "### END" -B1000 >> $dockerFile
	echo " " >> $dockerFile
done




echo " "
