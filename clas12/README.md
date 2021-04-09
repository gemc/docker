# Docker configuration files for clas12



### clas12tags

Installed in /jlab/clas12Tags/4.4.1/

- [gemc](https://gemc.jlab.org/gemc/html/index.html)  
- [clas12 geometry and digitization](https://github.com/gemc/clas12Tags)


### reconstruction loaded from CVMFS

Contact: ungaro@jlab.org


# Tests

/jlab/tests/generators.sh

# Singularity Image

* cvmfs path: ```/cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production```

To run the singularity image:

```
singularity shell --home ${PWD}:/srv --pwd /srv --bind /cvmfs --contain --ipc --pid /cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production

```


# Notes:

The dockerfile of 4.4.1 is identical to 4.4.0 except the gemc track cutoff z, expanded to 9m from 8m 



