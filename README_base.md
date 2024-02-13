## Base containers

### Description:

Include basic utilities like cmake, python3, git and the packages to 
support geant4 installation.

<br/>

### Supported tags:

- jeffersonlab/base:fedora36
- jeffersonlab/base:ubuntu22
- jeffersonlab/base:almalinux9
  

<br/>

### How to run:

The containers work in batch mode or interactively using novnc:

* **batch mode**:  `docker run -it --rm container  bash`
* **interactive**: `docker run -it --rm -p 8080:8080 container` <br/> 
  then point your browser to `http://localhost:8080`

<br/>

#### Example:

```
docker run -it --rm jeffersonlab/base:fedora36 bash
```

<br/>

---


| M. Ungaro |   [![Homepage](https://cdn3.iconfinder.com/data/icons/feather-5/24/home-64.png)](https://maureeungaro.github.io/home/)   |        [![email](https://cdn4.iconfinder.com/data/icons/aiga-symbol-signs/439/aiga_mail-64.png)](mailto:ungaro@jlab.org)         | [![github](https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-social-github-64.png)](https://github.com/maureeungaro)  | 
|:---------:|:------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------:|





