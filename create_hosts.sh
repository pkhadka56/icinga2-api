#!/bin/bash -e

. icinga2_env_vars

echo "Creating hosts"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/hosts/api_dummy_host_1" \
     -d '{ "templates": [ "generic-host" ], "attrs": { "address": "127.0.0.1", "vars.hostgroups": "api_dummy_hostgroup", "groups": ["api_dummy_hostgroup"], "vars.notification[\"mail\"]": { "groups": ["test_api_group"] } } }' | python -m json.tool

sleep 5
