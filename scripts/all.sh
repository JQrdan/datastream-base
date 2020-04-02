git clone https://github.com/JQrdan/datastream-app.git ../datastream-app
git clone https://github.com/JQrdan/datastream-streams.git ../datastream-streams
git clone https://github.com/JQrdan/datastream-connect.git ../datastream-connect
git clone https://github.com/JQrdan/datastream-producer.git ../datastream-producer

docker network create datastream-network
docker build ../datastream-connect -t datastream-connect:1.0.0
docker build ../datastream-app -t datastream-app:1.0.0
docker build -f ../datastream-streams/Dockerfile-details -t datastream-stream-details:1.0.0 ../datastream-streams/
docker build -f ../datastream-streams/Dockerfile-genres -t datastream-stream-genres ../datastream-streams/
docker build -f ../datastream-streams/Dockerfile-songs -t datastream-stream-songs ../datastream-streams/

./scripts/standup.sh