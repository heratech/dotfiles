#!/bin/sh
mbsync -Va >> ~/scripts/log.txt
notmuch new >> ~/scripts/log.txt
afew --tag --new >> ~/scripts/log.txt
