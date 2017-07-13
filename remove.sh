#!/bin/bash -e

. icinga2_env_vars

echo "Removing hostgroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/hostgroups/api_dummy_hostgroup?cascade=1" | python -m json.tool

echo "Removing hosts"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/hosts/api_dummy_host_1?cascade=1" | python -m json.tool

echo "Removing services"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/services/api_dummy_host_1!api_dummy_service_1" | python -m json.tool

echo "Removing usergroups"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/usergroups/test_api_groupi?cascade=1" | python -m json.tool

echo "Removing users"

curl -s -u $ICINGA2_API_USER:$ICINGA2_API_PASSWORD  \
     -H 'Accept: application/json' -H 'X-HTTP-Method-Override: DELETE' -X POST \
     -k "https://$ICINGA2_HOST:$ICINGA2_API_PORT/v1/objects/users/api_user" | python -m json.tool

sleep 5
