Docker elasticsearch
====================

A docker container with elasticsearch 1.4.4.

Plugins
-------
The following plugins are installed:
- cloud-aws
- marvel
- paramedic

Building
--------
run build.sh

Running
-------
The launch.sh script file shows the various paramaters that can be passed when running docker.

The DATA_DIR needs to be created and is where elastic search will store all it logs.

It is expected that a single container will be run per host for this image. launch.sh maps the elastic search ports directly to the host (9200 & 9300)

The image sets mlockall as recommended by elasticsearch. To get this to work with docker, you need to set this for the docker daemon on the host. On ubuntu you can add the following line to /etc/init/docker.io.conf
```
limit memlock unlimited unlimited
```

