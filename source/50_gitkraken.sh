GITKRAKEN_LISTEN_LIMIT=524288

function raise_listen_limit() {
    sudo sysctl fs.inotify.max_user_watches=$LISTEN_LIMIT
    sudo sysctl -p
}

function get_current_listen_limit() {
    sudo cat /proc/sys/fs/inotify/max_user_watches
}

function test_gitkraken_listen_limit() {
    CURRENT_LIMIT=$(get_current_listen_limit)
    echo "GK Listen Limit : $GITKRAKEN_LISTEN_LIMIT";
    echo "Current Limit : $CURRENT_LIMIT";
    if [[ $CURRENT_LIMIT -lt $GITKRAKEN_LISTEN_LIMIT ]]; then
        echo "Raise the limit to wake the kraken.";
    else
        raise_listen_limit
        echo "Waking the kraken."
        $1 $2
    fi
}

function wake_the_kraken() {
    test_gitkraken_listen_limit gitkraken $1
}

alias ~~='wake_the_kraken';