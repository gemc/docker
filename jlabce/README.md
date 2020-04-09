
# JLab Common Environment Container

## Introduction

This directory contains files for building a Docker image that contains
software setup by the JLab Common Environment (CE). This includes packages
like geant4, gemc, jana, xercesc, ... A full list and details on the 
CE can be found here:

<https://data.jlab.org/drupal/>

A pre-built image is available on docker hub so you don't need to build
your own. See instructions below.


## Using pre-built image

Pre-built images of some CE versions are available on docker cloud. Here's
how to use one on a computer where docker is already installed.

> docker run -it --rm jeffersonlab/jlabce:devel


