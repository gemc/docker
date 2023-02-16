# CVMFS Docker build for CLAS12
The almost empty cvmfs:cvmfs is pushed to docker hub. This points to the CVMFS installation 
below:


- JLAB_ROOT: /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/$OSRELEASE/sim/$SIM_VERSION
- OSRELEASE: fedora34-gcc11
- SIM_VERSION: 2.4, 2.5


The local container are used copy the builds to jlab

<ul style='list-style-type: "⦿ ";'>
	<li>fedora36-gcc12
	 <ul style='list-style-type: "❖ "'>
		<li>sim
	 <ul style='list-style-type:square'>
			<li>2.4
			<ul style='list-style-type: "‣ ︎"'>
				<li>clhep
				<ul style='list-style-type: "‣ ︎"'>
					<li>2.4.1.3
					</li>
				</ul>
				</li>
				<li>xerces-c
				<ul style='list-style-type: "‣ ︎"'>
					<li>3.2.3
					</li>
				</ul>
				</li>
				<li>geant4
				<ul style='list-style-type: "‣ ︎"'>
					<li>10.6.02
					</li>
				</ul>
				</li>
				<li>gemc
				<ul style='list-style-type: "‣ ︎"'>
					<li>4.4.2
					</li>
					<li>5.1
					</li>
				</ul>
				</li>
			</ul>
			</li>
			<li>2.5
			<ul style='list-style-type: "‣ ︎"'>
				<li>clhep
				<ul style='list-style-type: "‣ ︎"'>
					<li>2.4.4.2
					</li>
				</ul>
				</li>
				<li>xerces-c
				<ul style='list-style-type: "‣ ︎"'>
					<li>3.2.3
					</li>
				</ul>
				</li>
				<li>geant4
				<ul style='list-style-type: "‣ ︎"'>
					<li>10.6.02
					</li>
					<li>10.7.03
					</li>
				</ul>
				</li>
				<li>gemc
				<ul style='list-style-type: "‣ ︎"'>
					<li>5.2
					</li>
				</ul>
				</li>
			</ul>
			</li>
		</ul>
		</li>
	</ul>
	</li>
</ul>

# ifarm installation

### Create the installation directory:

```
export PHYS_VERSION=2.4
export OSRELEASE=fedora36-gcc12
export JLAB_INSTALL=/work/clas12/ungaro
mkdir -p $JLAB_INSTALL/$OSRELEASE/sim/$PHYS_VERSION
```


### Create the containers:

- Build the cvmfs-build image using the lines inside the Dockerfile ```/docker/cvmfs/Dockerfile-cvmfs-build``` 

### Run the cvmfs-build container and copy the files to jlab:

```
docker run -it --rm cvmfs-build:cvmfs-build bash
```

Notice: better to run in zsh cause arrays

```
zsh
```

```
alias l='ls -l'
source ceInstall/modules/setup.sh 
module load physlibs/2.4
export JLAB_INSTALL=/work/clas12/ungaro
export REMOTED=ungaro@ftp.jlab.org:$JLAB_INSTALL/$OSRELEASE/sim/$PHYS_VERSION
export REMOTEN=ungaro@ftp.jlab.org:$JLAB_INSTALL



cd $PHYS_HOME
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
