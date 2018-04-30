Labgrid Docker files
====================

Purpose
-------
This repository contains docker files to build a Docker image for the following Labgrid instances:

- **labgrid coordinator** (Crossbar) This instance simply configures a Labgrid coordinator instance, the image is build by:

  .. code-block:: bash

     $ cd coordinator
     $ docker build -t <coordinator-image-name> .

- **labgrid client** This instance contains the Labgrid client tools. The image is build by:

  .. code-block:: bash

     $ cd client
     $ docker build -t <client-image-name> .

- **labgrid exporter** This instance contains the Labgrid exporter tools. The image is build by:

  .. code-block:: bash

     $ cd exporter
     $ docker build -t <exporter-image-name> .

Desired architecture
--------------------
The docker images in this repository are thought to be used in a distributed setting, where a coordinator, client and exporter are utilized, as described in the `docs <https://labgrid.readthedocs.io/en/latest/getting_started.html#setting-up-the-distributed-infrastructure>`_
The exporter is provided as a Docker image, but this is primarily intended for test purpose, as in most cases it will be most beneficial to run the exporter on dedicated hardware.

Staging - Test environment
--------------------------
In *staging* a docker compose based staging environment resides. The staging environment contains a coordinator, an exporter and a client. Moreover a simple example configuration is provided to expose the USB serial on the Host. **Note** It is assumed that /dev/ttyUSB0 is available on the host to run the staging. It is also assumed that the serial is connected to the DUT.

Each container can be started individually with the appropriate debug TTY attached:

Coordinator
...........

  .. code-block:: bash

     $ docker-compose up coordinator

Exporter
........

  .. code-block:: bash

     $ docker-compose up exporter
     
Client
......     

  .. code-block:: bash

     $ docker-compose up -d client

As the client require an interactive shell, this can be achieved as described below, where an interactive shell is opened and the client is used to list the resources seen be the coordinator:

  .. code-block:: bash

     $ docker-compose exec client /bin/bash
     $ labgrid-client -x ws://coordinator:20408/ws resources

If debug TTY's are not needed the staging environment is simply started by:

  .. code-block:: bash

     $ docker-compose up -d

The client can still be accessed by exec as described above.
