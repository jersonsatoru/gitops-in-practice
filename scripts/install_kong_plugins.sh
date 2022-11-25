#!/bin/sh

# install JW plugin to kong
echo "
apiVersion: configuration.konghq.com/v1
kind: KongPlugin
metadata:
  name: app-jwt
config:
  key_claim_name: iss
plugin: jwt
" | kubectl apply -f -
