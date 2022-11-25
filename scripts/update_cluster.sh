#!/bin/sh

for d in k8s/projects/*; do
    kubectl apply -f "${d}"
    project_name=$(echo $d | sed -e  s!k8s\/projects\/!!g)
    kubectl rollout restart deployment "${project_name}-deployment" -n local
done

kubectl apply -f k8s/ingress.yaml
