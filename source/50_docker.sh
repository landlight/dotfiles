# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

function docker_cleanup () {
    docker system prune
}

function test_docker() {
    docker run --rm hello-world
}
