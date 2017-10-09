FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install --assume-yes git python3 virtualenv python3-pip

RUN virtualenv -p python3 /opt/labgrid-venv && . /opt/labgrid-venv/bin/activate && pip3 install labgrid==0.1.0

COPY entry_script.sh /opt/entry_script.sh
RUN chmod a+x /opt/entry_script.sh
ENTRYPOINT ["/opt/entry_script.sh"]
