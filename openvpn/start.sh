#!/bin/bash

[ "$1" == "-x" ] && set -x && shift

TARGET=${1:-se43.nordvpn.com.udp.ovpn}
NAME=${2:-${TARGET}}


docker run -d --name ${NAME} --cap-add NET_ADMIN \
 -v $(pwd)/vpn:/etc/vpn \
 -v $(pwd)/passwd/passwd.conf:/etc/vpn/passwd.conf \
 -v /dev/net/tun:/dev/net/tun openvpn:v2 ${TARGET}
