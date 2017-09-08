#!/bin/bash

# Setup environment
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Parameters
region=$1
name_tag=$2

# Get instance id by tag "Name", value = $name_tag
instanceId=`aws ec2 describe-instances --region $region --filters "Name=tag:Name,Values=$name_tag" \
    --output text --query 'Reservations[*].Instances[*].InstanceId'`

if [ -z "$instanceId" ]; then
    echo "Could not find instance with tag \"Name\" and value $name_tag"
else
    echo "Instance Id: $instanceId"
fi



