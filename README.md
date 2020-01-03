# datastream-base
Base repo for Final year project at University of Exeter. This includes the deployment file to start the system as well as a node Kafka producer and Kafka Consumer to check that Kafka is working correctly.

### Prereqs

  - Docker 
  - If on Windows, docker-compose (included with mac/linux version of docker)
  - Build and tag the datastream-connect image from this repo: [datastream-connect](https://github.com/JQrdan/datastream-connect) 

### How to run

This distributed system is held together by docker-compose. To start the system, run:

```
docker-compose -f deploy_base.yml up
```

To properly shut down the system, run:

```
docker-compose -f deploy_base.yml down
```