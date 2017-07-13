#!/bin/bash -e

. icinga2_env_vars

echo "Creating users"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/users/api_user" \
     -d '{ "templates": [ "generic-user" ], "attrs": { "display_name": "prakash", "email" : "your@email.id", "groups" : ["test_api_group"] } }' | python -m json.tool

sleep 5
