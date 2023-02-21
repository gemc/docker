# CVMFS Docker build for CLAS12

The almost empty cvmfs:cvmfs is pushed to docker hub. This points to the CVMFS installation:

`SIM_HOME=/cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft`

The instructions below 

# ifarm installation

### Create the installation directory:

```
export SIM_VERSION=2.4
export OSRELEASE=fedora36-gcc12
export JLAB_INSTALL=/work/clas12/ungaro
mkdir -p $JLAB_INSTALL/$OSRELEASE/sim/$SIM_VERSION
```


### Create the containers:

Build the cvmfs-build image using the lines inside the Dockerfile:

`/docker/cvmfs/Dockerfile-cvmfs-build`

### Run the cvmfs-build container and copy the files to jlab:

`docker run -it --rm cvmfs:cvmfs-build zsh`

Inside the container
```
alias l='ls -l'
source ceInstall/setup.sh 
module load sim/2.4
export JLAB_INSTALL=/work/clas12/ungaro
export REMOTED=ungaro@ftp.jlab.org:$JLAB_INSTALL/$OSRELEASE/sim/$PHYS_VERSION
export REMOTEN=ungaro@ftp.jlab.org:$JLAB_INSTALL



cd $SIM_HOME
scp -r noarch ceInstall $REMOTEN

cd $PHYS_HOME/$OSRELEASE/$PHYS_SUB_DIR/$PHYS_VERSION

for s in clhep xercesc qt geant4 ccdb evio hipo mlibrary cmag clas12Tags; do
    echo
    echo "> ZTar and SCP: $s"
    echo
    tar -czf $s.tar.gz $s
done

scp *.tar.gz $REMOTED

```

On the ifarm tab:

```
cd $JLAB_INSTALL/$OSRELEASE/sim/$PHYS_VERSION
for s in clhep xercesc qt geant4 ccdb evio hipo mlibrary cmag clas12Tags; do
    echo "> Spackaging: $s"
    tar -xzf $s.tar.gz
done
rm *.tar.gz 
```
