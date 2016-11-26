#!/bin/bash

export PS1="\[$(tput setaf 2)\][\t][\u@\h \W] \!$\[$(tput sgr0)\] "

display_usage() {
        echo -e "*** SCRIPT to Monitor Buyflow for ORDER FAILURES ***";
        echo -e "[ USAGE ] $0 user";
        echo -e "[ EXAMPLE ] $0 nk15404";
        echo -e "*** Email will be sent with all FAILURES on each HOST ***";
}

if [ $# -le 0 ]; then
        display_usage;
        exit 1;
fi

user=$1;
url_server_list=http://54.254.160.50:8080/audit/aws/elb/vpc-prod-mob-pub;
servers=`lynx -dump -nolist $url_server_list | grep -Eio '30\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}+' | cut -d: -f2`;

mode_scp=$2;
if [ "${mode_scp}" = "mscp" ]; then
	for server in $servers; do
		scp ~/error_finder.sh $user@$server:~
	done
fi

count_servers=($servers)
echo -e "[ Total number of server(s) ] ${#count_servers[@]}\n\n";

echo $servers none | xargs -d" " -P1 -IZZ ssh -oStrictHostKeyChecking=no -oConnectTimeout=10 -q -l $user ZZ "echo -n ZZ && ~/error_finder.sh";

