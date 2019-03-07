#!/bin/bash

cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d

#is service started, on port 9292 is he?
pu=$(ps aux | grep puma | grep 9292)

if [[ "$pu" == *"reddit"* ]]
then 
echo "Puma deployed and started"
else
echo "Something go wrong"
fi


