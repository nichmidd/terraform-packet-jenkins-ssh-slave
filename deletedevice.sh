#!/bin/bash
project_id=`cat project_id.txt`
terraform destroy -var "project_id=${project_id}" -var "auth_token=${PACKET_AUTH_TOKEN}" -var "hostname=${BUILD_TAG}" -auto-approve
