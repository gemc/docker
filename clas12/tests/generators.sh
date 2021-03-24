#!/bin/zsh

# This tests the generators installation and the three requirements:
# - executable name
# - working options: --docker --trig 10 --seed 124
# - output name
#
# Installation path on the container: /jlab/tests/


module load root/6.22.06
module load mcgen/1.5

generators=(clasdis claspyth dvcsgen genKYandOnePion inclusive-dis-rad JPsiGen TCSGen twopeg clas12-elSpectro)

declare -A working

echo
for g in $generators
    do
    eOut=$g".dat"

    echo testing:  $g
    working[$g]=":red_circle:"
   
    $g --docker --trig 10 --seed 123 > $g.log
    if test -f "$eOut"; then
        echo $eOut" exists. "$g is good
            working[$g]=":white_check_mark:"
    fi
    echo
done
echo
echo
echo "name | working"
echo "---- | -------"
for g in $generators
    do
    echo $g "|" $working[$g]
done
echo
echo


# success
exit 0

