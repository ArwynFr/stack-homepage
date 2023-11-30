# Homepage

[![GitHub Actions](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Farwynfr%2Fhomepage%2Fbadge)](https://actions-badge.atrox.dev/arwynfr/homepage/goto)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/57151d564ff64ab4852a45be92a2c6f9)](https://app.codacy.com/gh/ArwynFr/homepage?utm_source=github.com&utm_medium=referral&utm_content=ArwynFr/homepage&utm_campaign=Badge_Grade_Settings)

## What is this repository about

This projects is the source for <https://www.arwyn.fr>

It is a way for me to try out advanced CI/CD concepts.
It has gone through multiple refactorings with very different solutions.
The build process is now the following :

- Changes are pushed on main (either by me or by renovate)
- Github Actions are triggerd whenever the sources are modified
- A Github hosted agent builds the [Dockerfile](/src/Dockerfile) into an image and pushes to Github Packages
- A self-hosted  agent clones the kubernetes resources and applies them to the local cluster

Also, if needed:

- Cert-manager fetches a TLS cert from Let's Encrypt
- External-DNS creates a DNS entry

This approach is better than push because GitHub has no access to production credentials. It is also better than pull because you don't waste resources polling the repository for changes / diff.

## How to contribute

This project is not expecting any external contributions.
