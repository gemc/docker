# Docker configuration files for clas12


These images contain:



## Various generators

The generatos are submodules in this repo:

https://github.com/JeffersonLab/clas12-mcgen



### clas12tags

- [gemc](https://gemc.jlab.org/gemc/html/index.html)  
- [clas12 geometry and digitization](https://github.com/gemc/clas12Tags)


### reconstruction

- https://github.com/JeffersonLab/clas12-offline-software


### ced

####

Contact: ungaro@jlab.org

# Singularity Image

* cvmfs path: ```/cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production```

To run the singularity image:

```
singularity shell --home ${PWD}:/srv --pwd /srv --bind /cvmfs --contain --ipc --pid /cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production

```


# Notes:

The dockerfile of 4.4.1 is identical to 4.4.0 except the 



