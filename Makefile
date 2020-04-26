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

pull:
	sudo docker-compose pull

start:
	sudo docker stack deploy datastream -c docker-compose.yaml

stop:
	sudo docker stack rm datastream
	