# homepage

[![GitHub Actions](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Farwynfr%2Fhomepage%2Fbadge)](https://actions-badge.atrox.dev/arwynfr/homepage/goto)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/aa07f8b632df461d875388e6ea429d07)](https://www.codacy.com/gh/ArwynFr/stack-homepage/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ArwynFr/stack-homepage&amp;utm_campaign=Badge_Grade)

## What is this repository about

This projects is the source for <https://www.arwyn.fr>

## Rules and standards

This project is licensed under [MIT License](/LICENSE)

## How it works

This project is a way for me to try out advanced development concepts.

The initial idea was to test devops principles using docker swarm as the infrastructure backend, behind a traefik instance. The principles were achieved by maintaining together (in the same repo) the sources for application (docker image) and infrastructure (docker stack). The project used github actions to build docker image, and deploy the stack on a swarm. It worked well but needed a lot secrets handling, especially SSH key exchange and docker context configuration.

I had to develop a Github Action to help me on that journey : [actions-docker-context](https://github.com/ArwynFr/actions-docker-context)

Then, I was asked by a customer about how to secure their CICD process, as they were concerned about granting privileges on their production environment to the software factory. I was considering a study of push vs pull CICD process on the internet but I found few if any example of pull CICD of docker swarm stacks. This led me into trying a pull approach on my own CICD to better grasp the pros and cons because there is few examples of pull deployments of docker stacks.

The first part was to write [a pull script](/stack/pull.sh) to run on the production environment, which proved quite trivial to write. Then I removed the push part of the CICD. A lot of secrets ended up as read-only files or environment variables on the production environment, which made the deployment a LOT safer. An unexpected benefit, since the application has low dev activity, was a LOT more production deployment. This led to easier CICD fixing when something wrong happened. The price to these benefits was deployment delay. Pulls are run on a daily basis, which means up-to 24 hours between PR merge and production deployment.

Unfortunately, since stack and image sources were on the same repository, it led me into cloning the whole depot on the production environment, which proved quite cubersome. The solution was to move the stack part in a separate repo, but I was concerned about spliting again "dev and ops". So I decided to use a git submodule for the stack part, which allows both :
*   modifying both app and stack from the current "full" repo
*   cloning only the stack part from the production environment

The build process is now :
*   Github Actions are triggerd on push / master
*   The workflow builds the [Dockerfile](/src/Dockerfile) into an image and push it to Github Packages
*   The [stack repository](https://github.com/arwynfr/homepage-stack) is pulled periodically on the swarm node
*   The docker engine pulls the website image from Github Packages
*   The stack is deployed on the local swarm behind a traefik reverse

The next step of the project is to overcome the deployment delay by a notifiable pull system.

## How to contribute

This project is not expecting any external contributions.
