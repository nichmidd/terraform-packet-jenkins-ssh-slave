#!/bin/bash
build_version=`cat build_version`
/usr/local/bin/packer build ubuntu.json
