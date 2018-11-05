#!/bin/bash
project_id=$(curl -X GET --header 'Accept: application/json' --header "X-Auth-Token: $PACKET_AUTH_TOKEN" 'https://api.packet.net/projects' | jq .projects[0].id)
terraform init
terraform plan -var "project_id=${project_id}" -var "auth_token=${PACKET_AUTH_TOKEN}" -out plan.tfstate
terraform apply plan.tfstate
export ip_address=$(terraform output maintenanceaddr)
ssh root@$ip_address -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null 'hostname && uname -a'
