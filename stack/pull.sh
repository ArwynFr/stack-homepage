#!/bin/bash

STACK_NAME=homepage

git pull
docker-compose pull
docker stack rm "$STACK_NAME"
docker stack deploy --compose-file docker-compose.yml --prune --resolve-image always "$STACK_NAME"