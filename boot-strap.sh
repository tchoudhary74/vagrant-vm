#!/usr/bin/env bash

OS_VER(){
    if [[ -e /etc/redhat-release ]]
    then
      echo "$(cat /etc/redhat-release | awk '{print $1}')"
    elif [[ -e /usr/bin/lsb_release ]]
    then
      echo "$(cat /etc/issue | head -n +1 | awk '{print $1}')"
    elif [[ -e /etc/issue ]]
    then
      echo "$(cat /etc/issue)"
    else
      echo "$(cat /proc/version)"
    fi
    }
shopt -s nocasematch
# install ansible (http://docs.ansible.com/intro_installation.html)
if [[ $(OS_VER) == ubuntu ]]
 then
    apt-get -y install software-properties-common
    apt-add-repository -y ppa:ansible/ansible
    apt-get update
    apt-get -y install ansible
elif [[ $(OS_VER) == centos ]]
 then
   sudo yum -y install epel-release
   sudo yum -y install ansible
   sudo yum -y install unzip
   cd /tmp/
   curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
   unzip awscli-bundle.zip
   sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/bin/aws
   ## TODO
fi
