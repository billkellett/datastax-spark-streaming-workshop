#!/bin/bash

# Download and install executables created for the workshop

# If we are on node0, install executables

echo "Starting Workshop Executables installation..."

if [ `hostname` == 'node0' ]
then
  echo "Downloading Event Generator..."
  curl -o data/kafka-event-generator-1.0-SNAPSHOT-jar-with-dependencies.jar 'http://billkellett.net/dse/kafka-event-generator-1.0-SNAPSHOT-jar-with-dependencies.jar' -L   
  echo "... Event Generator download complete."
fi
echo "... Finished Kafka Installation."
