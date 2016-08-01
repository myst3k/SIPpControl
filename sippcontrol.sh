#!/usr/bin/env bash

SLEEP=60;
GAP=300;

while true;
do
  echo "Starting increase in call rate..."
  for i in $(seq 1 1 10);
  do
    echo "Setting call rate to: $i"
    echo "cset rate $i" >/dev/udp/127.0.0.1/8888
    echo "Sleeping for $SLEEP seconds..."
    sleep $SLEEP
  done

  echo "Waiting $GAP seconds before decreasing call rate..."
  sleep $GAP

  echo "Starting decrease in call rate..."
  for i in $(seq 9 -1 1);
  do
    echo "Setting call rate to: $i"
    echo "cset rate $i" >/dev/udp/127.0.0.1/8888
    echo "Sleeping for $SLEEP seconds..."
    sleep 60
  done
done
