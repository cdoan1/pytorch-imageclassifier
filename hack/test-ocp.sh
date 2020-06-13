#!/bin/bash
# 1. service was deployed to OpenShift Container Platform
# 2. route was exposed

URL=$(oc get routes image-classifier -o jsonpath='{@.spec.host}' -n image-classifier)
curl -X POST -d '{"url": "https://i.imgur.com/jD2hDMc.jpg"}' -H 'Content-Type: application/json' http://$URL/predict
