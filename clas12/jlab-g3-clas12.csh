#!/bin/csh -f

setenv overwrite "yes"
if($1 == "keepmine") then
	setenv overwrite "no"
endif

if( ! $?JLAB_VERSION) then
	setenv JLAB_VERSION 2.5
endif

# Get date from:
# git log -1
set CE_DATE = "(Wed Feb 9 2022)"


setenv PATH $JLAB_ROOT/$JLAB_VERSION/ce:$PATH

# Software packages
set packages = (clhep xercesc qt geant4 scons glibrary gemc root ccdb)

# Only print out if there's a prompt
alias echo 'if($?prompt) echo \!*  '


# Do not edit below this line
#############################

# Sourcing packages. This will set the LD_LIBRARY_PATH. 
if( ! $?LD_LIBRARY_PATH ) then
	setenv LD_LIBRARY_PATH ""
endif
if( ! $?PYTHONPATH ) then
	setenv PYTHONPATH "."
endif

setenv OSRELEASE `$JLAB_ROOT/$JLAB_VERSION/ce/osrelease.py`

# JLAB_SOFTWARE is where all the architecture software will be
setenv JLAB_SOFTWARE $JLAB_ROOT/$JLAB_VERSION/$OSRELEASE

set red   = `tput setaf 1`
set reset = `tput sgr0`
set green = `tput setaf 2`
echo " > Common Environment Version: <"$green$JLAB_VERSION$reset">  "$CE_DATE
echo " > Running as "`whoami` on `hostname`
echo " > OS Release:    "$OSRELEASE
echo " > JLAB_ROOT set to:     "$green$JLAB_ROOT$reset

source $JLAB_ROOT/$JLAB_VERSION/ce/versions.env
set DEFAULT_GEMC_VERSION = 3.0 # needed cause 2.5 has 2.9 by default
if( -d $JLAB_SOFTWARE) then
	echo " > JLAB_SOFTWARE set to: "$green$JLAB_SOFTWARE$reset
else
	mkdir -p $JLAB_SOFTWARE
	echo " > '$JLAB_SOFTWARE' is not a directory. Creating it."
endif
echo


foreach p ($packages)
	if( -f $JLAB_ROOT/$JLAB_VERSION/ce/$p".env") then
		source $JLAB_ROOT/$JLAB_VERSION/ce/$p".env"
	endif
end

# GPLUGIN_PATH to $JLAB_SOFTWARE/clas12-systems/$G3CLAS12_VERSION
setenv GPLUGIN_PATH $JLAB_SOFTWARE/clas12-systems/$G3CLAS12_VERSION/systemsTxtDB

unalias echo

