#!/bin/bash

[ "$1" == "-x" ] && shift && set -x

VPN=$1
NAME=${2:-${VPN}}

#
# does not need to run privileged but unconfined
#
docker run -d --privileged --network=container:openvpn-${VPN}  --name=brave-${NAME} -e DISPLAY=${DISPLAY} -v /home/thomas/import/docker:/home/brave/Downloads -v /tmp/.X11-unix:/tmp/.X11-unix brave:latest
