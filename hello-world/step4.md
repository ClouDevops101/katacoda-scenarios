# Container Image

This is an _example_ of creating a scenario and running a **command**

`echo 'Hello World'`{{execute}}

# Container Image
A container image is a tar file containing tar files. Each of the tar file is a layer. Once all tar files have been extract into the same location then you have the container's filesystem.

This can be explored via Docker. Pull the layers onto your local system.

`docker pull redis:3.2.11-alpine`{{execute}}

Export the image into the raw tar format.

`docker save redis:3.2.11-alpine > redis.tar`{{execute}}

Extract to the disk

`tar -xvf redis.tar`{{execute}}

All of the layer tar files are now viewable.

`ls`{{execute}}

The image also includes metadata about the image, such as version information and tag names.

`cat repositories`{{execute}}

`cat manifest.json`{{execute}}

Extracting a layer will show you which files that layer provides.

`tar -xvf da2a73e79c2ccb87834d7ce3e43d274a750177fe6527ea3f8492d08d3bb0123c/layer.tar`{{execute}}

