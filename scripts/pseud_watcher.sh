#!/bin/sh
while MYRESULT=$(inotifywait -e modify -e create /var/otwarchive-read-only/icons --format %f); do
    /var/otwarchive-read-only/scripts/pseud_icons.sh $MYRESULT
done
