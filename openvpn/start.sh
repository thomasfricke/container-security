#!/bin/bash

[ "$1" == "-x" ] && set -x && shift

TARGET=${1:-se43.nordvpn.com.udp.ovpn}
NAME=${2:-${TARGET}}

docker rm  openvpn-${NAME}

docker run -d --name openvpn-${NAME} --env SERVER=${NAME} --cap-add NET_ADMIN \
 -v $(pwd)/vpn:/etc/vpn \
 -v $(pwd)/passwd/passwd.conf:/etc/vpn/passwd.conf \
 -v /dev/net/tun:/dev/net/tun openvpn:latest
