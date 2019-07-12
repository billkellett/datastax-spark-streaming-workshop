// Spark Structured Streaming Workshop DDL

// start from a clean slate

drop keyspace if exists streaming_workshop;

// create the keyspace for the workshop

create keyspace if not exists streaming_workshop 
    WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};

// create all tables

create table if not exists streaming_workshop.ratings_modifiers_all (
    instrument_symbol           text,
    ethical_category            text,
    event_sequence_number       int,
    source_url                  text,
    source_weight               int,
    source_sentiment            int,
    primary key ((instrument_symbol, ethical_category), event_sequence_number)
)
with clustering order by (event_sequence_number desc);

create table if not exists streaming_workshop.ratings_modifiers_good_news (
    instrument_symbol           text,
    ethical_category            text,
    event_sequence_number       int,
    source_url                  text,
    source_weight               int,
    source_sentiment            int,
    primary key ((instrument_symbol, ethical_category), event_sequence_number)
)
with clustering order by (event_sequence_number desc);

create table if not exists streaming_workshop.ratings_modifiers_bad_news (
    instrument_symbol           text,
    ethical_category            text,
    event_sequence_number       int,
    source_url                  text,
    source_weight               int,
    source_sentiment            int,
    primary key ((instrument_symbol, ethical_category), event_sequence_number)
)
with clustering order by (event_sequence_number desc);

create table if not exists streaming_workshop.ratings_modifiers_aggregated_all_time (
    instrument_symbol           text,
    ethical_category            text,
    total_events                int,
    weighted_sentiment_change   int,
    primary key ((instrument_symbol), ethical_category)
)
with clustering order by (ethical_category asc);

create table if not exists streaming_workshop.ratings_modifiers_aggregated_windowed (
    instrument_symbol           text,
    ethical_category            text,
    total_events                int,
    weighted_sentiment_change   int,
    last_update_window          text,
    primary key ((instrument_symbol), ethical_category)
)
with clustering order by (ethical_category asc);
