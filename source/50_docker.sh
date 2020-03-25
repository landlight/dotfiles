# https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

## Shorthand for docker commands
alias d='docker'
alias dm='docker-compose'
alias dmp='dm ps'
alias dr='docker run -ti $1 $2'

## Easy logging
## dlog service-gateway-api
alias dlog='docker logs --tail 200 $1 -f'

## Stop any currently running docker container and run "yarn dev" in the current directory
## cd service-gateway-api && dev
alias dev='docker stop $(basename $(pwd)) && yarn dev'

## Commands to help us cleanup our docker stack
alias drm='docker rm $(docker ps -a -q)'
alias dstop='docker stop $(docker ps -a -q)'
alias dprune='docker system prune -a; docker images purge'
alias dclean='sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"'
alias dtest='docker run --rm hello-world'