#!/bin/bash

# Download and install Kafka 2.12-2.2.0 from billkellett.net

# If we are on node0, install and configure Kafka

echo "Starting Kafka installation..."

if [ `hostname` == 'node0' ]
then
  echo "Downloading Kafka..."
  curl -o kafka_2.12-2.2.0.tgz 'http://billkellett.net/dse/kafka_2.12-2.2.0.tgz' -L   
  echo "... Kafka download complete."

  echo "Untar Kafka..."
  tar -zxf kafka_2.12-2.2.0.tgz
  echo "... Kafka untar complete."

  echo "Start Zookeeper..."
  cd /tmp/datastax-spark-streaming-workshop/kafka_2.12-2.2.0/bin
  ./zookeeper-server-start.sh ../config/zookeeper.properties &
  sleep 15
  echo "... Zookeeper started."

  echo "Start Kafka..."
  cd /tmp/datastax-spark-streaming-workshop/kafka_2.12-2.2.0/bin
  ./kafka-server-start.sh ../config/server.properties &
  sleep 15
  echo "... Kafka started."

  echo "Configure Kafka..."
  cd /tmp/datastax-spark-streaming-workshop/kafka_2.12-2.2.0/bin
  ./kafka-topics.sh --create --bootstrap-server node0:9092 --replication-factor 1 --partitions 1 --topic rating_modifiers
  ./kafka-topics.sh --create --bootstrap-server node0:9092 --replication-factor 1 --partitions 1 --topic good_news
  ./kafka-topics.sh --create --bootstrap-server node0:9092 --replication-factor 1 --partitions 1 --topic bad_news

  sleep 15
  echo "... Kafka configured."

  echo "Verify Kafka configuration..."
  cd /tmp/datastax-spark-streaming-workshop/kafka_2.12-2.2.0/bin
  ./kafka-topics.sh --list --bootstrap-server node0:9092
  sleep 15
  echo "... Kafka configuration verified." 
fi
echo "... Finished Kafka Installation."
