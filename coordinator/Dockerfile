FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install --assume-yes git python3 virtualenv python3-pip libffi-dev python-dev

RUN virtualenv -p python3 /opt/labgrid-venv && . /opt/labgrid-venv/bin/activate && pip3 install idna==2.5 && pip3 install labgrid[coordinator]==0.1.0 xmodem

RUN git clone --branch v0.1.0 https://github.com/labgrid-project/labgrid /opt/labgrid

COPY entry_script.sh /opt/entry_script.sh
RUN chmod a+x /opt/entry_script.sh
ENTRYPOINT ["/opt/entry_script.sh"]
