#!/bin/bash
#
# Halts a running container
#
# Triggers a 'halt' in the machine, then waits for the init process to be the
# only one left, then runs lxc-stop. There is a configurable timeout length for
# if containers are taking too long to shutdown.

# Default command for halting the container
SHUTDOWN_CMD="ssh [container] halt"

# Default timeout for container shutdown
TIMEOUT=30


# No user configuration beyond this point


[ -f /etc/default/lxc ] && . /etc/default/lxc

if [ "$(id -u)" != "0" ]; then
echo "This script should be run as 'root'"
    exit 1
fi

while getopts "n:h:" flag
do
case $flag in
        h) HOST="$OPTARG" ;;
        n) CONTAINER="$OPTARG" ;;
        *) echo "Unknown flag: $flag"; exit 1; ;;
    esac
done

if [ -z "$CONTAINER" ]; then
echo "lxc-halt: missing container name, use -n option"
echo "          if container name cannot be resolved, use -h IP to specify IP of container too"
    exit 1
fi

if [ `lxc-info -n $CONTAINER |grep RUNNING |wc -l` -ne 1 ]
then
        echo "lxc-halt: container $CONTAINER does not exist or is already stopped"
        exit 1
fi

if [ ! -z "$HOST" ]
then
        cmd="${SHUTDOWN_CMD//\[container\]/$HOST}"
else
        cmd="${SHUTDOWN_CMD//\[container\]/$CONTAINER}"
fi
echo $cmd
    ( $cmd )
echo -n "lxc-halt: Waiting for container to stop..."
    starttime=$(date "+%s")
    while true
do
count=$(lxc-ps --lxc -n $CONTAINER ax | grep "^$CONTAINER " | wc -l)
        if [ $count = 1 ]; then
lxc-stop -n $CONTAINER
        echo "STOPPED"
            exit 0
        fi
sleep .25

        curtime=$(date "+%s")

        if [ $(( $curtime - $starttime )) -gt $TIMEOUT ]; then
echo -e "\nContainer has been stopping for longer than $TIMEOUT seconds, forcing shutdown"
            lxc-stop -n $CONTAINER
        echo "STOPPED"
            exit 0
        fi
done

