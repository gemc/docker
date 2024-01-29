The containers work in batch mode or interactively using novnc:

* batch mode:  `docker run -it --rm container  bash`
* interactive: `docker run -it --rm -p 8080:8080 container`

---

## Base containers: includes necessary packages to support geant4 and gemc applications.

- base:fedora36
- base:ubuntu22
- base:almalinux9*
  
## Sim containers: includes clhep, xercesc, qt and geant4: 

- Fedora:
  - 10.6.2-fedora36
  - 10.7.4-fedora36
  - 11.1.1-fedora36


- Ubuntu:
  - 10.6.2-ubuntu22
  - 10.7.4-ubuntu22
  - 11.1.1-ubuntu22

- Almalinux:
  - 10.6.2-almalinux9
  - 10.7.4-almalinux9
  - 11.1.1-almalinux9
  
---

### Sim containers with SIM_HOME set to:

### Additional content:

- root
- novnc to run interactive sessions through fluxbox
- basic utilities like cmake, python3, git, curl, etc.

---



| M. Ungaro |   [![Homepage](https://cdn3.iconfinder.com/data/icons/feather-5/24/home-64.png)](https://maureeungaro.github.io/home/)   |        [![email](https://cdn4.iconfinder.com/data/icons/aiga-symbol-signs/439/aiga_mail-64.png)](mailto:ungaro@jlab.org)         | [![github](https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-social-github-64.png)](https://github.com/maureeungaro)  | 
|:---------:|:------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------:|


---

### Notes

- The Almalinux container does not support interactive sessions yet.


## Dockerfile Commands

![Alt dockerfile commands](dockerfile-commands.png?raw=true "dockerfile commands")


# Interactive packages requirements:

See https://github.com/theasp/docker-novnc/

- xterm - to demo that it works
- Xvfb - X11 in a virtual framebuffer
- x11vnc - A VNC server that scrapes the above X11 server
- noNVC - A HTML5 canvas vnc viewer
- Fluxbox - a small window manager
- supervisord - to keep it all running