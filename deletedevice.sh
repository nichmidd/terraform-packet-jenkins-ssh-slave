#!/bin/bash
#project_id=$(curl -X GET --header 'Accept: application/json' --header "X-Auth-Token: $PACKET_AUTH_TOKEN" 'https://api.packet.net/projects' | jq .projects[0].id)
terraform destroy -var "project_id=${project_id}" -var "auth_token=${PACKET_AUTH_TOKEN}" -var "hostname=${BUILD_TAG}" -auto-approve
