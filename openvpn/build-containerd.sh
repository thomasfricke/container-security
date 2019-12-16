#!/bin/bash

docker build . -t openvpn --no-cache
docker tag openvpn k8s.io/demo/openvpn 
docker save k8s.io/demo/openvpn -o openvpn.tar
sudo ctr -n=k8s.io images import openvpn.tar 