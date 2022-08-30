#!/usr/bin/env bash

#-------------------------- IMPLEMENTATION 1 -------------------------- #
# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=dekofi/microservices:v1.0.0
# dockerpath=microservices:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy udacity-microservices --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/udacity-microservices-5c544bc45d-wl6vl --address 127.0.0.1 8000:80


#-------------------------- IMPLEMENTATION (ALTERNATIVE) -------------------------- #

# # Step 1:
# # This is your Docker ID/path
# # dockerpath=<>
# dockerpath=dekofi/microservices:v1.0.0

# # Step 2
# # Run the Docker Hub container with kubernetes
# kubectl create deployment udacity-microservices --image=$dockerpath
# kubectl expose deployment udacity-microservices --type=NodePort --port=80
# kubectl get services udacity-microservices
# minikube service udacity-microservices

# # Step 3:
# # List kubernetes pods
# kubectl get deploy,rs,svc,pods

# # Step 4:
# # Forward the container port to a host
# kubectl port-forward service/udacity-microservices 8000:80
# # kubectl port-forward pod/udacity-microservices-5c544bc45d-wl6vl --address 127.0.0.1 8000:80