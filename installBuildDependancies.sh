#!/bin/bash
apt-get update -y
apt-get install -y openjdk-8-jre
apt-get install -y linux-headers-amd64 linux-headers-`uname -r` build-essential git zip jq

wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" >> /etc/apt/sources.list
apt update && apt install -y virtualbox-5.2

wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip
unzip packer_1.3.2_linux_amd64.zip
mv packer /usr/local/bin/
rm *.zip
