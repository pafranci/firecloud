#!/bin/bash

# TO MULTIPLE NUMBERS
AccessToken=$1
curl -X POST -H "Authorization: Bearer ${AccessToken}" \
  -H "Content-Type: application/json" \
  -d '{
    "to":["'"$2"'"],
    "body":"Test Message"
  }' https://tapi.telstra.com/v2/messages/sms
