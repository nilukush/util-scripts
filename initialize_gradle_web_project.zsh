#!/bin/sh

display_usage() {
  echo "*** SCRIPT to initialize a Gradle Web Project (GWP) ***";
  echo "*** By default, the following dependencies are part of this Gradle Web Project : ***";
  echo "***     Web      ***";
  echo "***     MySQL    ***";
  echo "***     RSocket  ***";
  echo "***     Lombok   ***";
  echo "[USAGE] $0 <comma separated list of dependencies> <application_name> <artifact_id> <group_id> <name> <package_name>";
  echo "[EXAMPLE] $0 liquibase MufoDatabaseApplication mufo_database com.mufo mufo_database com.mufo.mufo_database";
}

if [ $# -le 0 ]; then
        display_usage;
        exit 1;
fi

curl -G https://start.spring.io/starter.tgz -d dependencies=web,mysql,rsocket,lombok,$1 -d type=gradle-project -d applicationName='$2' -d artifactId='$3' -d groupId='$4' -d name='$5' -d packageName='$6' -dbaseDir=. | tar -xzvf -
