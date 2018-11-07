#!/bin/bash
build_version=`cat build_version`
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/versions \
  --data '{ "version": { "version": "${build_version}" } }'
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/${build_version}/providers \
  --data '{ "provider": { "name": "virtualbox" } }'
response=$(curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/${build_version}/provider/virtualbox/upload)
upload_path=$(echo "$response" | jq .upload_path)
curl $upload_path --request PUT --upload-file virtualbox-1.2.3.box
curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/${build_version}/release \
  --request PUT
