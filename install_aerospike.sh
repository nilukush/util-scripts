#!/bin/sh

wget -O aerospike.tgz 'http://aerospike.com/download/server/latest/artifact/ubuntu12'
tar -xvf aerospike.tgz
cd aerospike-server-community-*-ubuntu12*
sudo ./asinstall # will install the .rpm packages
sudo service aerospike start && \
sudo tail -f /var/log/aerospike/aerospike.log | grep cake

