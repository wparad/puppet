#!/bin/bash

DATE=`date '+%Y-%m-%d.%H%M%S'`.$HOSTNAME.tar.gz
#echo $DATE

tar -czf /SQL-DB/backup/$DATE /SQL-DB/mysql

#sudo mkdir /SQL-DB/$DATE.$HOSTNAME
#sudo mysqlhotcopy -u warren -p password DENTAL_DB_V1 /SQL-DB/$DATE.$HOSTNAME
