#/bin/bash

ID=$1

aws elasticbeanstalk update-environment --application-name invoicer --environment-id $ID --version-label latest-invoicer  --region us-west-1
