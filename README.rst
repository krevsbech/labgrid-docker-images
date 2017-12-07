Labgrid Docker files
====================

Purpose
-------
This repository contains docker files to build a Docker image for the following Labgrid instances:

- **labgrid coordinator** (Crossbar) This instance simply configures a Labgrid coordinator instance the image is build by:

  .. code-block:: bash

     $ cd coordinator
     $ docker build -t <coordinator-image-name> .

- **labgrid client** This instance contains the Labgrid client tools. The image is build by:

  .. code-block:: bash

     $ cd client
     $ docker build -t <client-image-name> .

Desired architecture
--------------------
The docker images in this repository are thought to be used in a distributed setting, where a coordinator, client and exporter is utilized, as described in the `docs <https://labgrid.readthedocs.io/en/latest/getting_started.html#setting-up-the-distributed-infrastructure>`_
The exporter is not provided as a Docker image, as this is thought to be installed directly in the host OS.

Run-time usage
--------------
To spin-up a container instance from the desired image use *docker run*:

  .. code-block:: bash

     $ docker run docker run -p 20408:20408 --name labgrid-coordinator <coordinator-image-name>

To spin up a container with the labgrid client use:
  .. code-block:: bash

     $ docker run -it -a stdin -a stdout --name labgrid-client <client-image-name> /bin/bash

From within the container the labgrid client can be used.

**Note:** To mount in a configuration dir on the host machine used the -v option
