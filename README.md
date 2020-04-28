# datastream-base

Base repo for Final year project at University of Exeter. This includes the deployment script to run the full system.

### How to run

This distributed system is created using a Docker swarm. To start the system, you will need at least one master node (called `master-1`) and two worker nodes (called `worker-1` and `worker-2`).

I have tested these on Ubuntu 19.10 on 3 compute nodes with 8vcpus and 52GB ram each. I would recommend using the same. To initialise these nodes, run `./scripts/init.sh` on each one. This will install the appropriate tools needed for this project.

(NOTE: depending on your permissions, you may need to run `docker` as `sudo docker`)

Once installed, a docker swarm needs to be created. You can do this by running `docker swarm init` on the master node. You will then need to run the command that the swarm init supplies on each worker nodes.

To check that the swarm is set up correctly, run `docker node ls`. This should list the three compute nodes.

Once the docker swarm is setup, simply run `make start` to stand everything up. It may take a couple minutes for everything to be ready.

Once everything is ready, you can start producing data using the data using [datastream-producer](https://github.com/JQrdan/datastream-producer).

### Monitoring

You can view the status of everything by running `docker stack ps datastream` and/or `docker service ls`.

Kibana will be accessable at \<master-1>:5601

### Related Repositories

There are two other repositories that you will need to have the full system. These are:

[datastream-app](https://github.com/JQrdan/datastream-app) - for the elastic query client

[datastream-producer](https://github.com/JQrdan/datastream-producer)  - for producing data into the system

The rest of these repositorys are all part of the project but are not necessary to run it as they docker images are hosted on dockerhub.

[datastream-connect](https://github.com/JQrdan/datastream-connect) 

[datastream-hooks](https://github.com/JQrdan/datastream-hooks) 

[kafka-docker](https://github.com/JQrdan/kafka-docker) 

[datastream-metrics](https://github.com/JQrdan/datastream-metrics) 

[datastream-streams](https://github.com/JQrdan/datastream-streams) 
