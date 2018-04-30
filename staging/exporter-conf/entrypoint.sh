#!/bin/bash
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ser2net -c ${SCRIPTPATH}/ser2net.conf
labgrid-exporter -n default -x ws://coordinator:20408/ws ${SCRIPTPATH}/config.yaml
