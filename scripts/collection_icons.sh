#!/bin/bash

export SQPROD="/usr/bin/mysql -u root -pH00k3d..F1ct10n --skip-column-names otwarchive_production"

cd /var/otwarchive-read-only/collections/icons/

#The directory name create is the collection.id

MYCOLLECTIONID=$1

echo "select icon_file_name from collections where id = $MYCOLLECTIONID limit 1;" > /tmp/collectioniconname.sql

$SQPROD < /tmp/collectioniconname.sql > /tmp/collectioniconname.txt

if [ -s /tmp/collectioniconname.txt ]
then
	MYICONNAME=`cat /tmp/collectioniconname.txt`
	mkdir -p /var/otwarchive-read-only/public/system/collections/icons/$MYCOLLECTIONID
	mkdir -p /var/otwarchive-read-only/public/system/collections/icons/$MYCOLLECTIONID/standard
	cp $MYCOLLECTIONID/standard.* /var/otwarchive-read-only/public/system/collections/icons/$MYCOLLECTIONID/standard/$MYICONNAME
fi
rm /tmp/collectioniconname.txt /tmp/collectioniconname.sql
