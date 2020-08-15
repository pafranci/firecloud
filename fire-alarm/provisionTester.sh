#!/bin/bash

ACCESS_TOKEN=$1

curl -X POST \
https://tapi.telstra.com/v2/messages/provisioning/subscriptions \
-H "authorization: Bearer ${ACCESS_TOKEN}" \
-H 'cache-control: no-cache' \
-H 'content-type: application/json' \
-d '{}'
