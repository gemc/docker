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
}


if [ "$#" -ne 1 ]; then
    printUsage()
fi

#if [$1 ne "devel"]; then
#    printUsage()
#fi

version=$1

rm -f Dockerfile ; touch Dockerfile

echo " "
echo " Using JLAB_VERSION "$version
echo " Merging BASEOS"
grep "### START" -A1000 Dockerfile-osbase | grep "### END" -B1000 >> Dockerfile



echo " "
