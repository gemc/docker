# Docker configuration files for various docker hubs:


---

### base

Centos8 or Fedora35 images with rpm packages installed

[jeffersonlab/base](https://hub.docker.com/repository/docker/jeffersonlab/base)

---

### jlabce

- 2.5g2: Based on centos8. Includes geant4 and libraries needed for gemc2:

  - evio
  - ccdb
  - hipo
  - cadmesh
   
- 2.5g3: Based on Fedora35. Includes geant4 and libraries needed for gemc3:

  - ccdb
  - cadmesh
 

[jeffersonlab/jlabce](https://hub.docker.com/repository/docker/jeffersonlab/jlabce)


### gemc

- 2.9: based on jabce:2.5g2
- 3.0: based on jabce:2.5g3

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

