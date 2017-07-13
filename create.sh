#!/bin/bash -e

. icinga2_env_vars

echo "Creating hostgroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/hostgroups/api_dummy_hostgroup" \
     -d '{ "attrs": { "display_name": "api_dummy_hostgroup" } }' | python -m json.tool

echo "Creating hosts"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/hosts/api_dummy_host_1" \
     -d '{ "templates": [ "generic-host" ], "attrs": { "address": "127.0.0.1", "vars.hostgroups": "api_dummy_hostgroup", "groups": ["api_dummy_hostgroup"], "vars.notification[\"mail\"]": { "groups": ["test_api_group"] } } }' | python -m json.tool

echo "Creating services"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/services/api_dummy_host_1!api_dummy_service_1" \
     -d '{ "templates": [ "generic-service" ], "attrs": { "display_name": "api_dummy_service_1", "check_command" : "dns", "vars.dns_lookup": "google-public-dns-a.google.com.", "vars.dns_expected_answer": "8.8.8.8", "host_name": "api_dummy_host_1" } }' | python -m json.tool

echo "Creating usergroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/usergroups/test_api_group" \
     -d '{ "attrs": { "display_name": "test api group" } }' | python -m json.tool

echo "Creating users"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -X PUT \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/users/api_user" \
     -d '{ "templates": [ "generic-user" ], "attrs": { "display_name": "prakash", "email" : "your@email.id", "groups" : ["test_api_group"] } }' | python -m json.tool

sleep 5
