#!/bin/bash
project_id=$(curl -X GET --header 'Accept: application/json' --header "X-Auth-Token: $PACKET_AUTH_TOKEN" 'https://api.packet.net/projects' | jq .projects[0].id)
terraform init
terraform plan -var "project_id=${project_id}" -var "auth_token=${PACKET_AUTH_TOKEN}" -var "hostname=${BUILD_TAG}" -out plan.tfstate
terraform apply plan.tfstate
ip_address=$(terraform output maintenanceaddr)
echo $project_id > project_id.txt
echo $ip_address > ip_address.txt
