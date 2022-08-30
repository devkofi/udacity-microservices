[![CircleCI](https://dl.circleci.com/status-badge/img/gh/devkofi/udacity-microservices/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/devkofi/udacity-microservices/tree/master)

---
# PROJECT OVERVIEW

This project applies the skills I have acquired in the course to operationalize a Machine Learning Microservice API. 

A given pre-trained, `sklearn` model to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 

Read more [here](https://www.kaggle.com/c/boston-housing). 

This project tests your ability to operationalize a Python flask app—in a provided file, `app.py` — that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.
<br/><br/>

---

# PROJECT TASKS

The main goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

Find [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project showcases my abilities to operationalize production microservices.**
<br/><br/>

---
# FILES
* Flask app :  `app.py`
* Predict housing prices : `make_prediction.sh`
* Installation Requirements : `requirements.txt`
* Predict Housing Prices with docker : `run_docker.sh`
* Predict Housing Prices with kubernetes : `run_kubernetes`
* Upload Container to Dockerhub : `upload_docker.sh`
<br/><br/>

---
# SETUP THE ENVIRONMENT

### _Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv_. 
<br/>

```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
### _Install Dependencies_ 
```bash
make install
``` 
<br/>

---
# RUNNING `app.py`

### _Standalone_:  
```bash
python app.py
```
<br/>

### _Run in Docker_:  
```bash
./run_docker.sh
```
<br/>

### _Run in Kubernetes_:  
```bash
./run_docker.sh
```
<br/>

---

# KUBERNETES STEPS

### _Setup and Configure Docker locally_
```bash
#Build docker image with tag-name "microservices"
docker build --tag=microservices .

#List all docker images
docker image ls

#Run app on port 8000
docker run -p 127.0.0.1:8000:80 microservices
```
<br/>

### _Setup and Configure Kubernetes locally_
```bash
#Download minikube from source using curl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

#Install minikube into the bin directory
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#Start a local cluster in kubernetes with minikube
minikube start

#Confirm local cluster running
kubectl config view

#Show Kubernetes dashboard
minikube dashboard
```
<br/>

### _Load Image locally (Optional)_
```bash
minikube image load microservices
```

### _Create Flask app in Container_
```bash
#Create a variable. Replace ID with user ID, Path with container path
dockerpath=ID/path:tagname

#Create a container from a docker image using path from above
kubectl create deployment udacity-microservices --image=$dockerpath

#Expose port 80 for HTTP requests
kubectl expose deployment udacity-microservices --type=NodePort --port=80

#Show services by udacity-microservices
kubectl get services udacity-microservices

#Alternatively list using this command
kubectl get deploy,rs,svc,pods

#Start service using minikube
minikube service udacity-microservices`
```
<br/>

### _Run via kubectl_
```bash
#Run app and forward port from container on port 80 to the host on port 8000 
kubectl port-forward service/udacity-microservices 8000:80

```
<br/>

### _Run via kubectl (Alternative approach)_
```bash

# Forward the container port to a host
kubectl port-forward pod/udacity-microservices-5c544bc45d-wl6vl --address 127.0.0.1 8000:80

```
<br/>

### _Stop minikube_
```bash
#Pause and save cluster state
minikube stop
```
<br/>

### _Delete Cluster_
```bash
#Delete kubernetes cluster 
minikube delete
```
<br/>

### _Deleting Deployments_
```bash
#List all deployments
kubectl get deployments --all-namespaces

#Replace NAMESPACE and DEPLOYMENT using details from above
kubectl delete -n NAMESPACE deployment DEPLOYMENT
```
