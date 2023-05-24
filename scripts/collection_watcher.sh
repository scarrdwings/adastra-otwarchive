#!/bin/sh
while MYRESULT=$(inotifywait -e modify -e create /var/otwarchive-read-only/collections/icons --format %f); do
    /var/otwarchive-read-only/scripts/collection_icons.sh $MYRESULT
done
