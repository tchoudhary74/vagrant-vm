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
   yum -y install epel-release
   yum -y install ansible
   ## TODO
fi
cp -a /vagrant/pre-req.yml /home/vagrant
chown -R vagrant:vagrant /home/vagrant

ansible-galaxy install -r /home/vagrant/pre-req.yml
