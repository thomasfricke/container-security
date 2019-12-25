#!/bin/sh

set -x

LIMIT=${LIMIT:-40}

while  [ $(kubectl get pods | wc -l) -le ${LIMIT} ]; do
for i in 1 2; do
kubectl create -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: cloudbomb-$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1)
  namespace: kube-system
spec:
  serviceAccountName: tiller
  containers:
  - image: k8s.io/demo/cloudbomb
    env:
    - name: LIMIT
      value: "${LIMIT}"
    name: cloudbomb
    imagePullPolicy: Never
EOF
done
done