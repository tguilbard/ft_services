#!/bin/bash

services="nginx" # ftps wordpress phpmyadmin mysql influxdb grafana"

ft_set_service()
{
	for service in $services
	do
		echo "Building $service"
		docker build -t image-$service srcs/$service && kubectl apply -f srcs/$service/deployement-$service.yaml
	done
}

#a modifier
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000

# ======================================================

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/load_balancer/deployement-metallb.yaml

# ======================================================
ft_set_service

minikube addons enable dashboard