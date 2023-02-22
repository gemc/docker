# CVMFS Docker build for CLAS12

The almost empty cvmfs:cvmfs is pushed to docker hub. This points to the CVMFS installation:

`SIM_HOME=/cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft`

The instructions below 

# ifarm installation


### Run the cvmfs-build container and copy the files to jlab:

`docker run -it --rm cvmfs:cvmfs-build zsh`

Inside the container
```
tar cvfz fedora.tar.gz ceInstall noarch fedora36-gcc12
scp fedora.tar.gz ungaro@ftp.jlab.org:/work/clas12/ungaro
```


