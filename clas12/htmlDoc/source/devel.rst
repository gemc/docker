:orphan:

.. |br| raw:: html

   <br>

|br|

Introduction
============

The CLAS12 simulation / reconstruction is packaged using `docker <https://www.docker.com>`_ images and
`CVMFS <https://cernvm.cern.ch/portal/filesystem>`_.

The images are utilized on the `Open Science Grid <https://opensciencegrid.org>`_
through the `CLAS12 Submission portal <https://gemc.jlab.org/web_interface/index.php>`_ to submit CLAS12 jobs.
Users can also use the images to run the CLAS12 software on their computers, as described below.

|br|

Installation
------------

Docker can be downloaded and installed from `docker.com <https://www.docker.com/get-started>`_.

To install CVMFS and load our software and data please follow `these instructions <https://clasweb.jlab.org/wiki/index.php/How_to_mount_and_use_the_CLAS12_software_releases_on_CVMFS.>`_.

To use /cvmfs in docker you need to add the directory on preferences > filesharing.

|br|

Content
-------

* `Events Generators <https://github.com/JeffersonLab/clas12-mcgen>`_
* `Gemc <https://gemc.jlab.org/gemc/html/index.html>`_ : Geant4 MonteCarlo
* `CLAS12 geometry, magnetic fields, digitization <https://github.com/gemc/clas12Tags>`_
* `Coatjava <https://clasweb.jlab.org/wiki/index.php/CLAS12_Software_Center#tab=Reconstruction>`_ reconstruction software
* CED: CLAS Event Display
* CLAS12 Calibration database sqlite tagged file
* CLAS12 Background merging files, available from xrootd.


|br|

Quickstart: Full chain using docker
===================================

The following commands will:

* pull and run the clas12 software image inside a "~/mywork" directory mounted from the computer host
* run clasdis to generate 100 events
* run gemc
* convert the gemv evio output to hipo format
* fetch a random background file using xrootd using the bgMerginFilename.sh utility
* run coatjava

.. code-block:: ruby

 mkdir -p ~/mywork
 docker pull jeffersonlab/clas12software:devel
 docker run -it --rm -v /cvmfs:/cvmfs -v ~/mywork:/jlab/work/mywork \
   jeffersonlab/clas12software:devel bash
 cd mywork
 clasdis --trig 100 --docker --t 25 35
 gemc -USE_GUI=0 -N=100 -INPUT_GEN_FILE="lund, clasdis.dat" \
   /jlab/clas12Tags/4.4.1/config/rga_fall2018.gcard
 evio2hipo -r 11 -t -1.0 -s -1.0 -i out.ev -o gemc.hipo
 bgMerginFilename.sh rga_fall2018  tor-1.00_sol-1.00 45nA_10604MeV get
 command to merge
 recon-util -y /jlab/clas12Tags/4.4.1/config/rga_fall2018.yaml -i gemc.hipo -o recon.hipo


|br|



Quickstart: GEMC examples, interactively (MacOS)
================================================

First, open the XQuartz app and go to preferences and activate the option ‘Allow connections from network clients’ in XQuartz settings.
This will allow XQuartz to receive display messages from network clients, such as docker.

Second, from any terminal::

    defaults write org.macosforge.xquartz.X11 enable_iglx -bool true

This will be useful when running gemc: it will allow OPENGL to use your graphic card.

|br|

Restart XQuartz to activate these changes.

|br|

Finally, add your localhost to the list of accepted X11 connections::

 xhost +127.0.0.1

You should be able now to run docker and use the native X server to open windows application


.. code-block:: ruby

 docker run -it --rm -v /cvmfs:/cvmfs -v ~/mywork:/jlab/work/mywork \
   -e DISPLAY=docker.for.mac.localhost:0  jeffersonlab/clas12software:devel bash


|br|


Quickstart: GEMC examples, interactively (Linux)
================================================

Add your localhost to the list of accepted X11 connections with one of these two commands (if the first doesn't work, try the second one):

.. code-block:: ruby

 xhost 127.0.0.1
 xhost local:root

Export the env variable DISPLAY:

.. code-block:: ruby

 export DISPLAY=:0

Run the command using your local x11 tmp dir:

.. code-block:: ruby

 docker run -it --rm -v /cvmfs:/cvmfs -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v ~/mywork:/jlab/work/mywork -e DISPLAY=$DISPLAY \
   jeffersonlab/clas12software:production /bin/bash

|br|

Troubleshooting
---------------

- `Linux: Solving Docker permission denied while trying to connect to the Docker daemon socket <https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/>`_

|br|






|



