#!/bin/zsh

# Purpose: creates the dockerfile using an argument
#
# Arguments: exactly one argument: JLAB_VERSION

printUsage() {
        echo " "        >&2
        echo " Usage:"  >&2
        echo " "        >&2
        echo  " $0 JLAB_VERSION"  >&2
        echo " "        >&2
        echo " JLAB_VERSION can be:"       >&2
        echo " "        >&2
        echo " - 2.3"   >&2
        echo " - devel" >&2
        echo " "        >&2
        exit 0
}


if [ "$#" -ne 1 ]; then
    printUsage
fi
version=$1

if [[ "$version" != "devel" && "$version" != "2.3" ]]; then
    printUsage
fi

if [[ "$version" == "devel" ]]; then
    centos=centos8
fi

if [[ "$version" != "devel" && "$version" != "2.3" ]]; then
    printUsage
fi

rm -f Dockerfile ; touch Dockerfile

echo " "
echo " Using JLAB_VERSION "$version
echo " Using centos: "$centos
echo " "
echo " Merging BASEOS"
grep "### START" -A1000 Dockerfile-osbase | grep "### END" -B1000 >> Dockerfile



echo " "
