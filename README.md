# datastream-base

Base repo for Final year project at University of Exeter. This includes the deployment scripts to run the full system.

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

Before running elasticsearch on cloud, you may need to run the command

`sudo sysctl -w vm.max_map_count=262144`

To get it to work