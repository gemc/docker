#!/bin/bash

source /etc/profile.d/environment-4.3.2.sh

# Template for generators.

# This script will test these generators with success criteria below:
#
# - clasdis. No criteria
#
#
# The script is located in the container at /jlab/generators.sh
#

clasdis --t 20 25 --docker


exit 0
