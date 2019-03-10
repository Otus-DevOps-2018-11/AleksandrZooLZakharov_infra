#! /bin/bash 
sudo su -
#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
#install ruby and bundler and mongoDB
apt update
apt install -y ruby-full ruby-bundler build-essential mongodb-org
#start services
systemctl start mongod
systemctl enable mongod
#deploy
cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d

