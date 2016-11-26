#!/bin/sh

pids_tomcat=`ps -aef | grep -inw "tomcat" | grep -v grep | awk '{ print $2 }'`

for pid_tomcat in $pids_tomcat
do
	sudo kill -9 $pid_tomcat
done

