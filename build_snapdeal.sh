#!/bin/sh

display_usage() {
        echo -e "*** SCRIPT to build SnapdealMobileWeb ***";
        echo -e "[ USAGE ] $0 path_repo file_pom";
        echo -e "[ EXAMPLE ] $0 gitrepo/Snapdeal pom-mobile.xml";
}

if [ $# -le 1 ]; then
        display_usage;
        exit 1;
fi

pushd .

cd $HOME/Desktop/$1;
if [ $? -ne 0 ]; then
	echo " [ NO such FILE or DIR ] ";
	echo " Please provide a valid REPO PATH. Exiting now !";
	exit 1;
fi

if [ -f $2 ]; then
	if [ "$2" == "pom-mobile.xml" ]; then
		artifact="SnapdealMobileWeb";
	elif [ "$2" == "pom-mobile-dev.xml" ]; then
		artifact="SnapdealMobileWeb";
	fi

	echo " [ BUILDING $artifact - $2 ] ";

	opt_d="-Dmaven.test.skip=true";
	if [ "$3" == "U" ]; then
		opt_mvn="-U -B"
		if [ "$4" == "TR" ]; then
			opt_d=""
		fi
	elif [ "$3" == "TR" ]; then
		opt_d=""
	fi

	mvn clean install $opt_mvn -q -f $2 $opt_d
fi

popd

