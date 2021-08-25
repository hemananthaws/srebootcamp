#!/bin/sh
echo "Please Enter the Cluster Name to create?"
read Name
echo "Please Enter the Zone for Cluster $Name?"
read ZONE
gcloud container clusters create $Name \
        --zone=$ZONE \
        --num-nodes=2 \
        --enable-autoscaling --max-nodes=5 --min-nodes=2 \
        --addons HorizontalPodAutoscaling,HttpLoadBalancing \
        --enable-autorepair \
