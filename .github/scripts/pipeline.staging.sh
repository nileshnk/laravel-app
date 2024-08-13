#!/bin/bash

# update the registry url. This is a local registry used. so need to setup local or third party can be setup.

REGISTRY_URL="127.0.0.1:5555"

push_new_lts() {
    docker image rm "$REGISTRY_URL/$1-$2:latest"
    docker pull "$REGISTRY_URL/$1-$2:latest"
    docker tag "$REGISTRY_URL/$1-$2:latest" "$REGISTRY_URL/$1-$2:lts"
    docker push "$REGISTRY_URL/$1-$2:lts"
}

deploy_service() {
    echo -e "\nDeploying $1..."

    # push new LTS
    # push_new_lts $1 "staging"

    docker build -t "$1-staging" --platform linux/amd64 .
    docker tag "$1-staging:latest" "$REGISTRY_URL/$1-staging:latest"
    docker push "$REGISTRY_URL/$1-staging:latest"

    # run deployment
    kubectl rollout restart deployment "$1-deployment"
}

# Run the migrations first
# artisan migrate

deploy_service laravel-app

