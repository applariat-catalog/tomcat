#! /bin/sh
# appLariat generic tomcat entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

exec catalina.sh run