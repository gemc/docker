#!/bin/csh -f

setenv OSRELEASE fedora34-gcc11
setenv JLAB_ROOT /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/$OSRELEASE/sim
setenv JLAB_VERSION 2.4
setenv JLAB_SOFTWARE $JLAB_ROOT/$JLAB_VERSION
set CE_DATE = "(Wed Oct 19 2022)"
set packages = ( clhep xercesc qt geant4 scons ccdb mlibrary hipo )

setenv PATH .:/root/ce/:$PATH

# Do not edit below this line
#############################

# need to pass this to the scripts
setenv overwrite yes

if( ! $?LD_LIBRARY_PATH ) then
	setenv LD_LIBRARY_PATH ""
endif
if( ! $?PYTHONPATH ) then
	setenv PYTHONPATH "."
endif

set red   = `tput setaf 1`
set reset = `tput sgr0`
set green = `tput setaf 2`
echo " > Common Environment Version: <"$green$JLAB_VERSION$reset">  "$CE_DATE
echo " > Running as "`whoami` on `hostname`
echo " > OS Release:    "$OSRELEASE
echo " > JLAB_ROOT set to:     "$green$JLAB_ROOT$reset

source /root/ce/versions.env

if( -d $JLAB_SOFTWARE) then
	echo " > JLAB_SOFTWARE set to: "$green$JLAB_SOFTWARE$reset
else
	mkdir -p $JLAB_SOFTWARE
	echo " > '$JLAB_SOFTWARE' is not a directory. Creating it."
endif
echo


foreach p ($packages)
	if( -f /root/ce/$p".env") then
		source /root/ce/$p".env"
	endif
end
echo

setenv C12BFIELDS $JLAB_SOFTWARE/cmag/1.1

alias l 'ls -l'
alias lt 'ls -lrt'

