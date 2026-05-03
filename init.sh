#!/bin/bash
kubectl create namespace ns-a
kubectl create namespace ns-b
kubectl create configmap python-app --from-file=app1.py -n ns-a
kubectl create configmap python-app --from-file=app2.py -n ns-b
kubectl create configmap nginx-html --from-file=index.html -n ns-a
kubectl exec -it network-tools -n ns-b -- bash -c "
apt-get update && \
apt-get install -y nmap netcat-openbsd telnet traceroute iputils-ping dnsutils curl wget && \
apt-get clean
"
kubectl apply -f all-pods.yaml
kubectl apply -f services.yaml
