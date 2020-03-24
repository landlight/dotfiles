local SOPHIA_HOME=~/Workspace/Sophia
alias sophia="cd $SOPHIA_HOME"
alias sophia_docs="cd $SOPHIA_HOME/documentation"
alias open_sophia_docs="sophia_docs && gpu"
alias tdpk="cd $SOPHIA_HOME/deployment-tdpk"

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