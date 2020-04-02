read -p 'Enter username: ' username

sudo -i

cd /home/$username/

# update apt repo
apt-get update

# install https tools
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# get docker key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install java
apt-get install default-jre

# install docker-compose
docker run docker/compose:1.24.0 version

# set alias to use docker-compose
echo alias docker-compose="'"'docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:1.24.0'"'" >> ~/.bashrc

# set alias
source ~/.bashrc

apt-get install make

# set dns for zookeeper so script can create initial topics
echo "127.0.0.1 zookeeper"