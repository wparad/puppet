#!/bin/bash
IP=`wget -O - -q icanhazip.com`
#echo $IP
FILE="/tmp/ipAddress"
echo "" >> $FILE
#exit 0

if [ "~$IP~" == "~$(cat $FILE | cut -d'~' -f2)~" ]
	then
#echo "~$IP~"
#echo "~$(cat $FILE | cut -d'~' -f2)~"
#echo "MATCH YES"
	exit 0
fi

rm -f $FILE
#echo "NO MATCH"
echo "~$IP~" > $FILE
echo "$IP" | mail -aFrom:wparad@gmail.com -s "Server IP Address" wparad@gmail.com