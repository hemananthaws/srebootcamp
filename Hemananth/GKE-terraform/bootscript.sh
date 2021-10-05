 
#! /bin/bash
export PROJECT_ID='absolute-realm-322617'
gcloud config set project $PROJECT_ID
gcloud config set compute/region us-central1
gcloud container clusters get-credentials my-cluster --zone=us-central1
kubectl apply -f Deployment.yaml
                             
