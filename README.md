# datastax-spark-streaming-workshop

## NOTE: You MUST run this workshop on cluster instances of m3.2xlarge or better.  It will NOT run on m3.xlarge.


This is a 2-hour introductory workshop on DataStax Spark Structured Streaming.

### Motivation

Tightly-integrated Spark Structured Streaming is a key DSE capability that differentiates DataStax from competitors.  However, prospects often do not understand the capabilities of Spark Structured Streaming, and do not know how to use it.  

This workshop helps prospects become familiar with Spark Structured Streaming.  We take a "practitioner" approach, with minimal focus on internals.

### What is included?

A configured Kafka instance, Zeppelin notebooks, a pre-populated keyspace, executable code, and a corresponding presentation (with detailed speaker notes) walk participants through the most important capabilities of Spark Structured Streaming for database-centric applications.

* Consuming Kafka events and persisting them as detail-level records in Cassandra
* Consuming Kafka events, aggregating them, and persisting aggregated data in Cassandra
* Pipelining Kafka events to other Kafka topics, and using multiple Spark jobs to persist the pipelined events in Cassandra

### Business Take Aways

Spark Structured Streaming adds a crucial capability that makes Cassandra the best choice for use cases involving streaming data.

### Technical Take Aways

Spark Structured Streaming adds a crucial capability that is not found in open-source Cassandra.
