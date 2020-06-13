#!/bin/bash
# 1. service was deployed to OpenShift Container Platform
# 2. route was exposed

IMAGE=${1:-https://i.imgur.com/jD2hDMc.jpg}
URL=$(oc get routes image-classifier -o jsonpath='{@.spec.host}' -n image-classifier)

echo "1:$1"

curl -X POST -d '{"url": "'$IMAGE'"}' -H 'Content-Type: application/json' http://$URL/predict
