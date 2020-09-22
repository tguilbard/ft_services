#!/bin/bash

services="nginx ftps wordpress phpmyadmin mysql influxdb grafana"

ft_set_service()
{
	for service in $services
	do
		echo "Building $service"
		docker build -t image-$service srcs/$service && kubectl apply -f srcs/$service/deployement-$service.yaml
	done
}

ft_set_service