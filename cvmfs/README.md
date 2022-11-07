# CVMFS Docker build for CLAS12
No container is pushed to docker hub

- JLAB_ROOT: /cvmfs/oasis.opensciencegrid.org/jlab/hallb/clas12/soft/$OSRELEASE/sim/$SIM_VERSION
- OSRELEASE: fedora34-gcc11
- SIM_VERSION: 2.4, 2.5


The local container are used copy the builds to jlab

<ul style='list-style-type: "⦿ ";'>
	<li>fedora8-gcc10
	 <ul style='list-style-type: "❖ "'>
		<li>sim
	 <ul style='list-style-type:square'>
			<li>2.4
			<ul style='list-style-type: "‣ ︎"'>
				<li>clhep
				<ul style='list-style-type: "‣ ︎"'>
					<li>2.4.5.1
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
					<li>2.4.5.1
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
					<li>10.6.03
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
export OSRELEASE=fedora34-gcc11
export INSTL=$OSRELEASE/sim/$SIM_VERSION
mkdir -p $INSTL/clas12Tags
```

### qt will create top dir too, need to make symlinks like in the container

```
mkdir -p $INSTL/qt/system/gcc_64/lib
cd  $INSTL/qt/system/gcc_64
ln -s /usr/lib64/qt5/bin     bin
ln -s /usr/include/qt5       include
ln -s /usr/lib64/qt5/mkspecs mkspecs
ln -s /usr/lib64/qt5/plugins plugins
```

# Docker

Notice starting with 5.1 we don't need evio anymore. 
Change the dependencies in the docker files as well.

### Build in order:

```
docker build --progress=plain --no-cache -f Dockerfile-2.4        -t cvmfs:2.4 .
docker build --progress=plain --no-cache -f Dockerfile-clhep      -t cvmfs:clhep .
docker build --progress=plain --no-cache -f Dockerfile-xercesc    -t cvmfs:xercesc .
docker build --progress=plain --no-cache -f Dockerfile-qt         -t cvmfs:qt .
docker build --progress=plain --no-cache -f Dockerfile-geant4     -t cvmfs:geant4 .
docker build --progress=plain --no-cache -f Dockerfile-scons      -t cvmfs:scons .
docker build --progress=plain --no-cache -f Dockerfile-ccdb       -t cvmfs:ccdb .
docker build --progress=plain --no-cache -f Dockerfile-hipo       -t cvmfs:hipo .
docker build --progress=plain --no-cache -f Dockerfile-evio       -t cvmfs:evio .
docker build --progress=plain --no-cache -f Dockerfile-mlibrary   -t cvmfs:mlibrary .
docker build --progress=plain --no-cache -f Dockerfile-c12bfield  -t cvmfs:c12bfield .
docker build --progress=plain --no-cache -f Dockerfile-clas12Tags -t cvmfs:clas12Tags .
```


### Run last container:

```
docker run -it --rm cvmfs:clas12Tags bash
```

### Copy the files to jlab

Notice: the env must match what we have above.

```
export SIM_VERSION=2.4
export OSRELEASE=fedora34-gcc11
export INSTL=$OSRELEASE/sim/$SIM_VERSION
export REMOTED=ungaro@ftp.jlab.org:/volatile/clas12/ungaro/$INSTL
export REMOTEN=ungaro@ftp.jlab.org:/volatile/clas12/ungaro
```

Notice: we copy these one by one because of qt 

```
cd $JLAB_ROOT/../../
scp -r noarch          $REMOTEN
scp -r $INSTL/clhep    $REMOTED
scp -r $INSTL/xercesc  $REMOTED
scp    $INSTL/qt/system/gcc_64/lib/* $REMOTED"/qt/system/gcc_64/lib"
scp -r $INSTL/geant4   $REMOTED
scp -r $INSTL/ccdb     $REMOTED
scp -r $INSTL/evio     $REMOTED
scp -r $INSTL/hipo     $REMOTED
scp -r $INSTL/mlibrary $REMOTED
scp -r $INSTL/cmag     $REMOTED

export CTAGS=(5.1)
for ct in $CTAGS
do
	echo $ct
	scp -r $INSTL/clas12Tags/$ct $REMOTED/clas12Tags
done
```

