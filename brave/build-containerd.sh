#!/bin/bash

docker build . -t brave --no-cache
docker tag brave k8s.io/demo/brave 
docker save k8s.io/demo/brave -o brave.tar
sudo ctr -n=k8s.io images import brave.tar 