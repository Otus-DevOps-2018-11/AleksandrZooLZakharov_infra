#!/bin/bash



#package is already installed?
num=0
mon=$(dpkg --get-selections mongodb-org | grep install)


if [[ "$mon" == *"install"* ]]
then 
echo "MongoDB already installed"
else 
#if package missing - install him
echo "installing MongoDB.."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
echo "One more sec..."
sudo systemctl start mongod
sudo systemctl enable mongod
echo "Done install, checking.."
vari=$(sudo systemctl status mongod | grep "active (running)")
if [[ "$vari" == *"running"* ]]
then
echo "Ok, it normally works"
fi

fi

