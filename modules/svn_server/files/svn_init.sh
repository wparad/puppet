#!/bin/bash
### BEGIN INIT INFO
# Provides:          subversion
# Required-Start:    $local_fs $network $remote_fs
# Required-Stop:     $local_fs $network $remote_fs
# Should-Start:      $all
# Should-Stop:       $all
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: svn subversion secure server
### END INIT INFO

#This script it to run the svnserver
#COMMAND=$0
#JOB = $1
#echo "$JOB"
#echo "$COMMAND"
#PID=$(status "$JOB" 2>/dev/null | awk '/[0-9]$/ { print $NF }')
#echo "$PID"
#echo "NO PID"
case "$1" in
        'start')
                svnserve -d --listen-port 58110 -r /home/svn
                ;;
        'stop')
                ps -ef | grep 'svnserve -d' | grep -v 'grep'
                ;;
esac

exit 0
