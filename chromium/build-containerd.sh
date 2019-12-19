#!/bin/bash

docker build . -t chromium --no-cache
docker tag chromium k8s.io/demo/chromium 
docker save k8s.io/demo/chromium -o chromium.tar
sudo ctr -n=k8s.io images import chromium.tar 