#!/bin/bash

# Abort if another instance is already running.
if [ -e /dev/shm/in_use.pid ]; then
  read PID < /dev/shm/in_use.pid
  if kill -0 $PID > /dev/null 2>&1; then
    echo >&2 "already running. aborting."
    exit 1
  fi
fi
echo $$ > /dev/shm/in_use.pid

# Initially set the status to idle.
echo "false" > /dev/shm/in_use

# Consider computer idle after 5 minutes.
TIMEOUT=300000

while true; do
  if [ `xprintidle` -lt $TIMEOUT ]; then
    IN_USE=true
  else
    IN_USE=false
  fi

  if [ `cat /dev/shm/in_use` != $IN_USE ]; then
    echo $IN_USE > /dev/shm/in_use
    curl --header "Content-Type: application/json" --request POST --data '{"in_use": '$IN_USE'}' http://homeassistant.lan:8123/api/webhook/3bf1065d-821b-4e94-87a6-79f0093a7eff
  fi

  sleep 0.2
done
