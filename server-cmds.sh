#!/usr/bin/env bash

#exports variable to docker compose file defined in jenkinsfile function shellCmd 
export IMAGE=$1 
docker-compose -f docker-compose.yaml up --detach
echo "success"