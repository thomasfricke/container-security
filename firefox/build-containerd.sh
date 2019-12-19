#!/bin/bash

docker build . -t firefox --no-cache
docker tag firefox k8s.io/demo/firefox 
docker save k8s.io/demo/firefox -o firefox.tar
sudo ctr -n=k8s.io images import firefox.tar 