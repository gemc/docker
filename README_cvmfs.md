## CVMFS-Bases containers

### Description:

Containers with root support, capables of loading geant4 software from CVMFS
using modules.

<br/>

### Supported tags:

- jeffersonlab/cvmfs:fedora36
- jeffersonlab/cvmfs:ubuntu22
- jeffersonlab/cvmfs:almalinux9[^1]
  
[^1] The Almalinux container does not support interactive sessions yet.

<br/>

### How to run:

The containers work in batch mode or interactively using novnc:

* **batch mode**:  `docker run -it --rm -v /cvmfs:/cvmfs:ro container  bash`
* **interactive**: `docker run -it --rm -v /cvmfs:/cvmfs:ro -p 8080:8080 container` <br/> 
  then point your browser to `http://localhost:8080`

<br/>

#### Example:

```
docker run -it --rm  -v /cvmfs:/cvmfs:ro jeffersonlab/base:fedora36 bash
```

<br/>

---


| M. Ungaro |   [![Homepage](https://cdn3.iconfinder.com/data/icons/feather-5/24/home-64.png)](https://maureeungaro.github.io/home/)   |        [![email](https://cdn4.iconfinder.com/data/icons/aiga-symbol-signs/439/aiga_mail-64.png)](mailto:ungaro@jlab.org)         | [![github](https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-social-github-64.png)](https://github.com/maureeungaro)  | 
|:---------:|:------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------:|





