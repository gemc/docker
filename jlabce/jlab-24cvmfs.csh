#!/bin/csh -f

setenv JLAB_ROOT /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft
setenv JLAB_VERSION 2.4
setenv OSRELEASE fedora34-gcc11
setenv JLAB_SOFTWARE $JLAB_ROOT/$OSRELEASE
set CE_DATE = "(Wed Sept 28 2022)"
set packages = ( clhep xercesc qt geant4 scons ccdb mlibrary hipo )
setenv CLAS12TAG 5.1

setenv PATH $JLAB_ROOT/$JLAB_VERSION/ce:$PATH

# need to pass this to the scripts
setenv overwrite "no"


# Do not edit below this line
#############################

if( ! $?LD_LIBRARY_PATH) then
	setenv LD_LIBRARY_PATH ""
endif
if( ! $?PYTHONPATH) then
	setenv PYTHONPATH "."
endif


set red   = `tput setaf 1`
set reset = `tput sgr0`
set green = `tput setaf 2`
echo " > Common Environment Version: <"$green$JLAB_VERSION$reset">  "$CE_DATE
echo " > Running as "`whoami` on `hostname`
echo " > OS Release:    "$OSRELEASE
echo " > JLAB_ROOT set to:     "$green$JLAB_ROOT$reset

source $JLAB_ROOT/$JLAB_VERSION/ce/versions.env
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

echo

