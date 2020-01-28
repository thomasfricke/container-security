#!/bin/bash

[ "$1" == "-x" ] && set -x && shift

COUNTRY=${1:-Denmark}
NAME=$(echo ${COUNTRY} | tr '[:upper:]' '[:lower:]' )

docker rm  openvpn-${NAME}

docker run -d --name openvpn-${NAME} --env COUNTRY=${COUNTRY} --cap-add NET_ADMIN \
 -v $(pwd)/vpn:/etc/vpn \
 -v $(pwd)/passwd/passwd.conf:/etc/vpn/passwd.conf \
 -v /dev/net/tun:/dev/net/tun openvpn:latest
