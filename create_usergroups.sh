#!/bin/bash -e

. icinga2_env_vars

echo "Creating usergroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/usergroups/test_api_group" \
     -d '{ "attrs": { "display_name": "test api group" } }' | python -m json.tool

sleep 5
