#!/bin/sh

url_server_list=http://54.254.160.50:8080/audit/aws/elb/vpc-prod-mob-pub
servers=`lynx -dump -nolist $url_server_list | grep -Eio '[2-5]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}+' | cut -d: -f2`

user=nk15404
echo $servers none | xargs -d" " -P40 -IZZ ssh -oStrictHostKeyChecking=no -oConnectTimeout=5 -q -l $user ZZ "echo -n ZZ && grep -B 100 -A 100 -in --color=always '$1' /apps/msite-web/current/tomcat/logs/*"

