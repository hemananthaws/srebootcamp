#!/bin/bash
echo "Please enter Cluster Name to Delete:"
read Instance
InstancePresent=0
for name in $(gcloud container clusters list --format="value(NAME)")
do
  if [ $name == $Instance ]
  then
    InstancePresent=1
  fi
done
if [ $InstancePresent == 1 ]
then
#  echo "are you sure want to delete $name? (Y/N)"
#  read confirm
 # if [ "${confirm^}" == "Y" ]
 # then
    echo "please enter the region of the cluster?"
    read region
    gcloud container clusters delete $name --region=$region
    echo "$name Deleted!"
 # fi
else
  echo "Cluster Name not found!"       
fi
