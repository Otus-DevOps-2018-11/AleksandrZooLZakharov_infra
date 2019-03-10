#! /bin/bash 
#
#start services
cd ~
puma --dir /home/avzakharov77/reddit -d > done.txt
echo "puma triggered" >> done.txt

