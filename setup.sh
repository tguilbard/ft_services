#!/bin/bash

services="nginx ftps wordpress phpmyadmin mysql" # | | | | | influxdb grafana
GREEN="\e[32m\e[1m"
DEFAULT="\e[0m"
ft_set_service()
{
	for service in $services
	do
		echo -e "${GREEN}Building $service${DEFAULT}"
		docker build -t image-$service srcs/$service | grep Step
	    kubectl apply -f srcs/$service/deployement-$service.yaml > /dev/null
		echo -e "${GREEN}$service is set${DEFAULT}"
	done
}

# ================================================================

echo -en "\e[35m"; minikube start --driver=docker --cpus=4 --memory=4400 --extra-config=apiserver.service-node-port-range=1-35000
if [[ $? == 0 ]]
then
	eval $(minikube docker-env)
else
	minikube delete
	exit
fi

# ======================================================

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
kubectl apply -f srcs/load_balancer/deployement-metallb.yaml > /dev/null
echo -e "${GREEN}Mettallb installed${DEFAULT}"

# ======================================================
ft_set_service

echo -en "\e[35m"; minikube dashboard
