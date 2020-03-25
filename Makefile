start-kafka:
	docker-compose -f scripts/deployments/deploy_kafka.yml up

stop-kafka:
	docker-compose -f scripts/deployments/deploy_kafka.yml down

start-elastic:
	docker-compose -f scripts/deployments/deploy_elastic.yml up

stop-elastic:
	docker-compose -f scripts/deployments/deploy_elastic.yml down

start-connect:
	docker-compose -f scripts/deployments/deploy_kafkaconnect.yml up

stop-connect:
	docker-compose -f scripts/deployments/deploy_kafkaconnect.yml down

start-kibana:
	docker-compose -f scripts/deployments/deploy_kibana.yml up

stop-kibana:
	docker-compose -f scripts/deployments/deploy_kibana.yml down

start-streams:
	docker-compose -f scripts/deployments/deploy_streams.yml up

stop-streams:
	docker-compose -f scripts/deployments/deploy_streams.yml down