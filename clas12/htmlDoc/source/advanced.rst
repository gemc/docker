:orphan:

.. _resources:

.. |br| raw:: html

   <br>

|br|

Useful Links
------------

* `This documentation repository <https://github.com/JeffersonLab/clas12container.git>`_ (based on `sphinx <https://www.sphinx-doc.org/en/master/>`_)
* `Dockerfile repository <https://github.com/gemc/docker>`_
* `CLAS12 docker hub <https://hub.docker.com/repository/docker/jeffersonlab/clas12software>`_
* `CLAS12 generators <https://github.com/JeffersonLab/clas12-mcgen>`_
* `CLAS12 OSG Portal <https://gemc.jlab.org/web_interface/index.php>`_


Singularity
-----------

The singularity images corresponding to the docker container is on cvmfs at the location::

 /cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production
 /cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:devel

|br|

Use this command to run singularity using these images::

 singularity shell --home ${PWD}:/srv --pwd /srv --bind /cvmfs --contain \
   --ipc --pid /cvmfs/singularity.opensciencegrid.org/jeffersonlab/clas12software:production

|br|


Containers Content
------------------

.. toctree::
	:maxdepth: 1

	tags


Archived Containers Usage Instructions
--------------------------------------

.. toctree::
	:maxdepth: 1

	archive

