## Full Install


Run image:

```
docker_run_gemc_image  4.4.2-5.4-5.5 fedora36-cvmfs
docker_run_gemc_image  5.6-dev       fedora36-cvmfs
docker_run_sim_image   1.2           fedora36-cvmfs
```


**Inside the container**:
Notice: omit 'noarch' when necessary.

```
version=1.2
#ostype=almalinux9-gcc11  
ostype=ubuntu22-gcc11  
#ostype=fedora36-gcc12
filename=/usr/local/mywork/$ostype-$version.tar.gz
#filename=/usr/local/mywork/noarch
rm -f $filename
cd $SIM_HOME
find ./ -type l  -name "*.so*" -exec sh -c 'for i in "$@"; do cp --preserve --remove-destination "$(readlink -f "$i")" "$i"; echo $i; done' sh {} +
find ./ -type l  -name "*.a*"  -exec sh -c 'for i in "$@"; do cp --preserve --remove-destination "$(readlink -f "$i")" "$i"; echo $i; done' sh {} +
find ./ -type d -name ".git" -exec rm -rf {} +
tar cvfz $filename $version/$ostype
#tar cvfz $filename noarch
```


**On local computer** (this assumes two factors authentication is setup):


```
cd ~/mywork
version=1.2
#ostype=almalinux9-gcc11  
ostype=ubuntu22-gcc11  
#ostype=fedora36-gcc12
filename=$ostype-$version.tar.gz
scp $filename ifarm:/work/clas12/ungaro
```


**On ifarm**:
Docker does not deal well with sym links. The last command will 
replace them with the actual files.
```
cd /scigroup/cvmfs/geant4
l /work/clas12/ungaro
version=1.1
#ostype=almalinux9-gcc11  
ostype=ubuntu22-gcc11  
#ostype=fedora36-gcc12
filename=/work/clas12/ungaro/$ostype-$version.tar.gz
#git clone https://github.com/JeffersonLab/ceInstall.git
tar -zxpvf  $filename
```



## One CLAS12Tag install

**Inside the container**:

```
C12TVERSION=5.6
filename=/usr/local/mywork/$C12TVERSION.tar.gz
rm -f $filename
cd $SIM_HOME/1.1/fedora36-gcc12/clas12Tags/
tar cvfz $filename $C12TVERSION
 ```

**On local computer** (this assumes two factors authentication is setup):

```
C12TVERSION=5.6
cd ~/mywork
scp $C12TVERSION.tar.gz ifarm:/work/clas12/ungaro
```

On ifarm, as clas12 (warning. default shell is tcsh):

```
ssh clas12@ifarm
setenv C12TVERSION 5.4
alias l 'ls -l'
cd /scigroup/cvmfs/hallb/clas12/soft/fedora36-gcc12/sim/2.4/clas12Tags
rm -rf $C12TVERSION
\cp -rf  /work/clas12/ungaro/$C12TVERSION.tar.gz .
tar -zxpvf $C12TVERSION.tar.gz
rm -f $C12TVERSION.tar.gz
```


## ceInstall and clas12-config pulls


```
cd /scigroup/cvmfs/geant4/ceInstall
git pull
```

<br/><br/><br/><br/><br/><br/>










