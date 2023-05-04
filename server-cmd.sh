#!/usr/bin/env bash

export IMAGE=$1 #exports variable to docker compose file defined in jenkinsfile function - shellCmd 
docker-compose -f docker-compose.yaml up --detach
echo "success"