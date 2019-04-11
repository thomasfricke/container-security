#!/bin/bash

docker run -d --network=container:openvpn --name=qbittorrent -v /media/space/incoming/qBittorrent:/incoming/qbittorrent/.config/qBittorrent qbittorrent
