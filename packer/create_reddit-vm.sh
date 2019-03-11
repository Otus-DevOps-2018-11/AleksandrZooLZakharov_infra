#!/bin/bash
gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --image-project=affable-heading-227622 \
  --machine-type=f1-micro \
  --preemptible \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=./start_script_full.sh

