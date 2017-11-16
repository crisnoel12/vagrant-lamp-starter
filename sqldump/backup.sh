#!/bin/bash

USER='root'
PASSWORD='password'

# Retrieve all databases from mysql
DBA=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
BACKUPS=()
OUTPUT_FOLDER='/vagrant/sqldump/'

# Store your Databases in BACKUPS array
for i in $DBA; do
    if [[ "$i" != "information_schema" ]] && [[ "$i" != _* ]] && [[ "$i" != "mysql" ]] && [[ "$i" != "performance_schema" ]] && [[ "$i" != "phpmyadmin" ]] && [[ "$i" != "sys" ]] ; then
        BACKUPS+=("$i")
    fi
done

# Dump all databases from BACKUPS
if [ -z "$BACKUPS" ]; then
    echo -e "\e[33;1m--No Databases to Back Up--\e[0m"
else
    echo -e "\e[34;1m--Backing Up Databases--\e[0m"
    for i in $BACKUPS; do
        echo "Dumping database: $i"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $i > $OUTPUT_FOLDER$i.sql
    done
    echo -e "\e[34;1m--Back Up Finished--\e[0m"
fi
