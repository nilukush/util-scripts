#!/bin/sh

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

pushd .

RED='\033[0;31m'
NC='\033[0m' # No Color
display_usage() {
        echo -e "$RED*** SCRIPT to deploy application ***$NC";
        echo -e "$RED[ USAGE ] $0 path_repo file_pom$NC";
        echo -e "$RED[ EXAMPLE ] $0 gitrepo/Snapdeal pom-mobile.xml$NC";
}

if [ $# -le 1 ]; then
        display_usage;
        exit 1;
fi

GREEN='\033[0;32m'
if [ -f ~/is_tomcat_running.sh ]; then
	is_tomcat_running=`~/is_tomcat_running.sh`

	if [ "yes" == "$is_tomcat_running" ]; then
		echo -e " $GREEN[ KILLING running TOMCAT ]$NC ";

		~/tomcat_shutdown.sh
		if [ $? -eq 0 ]; then
			echo -e " $GREEN[ KILLED running TOMCAT ]$NC ";
		fi
	fi
fi

cd $HOME/Desktop/$1;
if [ $? -ne 0 ]; then
	echo " $RED[ NO such FILE or DIR ]$NC "
	echo " ${RED}Please provide a valid REPO PATH. Exiting now !$NC"
	exit 1
fi

git pull; rm -fr $HOME/Desktop/tomcat_snapdeal/webapps/ROOT 2>&1;
if [ -f $2 ]; then
	if [ "$2" == "pom-mobile.xml" ]; then
        	artifact="SnapdealMobileWeb";
	elif [ "$2" == "pom-mobile-dev.xml" ]; then
        	artifact="SnapdealMobileWeb"
	fi

	echo -e " $GREEN[ BUILDING $artifact - $2 ]$NC ";
	mvn clean install -q -f $2 -Dmaven.test.skip=true 2>&1;
	if [ $? -eq 0 ]; then
		tomcat_snapdeal; rm ./logs/*;
		echo -e " $GREEN[ DEPLOYING $artifact ]$NC "
		./bin/startup.sh && tail -F logs/server.log;
	else echo -e " $RED[ BUILD FAILED / STOPPED ]$NC ";
	fi
fi

popd

