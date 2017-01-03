#!/bin/sh

STATE=`nmcli networking connectivity`

if [ $STATE = 'full' ]
then
		mbsync -Va >> /home/sham/scripts/log.txt
		notmuch --config="/home/sham/.notmuch-config-gmail" new >> /home/sham/scripts/log.txt
		notmuch --config="/home/sham/.notmuch-config-work" new >> /home/sham/scripts/log.txt

		exit 0
fi
echo "No internet connection."
exit 0
