#!/bin/bash

yes | docker system prune
minikube delete
> log
