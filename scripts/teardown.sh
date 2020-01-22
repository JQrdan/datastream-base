if [[ $PWD = */datastream-base ]]; then
 cd scripts
fi

docker-compose -f deployments/deploy_kafka.yml -f deployments/deploy_elastic.yml -f deployments/deploy_kibana.yml -f deployments/deploy_kafkaconnect.yml down