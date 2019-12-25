#!/bin/bash

[ "$1" == "-x" ] && shift && set -x

VPN=$1
NAME=${2:-${VPN}}


docker run -d --network=container:${VPN} --privileged --name=chrome-${NAME} -e DISPLAY=${DISPLAY} -v /home/thomas/import/docker:/home/brave/Downloads -v /tmp/.X11-unix:/tmp/.X11-unix chrome
