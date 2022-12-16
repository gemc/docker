# CVMFS Docker build for CLAS12
The almost empty cvmfs:cvmfs is pushed to docker hub

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

# On ifarm

### Create the installation directory:

```
cd /volatile/clas12/ungaro
export SIM_VERSION=2.4
export OSRELEASE=fedora36-gcc12
export INSTL=$OSRELEASE/sim/$SIM_VERSION
mkdir -p $INSTL/clas12Tags
```


# Create the containers:

Notice starting with 5.1 we don't need evio anymore. 
Change the dependencies in the docker files as well.

### Build in order:

```
docker build --progress=plain --no-cache --build-arg PHYS_VERSION=2.4 -f Dockerfile-cvmfs-build -t cvmfs-build:cvmfs-build .
```


### Run last container:

```
docker run -it --rm cvmfs-build:cvmfs-build bash
```

### Copy the files to jlab

Notice: the env must match what we have above.

```
export SIM_VERSION=2.4
export OSRELEASE=fedora34-gcc11
export INSTL=$OSRELEASE/sim/$SIM_VERSION
export REMOTED=ungaro@ftp.jlab.org:/work/clas12/ungaro/$INSTL
export REMOTEN=ungaro@ftp.jlab.org:/work/clas12/ungaro
cd $JLAB_ROOT/../../
```

Notice 1: we copy these one by one because of qt 
Notice 2: the geant4 are a gazillion files, perhaps make tarball
Notice 2: this needs to be run in zsh cause bash sucks at arrays

```
zsh
scp -r noarch          $REMOTEN
scp -r $INSTL/clhep    $REMOTED
scp -r $INSTL/xercesc  $REMOTED
scp -r $INSTL/qt       $REMOTED
scp -r $INSTL/geant4   $REMOTED
scp -r $INSTL/ccdb     $REMOTED
scp -r $INSTL/evio     $REMOTED
scp -r $INSTL/hipo     $REMOTED
scp -r $INSTL/mlibrary $REMOTED
scp -r $INSTL/cmag     $REMOTED

CTAGS=(4.4.2 5.1)
for ct in $CTAGS
do
	echo $ct
	scp -r $INSTL/clas12Tags/$ct $REMOTED/clas12Tags
done
```

