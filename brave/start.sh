#!/bin/bash

[ "$1" == "-x" ] && shift && set -x

VPN=$1
NAME=${2:-${VPN}}
docker rm brave-${NAME}

#
# does not need to run privileged but unconfined
#
docker run -d  --privileged --memory=12000m --memory-swap=16g --network=container:openvpn-${VPN}  \
    --name=brave-${NAME} -e DISPLAY=${DISPLAY}  --device=/dev/dri:/dev/dri \
    -v /home/thomas/import/docker:/home/brave/Downloads \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    brave:latest
    
