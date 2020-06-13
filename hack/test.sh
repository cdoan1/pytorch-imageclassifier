#!/bin/bash

# for routes
URL=$(oc get routes image-classifier -o jsonpath='{@.spec.host}')

curl -X POST -d '{"url": "https://i.imgur.com/jD2hDMc.jpg"}' -H 'Content-Type: application/json' http://$URL/predict
