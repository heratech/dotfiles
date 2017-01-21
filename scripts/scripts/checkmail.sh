#!/bin/sh
mbsync wiseserve-quick >> ~/scripts/log.txt
notmuch new >> ~/scripts/log.txt
afew --tag --new >> ~/scripts/log.txt
