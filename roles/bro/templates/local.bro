@load Bro/Kafka/logs-to-kafka.bro
redef Kafka::logs_to_send = set(Conn::LOG, HTTP::LOG, DNS::LOG);
redef Kafka::kafka_conf = table(
    ["metadata.broker.list"] = "{{ kafka_broker_url }}"
);
redef Kafka::topic_conf = table(
    ["Conn::LOG"] = "bro_conn_topic",
    ["HTTP::LOG"] = "bro_http_topic",
    ["DNS::LOG"] = "bro_dns_topic",
    ["*"] = "bro_default_topic"
);
