#!/bin/bash

[ "$1" == "-x" ] && shift && set -x

COUNTRY=${1:-Denmark}
NAME=$(echo ${COUNTRY} | tr '[:upper:]' '[:lower:]' )
NAME=${2:-${NAME}}

docker rm brave-${NAME}

#
# does not need to run privileged but unconfined
#
docker run -d  \
    --privileged \
    --ipc=private \
    --network=container:openvpn-${NAME}  \
    --name=brave-${NAME} \
    -e DISPLAY=${DISPLAY} \
    -e HOMEPAGE="https://whatismyip.com" \
    --device=/dev/dri:/dev/dri \
    -v /home/thomas/import/docker:/home/brave/Downloads \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/shm:/dev/shm \
    brave:latest
    
