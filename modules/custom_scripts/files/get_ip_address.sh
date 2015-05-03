#!/bin/bash
IP=`wget -O - -q icanhazip.com`
FILE="/tmp/ipAddress"
echo "" >> $FILE

[ "~$IP~" == "~$(cat $FILE | cut -d'~' -f2)~" ] && exit 0

rm -f $FILE

SUBJECT="`hostname` Server IP Address"
echo "~$IP~" > $FILE
echo "$IP `/sbin/ifconfig`" | mail -aFrom:wparad@gmail.com -s "$SUBJECT" wparad@gmail.com

exit 0
