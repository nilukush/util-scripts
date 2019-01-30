#!/usr/local/bin/zsh
pass=$(mvn -ep $1 | sed -e 's#{#\\{#; s#}#\\}#; s/\//\\\//g')
echo "pass : $pass"
path_settings="~/.m2/settings.xml"
sed -i '' -e "s/\<password\>.*\<\/password\>/\<password\>$pass\<\/password\>/g" ~/.m2/settings.xml
rg password ~/.m2/settings.xml
