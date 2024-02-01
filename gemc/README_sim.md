## Sim containers

### Description:

Includes clhep, xercesc, qt and geant4 packages.

<br/>

### Supported tags:

- **Fedora**:

  - jeffersonlab/10.6.2-fedora36
  - jeffersonlab/10.7.4-fedora36
  - jeffersonlab/11.2.0-fedora36


- **Ubuntu**:

  - jeffersonlab/10.6.2-ubuntu22
  - jeffersonlab/10.7.4-ubuntu22
  - jeffersonlab/11.2.0-ubuntu22


- **Almalinux[^1]**:

  - jeffersonlab/10.6.2-almalinux9
  - jeffersonlab/10.7.4-almalinux9
  - jeffersonlab/11.2.0-almalinux9
  
[^1] The Almalinux container does not support interactive sessions yet.

<br/>

### How to run:

The containers work in batch mode or interactively using novnc:

* batch mode:  `docker run -it --rm container  bash`
* interactive: `docker run -it --rm -p 8080:8080 container` <br/> 
  then point your browser to `http://localhost:8080`

<br/>

#### Example:

```
docker run -it --rm jeffersonlab/10.7.4-fedora36 bash
```

<br/>

---


| M. Ungaro |   [![Homepage](https://cdn3.iconfinder.com/data/icons/feather-5/24/home-64.png)](https://maureeungaro.github.io/home/)   |        [![email](https://cdn4.iconfinder.com/data/icons/aiga-symbol-signs/439/aiga_mail-64.png)](mailto:ungaro@jlab.org)         | [![github](https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-social-github-64.png)](https://github.com/maureeungaro)  | 
|:---------:|:------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------:|





