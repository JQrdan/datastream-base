#!/bin/bash

read -p 'Enter IP address of Kafka host (default 127.0.0.1): ' kafka

if [[ $kafka = '' ]]; then
  kafka=127.0.0.1
fi

read -p 'Enter IP address of Elastic host (default 127.0.0.1): ' elastic

if [[ $elastic = '' ]]; then
  elastic=127.0.0.1
fi

docker-compose -f scripts/deployments/deploy_kafka.yml up -d

sleep 10000

../datastream-connect/scripts/init-topics.sh

KAFKA=$kafka docker-compose -f scripts/deployments/deploy_streams.yml up -d

KAFKA=$kafka ELASTIC=$elastic docker-compose -f scripts/deployments/deploy_kafkaconnect.yml up -d

docker-compose -f scripts/deployments/deploy_elastic.yml up -d

ELASTIC=$elastic docker-compose -f scripts/deployments/deploy_kibana.yml up -d

KAFKA=$kafka docker-compose -f scripts/deployments/deploy_app.yml up -d