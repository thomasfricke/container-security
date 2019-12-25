#!/bin/bash

docker build . -t cloudbomb --no-cache
docker tag cloudbomb k8s.io/demo/cloudbomb 
docker save k8s.io/demo/cloudbomb -o cloudbomb.tar
sudo ctr -n=k8s.io images import cloudbomb.tar 