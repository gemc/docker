# Docker build for gemc


Run image:

```
docker_run_gemc_image          4.4.2-5.1-5.2-5.3 fedora36-cvmfs
```


Inside the container:

```
cd $SIM_HOME
tar cvfz fedora.tar.gz ceInstall noarch fedora36-gcc12
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
alias l 'ls -l'
cd /scigroup/cvmfs/hallb/clas12/soft/ceInstall
git pull
cd /scigroup/cvmfs/hallb/clas12/soft/fedora36-gcc12/sim/2.4
\cp -rf  /work/clas12/ungaro/fedora36-gcc12/sim/2.4/* .
cd /scigroup/cvmfs/hallb/clas12/soft/noarch/scons_bm
\cp -rf  /work/clas12/ungaro/noarch/scons_bm/* .
```