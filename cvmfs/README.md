# CVMFS Docker build for CLAS12
No container is pushed to docker hub

- JLAB_ROOT: /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/$OSRELEASE/sim
- OSRELEASE: fedora34-gcc11

The local container are used copy the builds to jlab


# Steps to copy the files:

### Prepare the dirs on the farm:

```
cd /volatile/clas12/ungaro
export SIM_VERSION=2.4
export OSRELEASE=fedora34-gcc11
export INSTL=$OSRELEASE/sim/$SIM_VERSION
mkdir -p $INSTL/clas12Tags
```

# qt will create top dir too
# need to make symlinks like in the container

mkdir -p $INSTL/qt/system/gcc_64/lib
cd  $INSTL/qt/system/gcc_64
ln -s /usr/lib64/qt5/bin     bin
ln -s /usr/include/qt5       include
ln -s /usr/lib64/qt5/mkspecs mkspecs
ln -s /usr/lib64/qt5/plugins plugins






# on docker

docker run -it --rm cvmfs:clas12Tags bash

export SIM_VERSION=2.4
export OSRELEASE=fedora34-gcc11
export INSTL=$OSRELEASE
export REMOTED=ungaro@ftp.jlab.org:/volatile/clas12/ungaro/$INSTL
export REMOTEN=ungaro@ftp.jlab.org:/volatile/clas12/ungaro
cd $JLAB_ROOT


scp -r noarch          $REMOTEN
scp -r $INSTL/clhep    $REMOTED
scp -r $INSTL/xercesc  $REMOTED
scp    $INSTL/qt/system/gcc_64/lib/* $REMOTED"/qt/system/gcc_64/lib"
scp -r $INSTL/geant4   $REMOTED
scp -r $INSTL/ccdb     $REMOTED
scp -r $INSTL/hipo     $REMOTED
scp -r $INSTL/mlibrary $REMOTED
scp -r $INSTL/cmag     $REMOTED

export CTAGS=(5.1)
for ct in $CTAGS
do
	echo $ct
	scp -r $INSTL/clas12Tags/$ct $REMOTED/clas12Tags
done


# evio only needed for 4.4.2
scp -r $INSTL/evio     $REMOTED


