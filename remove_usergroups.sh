#!/bin/bash -e

. icinga2_env_vars

echo "Removing usergroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/usergroups/test_api_groupi?cascade=1" | python -m json.tool

sleep 5
