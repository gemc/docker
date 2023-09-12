# Docker build for gemc


Run image:

```
docker_run_gemc_image          4.4.2-5.1-5.2-5.3 fedora36-cvmfs
docker_run_gemc_image          5.3-5.4 fedora36-cvmfs

```

## Full Install

Inside the container:

```
cd $SIM_HOME
tar cvfz fedora.tar.gz ceInstall noarch fedora36-gcc12
rm -f /usr/local/mywork/fedora.tar.gz
mv fedora.tar.gz /usr/local/mywork/
 ```


On ifarm:

```
cd /work/clas12/ungaro
rm -rf ceInstall noarch fedora36-gcc12
tar -zxpvf fedora.tar.gz
```


On local computer (this assumes two factors authentication is setup):


```
cd ~/mywork
scp fedora.tar.gz ifarm:/work/clas12/ungaro
```


On ifarm, as clas12 (warning. default shell is tcsh):
```
ssh clas12@ifarm
alias l 'ls -l'
cd /scigroup/cvmfs/hallb/clas12/soft/ceInstall
git pull
cd /scigroup/cvmfs/hallb/clas12/soft/noarch/clas12-config
git pull
cd /scigroup/cvmfs/hallb/clas12/soft/fedora36-gcc12/sim/2.4
\cp -rf  /work/clas12/ungaro/fedora36-gcc12/sim/2.4/* .
cd /scigroup/cvmfs/hallb/clas12/soft/noarch/scons_bm
\cp -rf  /work/clas12/ungaro/noarch/scons_bm/* .
```



## One CLAS12Tag install

Inside the container:

```
C12TVERSION=5.4
cd $SIM_HOME/fedora36-gcc12/sim/2.4/clas12Tags/
tar cvfz $C12TVERSION.tar.gz $C12TVERSION
rm -f /usr/local/mywork/$C12TVERSION.tar.gz
mv $C12TVERSION.tar.gz /usr/local/mywork/
chmod a+r /usr/local/mywork/$C12TVERSION.tar.gz
 ```

On local computer (this assumes two factors authentication is setup):

```
C12TVERSION=5.4
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

<br/><br/><br/><br/><br/><br/>










