start-kafka:
	docker-compose -f scripts/deployments/deploy_kafka.yml up -d

stop-kafka:
	docker-compose -f scripts/deployments/deploy_kafka.yml down

start-elastic:
	docker-compose -f scripts/deployments/deploy_elastic.yml up -d

stop-elastic:
	docker-compose -f scripts/deployments/deploy_elastic.yml down

start-connect:
	docker-compose -f scripts/deployments/deploy_kafkaconnect.yml up -d

stop-connect:
	docker-compose -f scripts/deployments/deploy_kafkaconnect.yml down

start-kibana:
	docker-compose -f scripts/deployments/deploy_kibana.yml up -d

stop-kibana:
	docker-compose -f scripts/deployments/deploy_kibana.yml down

start-streams:
	docker-compose -f scripts/deployments/deploy_streams.yml up -d

stop-streams:
	docker-compose -f scripts/deployments/deploy_streams.yml down

start-app:
	docker-compose -f scripts/deployments/deploy_app.yml up -d

stop-app:
	docker-compose -f scripts/deployments/deploy_app.yml down

clone:
	git clone https://github.com/JQrdan/datastream-app.git ../datastream-app
	git clone https://github.com/JQrdan/datastream-streams.git ../datastream-streams
	git clone https://github.com/JQrdan/datastream-connect.git ../datastream-connect
	git clone https://github.com/JQrdan/datastream-producer.git ../datastream-producer
	git clone https://github.com/JQrdan/datastream-hooks.git ../datastream-hooks
	git clone https://github.com/JQrdan/datastream-metrics.git ../datastream-metrics
	git clone https://github.com/JQrdan/kafka-docker.git ../kafka-docker

build:
	sudo docker build ../datastream-connect -t jqrdan/datastream-connect:1.0.0
	sudo docker build ../datastream-app -t jqrdan/datastream-app:1.0.0
	sudo docker build -f ../datastream-streams/Dockerfile-details -t jqrdan/datastream-stream-details:1.0.0 ../datastream-streams/
	sudo docker build -f ../datastream-streams/Dockerfile-genres -t jqrdan/datastream-stream-genres:1.0.0 ../datastream-streams/
	sudo docker build -f ../datastream-streams/Dockerfile-songs -t jqrdan/datastream-stream-songs:1.0.0 ../datastream-streams/
	sudo docker build -f ../datastream-streams/Dockerfile-artists -t jqrdan/datastream-stream-artists:1.0.0 ../datastream-streams/
	sudo docker build -f ../datastream-streams/Dockerfile-albums -t jqrdan/datastream-stream-albums:1.0.0 ../datastream-streams/
	sudo docker build -f ../datastream-hooks/topics/Dockerfile -t jqrdan/datastream-hooks-topics:1.0.0 ../datastream-hooks
	sudo docker build -f ../datastream-hooks/connectors/Dockerfile -t jqrdan/datastream-hooks-connectors:1.0.0 ../datastream-hooks
	sudo docker build -f ../datastream-hooks/dashboards/Dockerfile -t jqrdan/datastream-hooks-dashboards:1.0.0 ../datastream-hooks
	sudo docker build ../datastream-metrics -t jqrdan/datastream-metrics:1.0.0
	sudo docker build ../kafka-docker -t jqrdan/datastream-kafka:1.0.0

push:
	docker push jqrdan/datastream-connect:1.0.0
	docker push jqrdan/datastream-app:1.0.0
	docker push jqrdan/datastream-stream-details:1.0.0
	docker push jqrdan/datastream-stream-genres:1.0.0
	docker push jqrdan/datastream-stream-songs:1.0.0
	docker push jqrdan/datastream-stream-artists:1.0.0
	docker push jqrdan/datastream-stream-albums:1.0.0
	docker push jqrdan/datastream-hooks-topics:1.0.0 
	docker push jqrdan/datastream-hooks-connectors:1.0.0 
	docker push jqrdan/datastream-metrics:1.0.0
	docker push jqrdan/datastream-kafka:1.0.0

start:
	sudo docker-compose -f scripts/deployments/deploy_all.yml up

stop:
	sudo docker-compose -f scripts/deployments/deploy_all.yml down

all:
	$(MAKE) clone
	$(MAKE) build
	$(MAKE) start
