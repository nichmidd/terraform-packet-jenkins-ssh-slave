#!/bin/bash
build_version=`cat build_version`
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/versions \
  --data "{ \"version\": { \"version\": \"$build_version\" } }"
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/$build_version/providers \
  --data '{ "provider": { "name": "virtualbox" } }'
response=$(curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/$build_version/provider/virtualbox/upload)
upload_path=$(echo "$response" | jq .upload_path | sed 's/"//g')
curl $upload_path --request PUT --upload-file box/virtualbox/ubuntu-18.04-$build_version.box
curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/nichmidd/ubuntu-18.04/version/$build_version/release \
  --request PUT
