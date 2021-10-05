#!/bin/sh
echo "Please Enter the Cluster Name to create?"
read Name
gcloud container clusters create $Name \
        --zone=us-central1-a \
        --num-nodes=2 \
        --enable-autoscaling --max-nodes=5 --min-nodes=2 \
        --addons HorizontalPodAutoscaling,HttpLoadBalancing \
        --enable-autorepair \
kubectl apply -f Deployment.yaml

