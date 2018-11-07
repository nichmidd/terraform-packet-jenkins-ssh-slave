#!/bin/bash
build_version=`cat build_version`
while [ ! -f /usr/local/bin/packer ]
do
  sleep 60
done
packer build ubuntu.json
