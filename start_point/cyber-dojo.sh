#! /bin/bash
set -e

cd ${CYBER_DOJO_SANDBOX}

# Currently using /approval in the classpath causes fatal errors such as
# java.nio.file.AccessDeniedException: /approval/zipfstmp5701121991682355433.tmp
# This is because /approval is a read-only file system.
# Working around this for now...
cp -r /approval /tmp
CLASSES=.:`ls /tmp/approval/*.jar | tr '\n' ':'`

if javac --enable-preview \
  --release 14 \
  -Xlint:preview \
  -Xlint:unchecked \
  -Xlint:deprecation \
  -cp $CLASSES \
  *.java;
then
  java --enable-preview -jar /approval/junit-platform-console-standalone-1.6.2.jar \
      --disable-banner \
      --disable-ansi-colors \
      --details=tree \
      --details-theme=ascii \
      --class-path .:$CLASSES \
      --scan-class-path
fi
