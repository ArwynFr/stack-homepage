# Bootstraping de l'application

```sh
NAMESPACE=arwynfr
FLUX_PATH=./build/flux/production
GIT_REPO=https://github.com/ArwynFr/stack-homepage

# Création du NS s'il n'existe pas encore
kubectl create ns ${NAMESPACE}

# Création du repo Git
flux create source git homepage --url=${GIT_REPO} --branch=main --namespace=${NAMESPACE}

# Bootstrap du déploiement
flux create kustomization homepage --source=homepage --path="${FLUX_PATH}" --prune=true --interval=5m --namespace=${NAMESPACE}
```