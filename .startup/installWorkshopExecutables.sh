#!/bin/bash

# Download and install executables created for the workshop

# If we are on node0, install executables

echo "Starting Workshop Executables installation..."

if [ `hostname` == 'node0' ]
then
  echo "Downloading Event Generator..."
  curl -o executables/kafka-event-generator-1.0-SNAPSHOT-jar-with-dependencies.jar 'http://billkellett.net/dse/kafka-event-generator-1.0-SNAPSHOT-jar-with-dependencies.jar' -L   
  echo "... Event Generator download complete."
  
  echo "Downloading Standalone Event Consumer..."
  curl -o executables/datastax-spark-streaming-jar-with-dependencies.jar 'http://billkellett.net/dse/datastax-spark-streaming-jar-with-dependencies.jar' -L   
  echo "... Standalone Event Consumer download complete."
  
  echo "Downloading DSE Event Consumer..."
  curl -o executables/datastax-spark-streaming-dse-jar-with-dependencies.jar 'http://billkellett.net/dse/datastax-spark-streaming-dse-jar-with-dependencies.jar' -L   
  echo "... DSE Event Consumer download complete."
  
fi
echo "... Finished Workshop Executables Installation."
