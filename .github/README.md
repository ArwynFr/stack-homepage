# homepage

[![GitHub Actions](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Farwynfr%2Fhomepage%2Fbadge)](https://actions-badge.atrox.dev/arwynfr/homepage/goto)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f6e55299939544fd9350d06c96557d9b)](https://www.codacy.com/manual/ArwynFr/homepage?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ArwynFr/homepage&amp;utm_campaign=Badge_Grade)

## What is this repository about

This projects is the source for <https://www.arwyn.fr>

## Rules and standards

This project is licensed under [MIT License](/LICENSE)

## How it works

This project was also a way for me to try out advanced github features :
*   Github Actions are triggerd on push / master
*   The workflow uses [actions-docker-context](https://github.com/ArwynFr/actions-docker-context) to create a Docker context to my personal server
*   It builds the [Dockerfile](/src/Dockerfile) into an image and push it to Github Packages
*   The project's [Docker stack file](/stack/docker-compose.yml) is deployed remotley using the Docker context
*   The image is pulled from Github Packages
*   The stack is deployed on the local swarm behind a traefik reverse

The traefik configuration is beyond the scope of this repository.

## How to contribute

This project is not expecting any external contributions.
