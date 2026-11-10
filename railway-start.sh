#!/bin/sh
set -e
mkdir -p /data/config /data/db
chown -R newsnest:newsnest /data
exec setpriv --reuid=newsnest --regid=newsnest --init-groups python -m newsnest
