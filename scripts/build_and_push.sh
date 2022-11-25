#!/bin/sh

LOCAL_REGISTRY="localhost:5001"

for d in projects/*; do
    project_name=$(echo $d | sed -e  s!projects\/!!g)
    image_name=$LOCAL_REGISTRY/${project_name}
    docker build --no-cache -t $image_name ./projects/${project_name}
    docker push $image_name
done
