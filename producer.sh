#!/bin/bash

beacons=(
  "Amon Din"
  "Eilenach"
  "Nardol"
  "Erelas"
  "Min-Rimmon"
  "Calenhad"
  "Halifirien"
)

while true
do
  for i in "${!beacons[@]}"
  do
    key="beacon$((i+1))"
    echo "$key:Sending message from ${beacons[$i]}" | /opt/kafka/bin/kafka-console-producer.sh \
      --producer.config client.properties \
      --bootstrap-server pkc-n3603.us-central1.gcp.confluent.cloud:9092 \
      --topic gondorbeacons \
      --property "parse.key=true" \
      --property "key.separator=:"
    sleep 5
  done
done
