
.. _archive:

.. |br| raw:: html

   <br>


4.3.2
=====

Use the following command to run the clas12 software image 4.3.2 using a "~/mywork" local directory, and run clasdis events through the GEMC/COATJAVA chain::

 mkdir -p ~/mywork
 docker pull jeffersonlab/clas12software:4.3.2
 docker run -it --rm  -v ~/mywork:/jlab/work/mywork jeffersonlab/clas12software:4.3.2 bash
 cd mywork
 clasdis --trig 1000 --docker --t 25 35
 gemc -USE_GUI=0 -N=100 -INPUT_GEN_FILE="lund, sidis.dat" /jlab/clas12Tags/gcards/rga-spring2018.gcard
 evio2hipo -r 11 -t -1.0 -s -1.0 -i out.ev -o gemc.hipo

|br|

