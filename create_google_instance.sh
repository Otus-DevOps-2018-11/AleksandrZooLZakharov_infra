#!/bin/bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=f1-micro \
  --preemptible \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=/root/git/otus/AleksandrZooLZakharov_infra/cloud-testapp/start_script.sh
