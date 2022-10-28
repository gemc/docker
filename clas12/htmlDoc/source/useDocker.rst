:orphan:

.. |br| raw:: html

   <br>


.. _runningGEMCBatch:

Batch mode
----------

Use the pull command to make sure your image is up-to-date::

 docker pull jeffersonlab/clas12software:production

Use the following command to open a bash session on the container. You can also replace bash with tcsh::

 docker run -it --rm  -v /cvmfs:/cvmfs jeffersonlab/clas12software:production bash


|br|

.. _runningGEMCMount:

Mounting your directories to the container
------------------------------------------

The container will always start with the "pristine" image. In other words every work the the container filesystem will be lost when you exit docker.
You can use the option::

 -v /host/directory:/container/directory

to mount your local OS directories to be visible in docker. For example, to mount the "maximilian" home directory in a /max dir in the container::

 docker run -it --rm   -v /cvmfs:/cvmfs -v /home/max:/jlab/work/max \
   jeffersonlab/clas12software:production bash

*/jlab/work/max* will now point to maximilian home dir. You can save work here.

|br|

.. _runningGEMCWithGraphicBrowser:

Graphic mode (browser)
----------------------

Use the following command to pass the 6080 port to noVnc so the container can be opened on a brower::

 docker run -it --rm -v /cvmfs:/cvmfs -p127.0.0.1:6080:6080 \
   jeffersonlab/clas12software:production

Using your web brower open the page::

 http://localhost:6080

After clicking connect the linux desktop is shown with a running shell.|br|


|br|

.. note::

 I suggest to set the noVNC settings as follows:

 - Scaling mode: remote
 - Share mode active (this will ensure if you open another browser session, it will show the same instance of the container)
 - On the docker preferences try to make available as much memory as possible.


|br|

You can stop the docker container at any time with CTRL-C

|br|

.. _runningGEMCWithGraphicVNC:

Graphic mode (vnc)
------------------

Use the following command to pass the 5901 and the 6080 ports necessary to open the container with a vnc client::

 docker run -it --rm  -v /cvmfs:/cvmfs -p127.0.0.1:6080:6080 -p 5901:5901 \
   jeffersonlab/clas12software:production

You can now open localhost:5901 with your vnc client.

|br|

.. _runningGEMCWithGraphicInteractive:

Native interactive mode (no opengl)
-----------------------------------

On a mac, if you allow access from localhost with::

 1. Activate the option ‘Allow connections from network clients’ in XQuartz settings
    (Restart XQuartz (to activate the setting)
 2. xhost +127.0.0.1

Then you can run docker and use the local X server with::

 docker run -it --rm  -v /cvmfs:/cvmfs -e DISPLAY=docker.for.mac.localhost:0 \
   jeffersonlab/clas12software:production bash

You can run gemc in batch mode this way, but still enjoy the ability to open windows on the local host.

The interactive mode is slower than the browser or the vnc mode. I suggest you only use interactive when you want
to visualize a subset of the CLAS12 detectors, not all of them.

Notice that in this mode **gemc interactive visualization most likely will not work**: the opengl connection requires
that the docker container and the host have the same hardware acceleration driver.

|br|


.. _runningGEMCGenerator:

Using Generators
----------------

Run the container in batch mode (substitute the max's path with your home dir path)::

 docker run -it --rm  -v /cvmfs:/cvmfs -v /home/max:/jlab/work/max \
   jeffersonlab/clas12software:production bash

Find below the ways to generate events.

|br|

Use the internal generator
--------------------------

Use the clas12.gcard in /jlab/workdir to launch gemc. For example, to run 200 events in batch mode using 4 GeV electrons at theta=20 degrees and phi=5 degrees::

 gemc -USE_GUI=0 -INPUT_GEN_FILE="lund, dvcs.lund" -N=200 -BEAM_P="e-, 4*GeV, 20*deg, 5*deg"

|br|


Use a generator from clas12-mcgen
---------------------------------

To use one of the `events cenerators collected in clas12-mcgen <https://github.com/JeffersonLab/clas12-mcgen>`_, type its name and command line options.
For example::

 ./clasdis --trig 1000000 --nmax 10000

will write gemc lund type data files with 10K events in the directory of 1M events.

|br|


Use a LUND generated file
-------------------------

Use the clas12.gcard in /jlab/workdir to launch gemc. For example, to run 200 events in batch mode using
generated events in a `lund file <https://gemc.jlab.org/gemc/html/documentation/generator/lund.html>`_ in the local directory /home/max (mounted in /jlab/work/max)::

 cd /jlab/work/max
 gemc -USE_GUI=0 -INPUT_GEN_FILE="lund, dvcs.lund" -N=200 /jlab/work/clas12.gcard

This will produce an output with 200 generated events in evio format.

|br|


.. _runningevio2hipoExample:

Convert GEMC evio output to hipo
--------------------------------

Use evio2hipo to convert the gemc output into hipo.

Notice that the field maps scaling are -1 for standard gcard settings, but make sure you match the values if you are not using the provided gcard::

 evio2hipo -r 11 -t -1.0 -s -1.0 -i out.ev -o gemc.hipo

- Tours: -1 = inbending electrons
- Solenoid -1: = field points upstream
- Run geometry 11: = default simulation geometry run number


|br|

.. _runningCoatjaveExample:

