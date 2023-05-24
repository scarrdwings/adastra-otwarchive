#!/bin/bash

export SQPROD="/usr/bin/mysql -u root -pH00k3d..F1ct10n --skip-column-names otwarchive_production"

cd /var/otwarchive-read-only/icons/

#The directory name create is the pseud.id

MYPSEUD=$1
MYPADDEDPSEUD=`printf "%09d\n" $MYPSEUD`
MYFIRSTTHREE=`echo $MYPADDEDPSEUD | cut -c1-3`
MYSECONDTHREE=`echo $MYPADDEDPSEUD | cut -c4-6`
MYTHIRDTHREE=`echo $MYPADDEDPSEUD | cut -c7-9`

echo "select icon_file_name from pseuds where id = $MYPSEUD limit 1;" > iconname.sql

$SQPROD < iconname.sql > iconname.txt

if [ -s iconname.txt ]
then
	cat iconname.txt
	MYICONNAME=`cat iconname.txt`
	mkdir -p /var/otwarchive-read-only/public/system/pseuds/icons/$MYFIRSTTHREE
	mkdir -p /var/otwarchive-read-only/public/system/pseuds/icons/$MYFIRSTTHREE/$MYSECONDTHREE
	mkdir -p /var/otwarchive-read-only/public/system/pseuds/icons/$MYFIRSTTHREE/$MYSECONDTHREE/$MYTHIRDTHREE
	mkdir -p /var/otwarchive-read-only/public/system/pseuds/icons/$MYFIRSTTHREE/$MYSECONDTHREE/$MYTHIRDTHREE/standard
	cp $MYPSEUD/standard.* /var/otwarchive-read-only/public/system/pseuds/icons/$MYFIRSTTHREE/$MYSECONDTHREE/$MYTHIRDTHREE/standard/$MYICONNAME
fi
rm iconname.txt iconname.sql
