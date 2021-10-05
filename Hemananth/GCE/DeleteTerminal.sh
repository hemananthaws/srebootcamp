 
#!/bin/bash
echo "Please enter Name of the Instance to Delete:"
read Instance
InstancePresent=0
for name in $(gcloud compute instances list --format="value(NAME)")
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
#  if [ "${confirm^}" == "Y" ]
#  then
echo "Please enter Zone of $Instance?"
read ZONE
    gcloud compute instances delete $Instance --zone=$ZONE
    echo "$Instancee Deleted!"
#  fi    
else
  echo "Instance Name not found!"       
fi
