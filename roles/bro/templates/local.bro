@load Bro/Kafka/logs-to-kafka.bro
redef Kafka::logs_to_send = set(Conn::LOG, HTTP::LOG, DNS::LOG);
redef Kafka::kafka_conf = table(
    ["metadata.broker.list"] = "{{ kafka_broker_url }}"
);
