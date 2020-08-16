#!/bin/bash

# TO MULTIPLE NUMBERS
AccessToken=$1
curl -X POST -H "Authorization: Bearer ${AccessToken}" \
  -H "Content-Type: application/json" \
  -d '{
    "to":["'"$2"'"],
    "body":"'"Location: Blue Mountains\n\nAlert Level: EMERGENCY WARNING\n\nInstructions: You are in danger and need to take immediate action to survive. There is a threat to lives or homes."'"
  }' https://tapi.telstra.com/v2/messages/sms
