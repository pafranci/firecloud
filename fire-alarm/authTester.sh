#!/bin/bash

CLIENT_KEY="Z3KPorb3E9RCZGRQhir29Beov1wpIoXp"
CLIENT_SECRET="C5IFughU2bMB1TG3"

curl -X POST -H 'Content-Type: application/x-www-form-urlencoded' \
-d "grant_type=client_credentials&client_id=${CLIENT_KEY}&client_secret=${CLIENT_SECRET}&scope=NSMS" \
'https://tapi.telstra.com/v2/oauth/token'
