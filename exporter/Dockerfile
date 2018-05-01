FROM python:3

# Tools
RUN apt-get update && \
    apt-get install -y ser2net

RUN git clone https://github.com/labgrid-project/labgrid /opt/labgrid && \
    pip install -e /opt/labgrid
RUN git clone https://github.com/vishnubob/wait-for-it.git /opt/wait-for-it

RUN echo "stty rows 33 cols 204" >> /etc/bash.bashrc

WORKDIR /opt/labgrid
