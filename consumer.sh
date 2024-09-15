#!/bin/bash

/opt/kafka/bin/kafka-console-consumer.sh \
      --consumer.config client.properties \
      --bootstrap-server pkc-n3603.us-central1.gcp.confluent.cloud:9092 \
      --topic gondorbeacons \
      --from-beginning \
      --property "print.key=true" \
      --property "key.separator=:" | while IFS=: read -r key message
do
  if [ "$key" == "beacon7" ]; then
    echo "And Rohan will answer!"
  else
    echo "Received message from $key"
  fi
done

