 
#!/bin/sh
export ZONE="us-central1-a"
echo "Please enter instance Name?"
read INSTANCE_NAME
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE --machine-type=e2-medium --subnet=default \
        --tags=http-server,https-server \
        --image=centos-7-v20210817 --image-project=centos-cloud \
        --boot-disk-size=20GB --boot-disk-type=pd-balanced \
        --boot-disk-device-name=$INSTANCE_NAME
~                                                                         
~                                                   
