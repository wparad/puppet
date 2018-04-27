#!/bin/bash
# Make sure we are root
if [ "$(id -u)" != "0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  exit 0
fi

ps -ef | grep '/usr/bin/X' | grep -v grep | tr -s ' ' | cut -d' ' -f2 | xargs kill
/usr/bin/X :0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
