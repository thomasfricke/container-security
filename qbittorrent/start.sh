#!/bin/bash

LOCAL=${1}

docker run -d --network=container:openvpn-${LOCAL} --name=qbittorrent -v /media/space/incoming/qBittorrent:/incoming/qbittorrent/.config/qBittorrent qbittorrent
