#!/bin/sh

for d in k8s/projects/*; do
    project_name=$(echo $d | sed -e  s!k8s\/projects\/!!g)
    kubectl apply -f "${d}"
    kubectl rollout restart deployment "${project_name}-deployment"
    echo "$project_name"
done

kubectl apply -f k8s/ingress.yaml
