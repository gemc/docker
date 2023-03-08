# Docker build for gemc




## CVMFS Installation

`SIM_HOME=/cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft`


Inside the container

```
cd $SIM_HOME
tar cvfz fedora.tar.gz ceInstall noarch fedora36-gcc12
scp fedora.tar.gz ungaro@ftp.jlab.org:/work/clas12/ungaro
```