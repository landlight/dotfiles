export SOPHIA_HOME=~/Workspace/Sophia
export TDPK_DOCKER_COMPOSE_ENV=$SOPHIA_HOME/env/docker-compose.env
export TDPK_FE_ENV=$SOPHIA_HOME/env/.env
alias sophia="cd $SOPHIA_HOME"
alias sophia_docs="cd $SOPHIA_HOME/documentation"
alias open_sophia_docs="sophia_docs && gpu"
alias tdpk="cd $SOPHIA_HOME/deployment-tdpk"
alias tdpk_up="tdpk && ./deploy.sh"
alias cp-tdpk-env="cp $TDPK_FE_ENV ./.env"
alias cp-tdpk-docker-compose-env="cp $TDPK_DOCKER_COMPOSE_ENV ./docker-compose.env"

alias tunnel="tunnels"
function tunnels() {
    ## Tunnel through the jump server
    ssh -J jump "$1" -Nf -L "$2":localhost:"$3"
    ps -ef | grep "$3"
}

## Create a ssh connection through a jump tunnel
function sshj_generator() {
    ssh -J $1 ${@:2}
}

## Sophia specific jump targets
function scpj() {
    scp -o 'ProxyJump jump' $@
}
function sshj() {
    sshj_generator jump $@
}

function sophia-restore-db () {
    rethinkdb-restore --force --password-file $SOPHIA_HOME/dbDump/password.txt $SOPHIA_HOME/dbDump/rethinkdb_dump.tar.gz
}