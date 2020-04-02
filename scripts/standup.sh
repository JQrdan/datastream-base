#!/bin/bash

read -p 'Enter IP address of Kafka host (default 127.0.0.1): ' kafka

if [[ $kafka = '' ]]; then
  export KAFKA=127.0.0.1
else
  export KAFKA=$kafka
fi

read -p 'Enter IP address of Elastic host (default 127.0.0.1): ' elastic

if [[ $elastic = '' ]]; then
  export ELASTIC=127.0.0.1
else
  export ELASTIC=$elastic
fi

docker-compose -f scripts/deployments/deploy_kafka.yml up -d
../datastream-connect/scripts/init-topics.sh
docker-compose -f scripts/deployments/deploy_streams.yml up -d
docker-compose -f scripts/deployments/deploy_kafkaconnect.yml up -d
docker-compose -f scripts/deployments/deploy_elastic.yml up -d
docker-compose -f scripts/deployments/deploy_kibana.yml up -d
docker-compose -f scripts/deployments/deploy_app.yml up -d

make -C ../datastream-producer all