#! /bin/bash
  
yum update

yum install -y yum-utils

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

yum -y install terraform

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker

sudo su

docker pull gcr.io/absolute-realm-322617/sreflaskapp

docker run -dp 9090:80 gcr.io/absolute-realm-322617/sreflaskapp
 
