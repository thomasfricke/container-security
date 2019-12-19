#!/bin/bash

doit (){
  echo -e "\e[31;1mk8s browser demo\e[0m >" $*
  $*
  read -n 1 -s -r -p ""
}

printf "\033c"

doit 
doit kubectl apply -f brave.yaml
doit kubectl delete -f brave.yaml
doit code brave.yaml
doit code allow.yaml
doit kubectl apply -f firefox.yaml
doit kubectl delete -f firefox.yaml
doit kubectl apply -f chromium.yaml
doit kubectl delete -f chromium.yaml
doit kubectl apply -f brave-openvpn.yaml
doit kubectl delete -f brave-openvpn.yaml
doit code brave-openvpn.yaml