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
filename=/usr/local/mywork/fedora.tar.gz
rm -f $filename
cd $SIM_HOME
tar cvfz $filename noarch 1.0/fedora36-gcc12
tar cvfz $filename 1.1/fedora36-gcc12
```


**On local computer** (this assumes two factors authentication is setup):


```
cd ~/mywork
scp fedora.tar.gz ifarm:/work/clas12/ungaro
```


**On ifarm**:
```
cd /scigroup/cvmfs/geant4
l /work/clas12/ungaro
git clone https://github.com/JeffersonLab/ceInstall.git
tar -zxpvf /work/clas12/ungaro/fedora.tar.gz
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










