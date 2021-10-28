# Docker configuration files for various docker hubs:


---

### base

Centos8 or Fedora34 images with rpm packages installed

[jeffersonlab/base](https://hub.docker.com/repository/docker/jeffersonlab/base)

---

### jlabce

- 2.5s: Based on centos8, use geant4 compiled in single thread mode. Includes:

  - evio
  - ccdb
  - hipo
  - cadmesh
   
- 2.5: Based on Fedora34, use geant4 compiled in multi-thread mode. Includes:

  - ccdb
  - cadmesh
 

[jeffersonlab/jlabce](https://hub.docker.com/repository/docker/jeffersonlab/jlabce)


### gemc

- 2.9: based on jabce:2.5s
- 3.0: based on jabce:2.5

[jeffersonlab/gemc](https://hub.docker.com/repository/docker/jeffersonlab/gemc)

---

### clas12tags


[jeffersonlab/clas12tags](https://hub.docker.com/repository/docker/jeffersonlab/clas12tags)


####

Contact: ungaro@jlab.org


### Notes:

The github username or organization should be linked to docker hub:
On the ACCOUNT settings go to applications and click on Docker Hub Builder.
Grant access to the organizations if needed.


#### Missing Packages:

- CentOS8 notes:  https://fedoraproject.org/wiki/EPEL

