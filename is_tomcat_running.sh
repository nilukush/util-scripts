#!/bin/sh

is_tomcat_running=`ps -aef | grep -inw "tomcat"`;

if [ -n "$is_tomcat_running" ]; then
	echo "yes"
else
	echo "no"
fi

