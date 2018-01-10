# Official Docker Installation Instructions
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce-1
function install_docker() {
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update
    sudo apt install docker-ce docker-compose
}

# Run docker as non-root user
# https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user
function docker_unroot() {
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

function test_docker() {
    docker run hello-world
}