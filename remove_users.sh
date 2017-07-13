#!/bin/bash -e

. icinga2_env_vars

echo "Removing users"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/users/api_user" | python -m json.tool

sleep 5
