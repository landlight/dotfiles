GITKRAKEN_LISTEN_LIMIT=524288

# Increasing the amount of inotify watchers
# https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
function raise_listen_limit() {
    sudo sysctl fs.inotify.max_user_watches=$1
    sudo sysctl -p
}

function get_current_listen_limit() {
    sudo cat /proc/sys/fs/inotify/max_user_watches
}

# Raise the inotify listen limit and launch gitkraken
function wake_the_kraken() {
    CURRENT_LIMIT=$(get_current_listen_limit)
    echo "GK Listen Limit : $GITKRAKEN_LISTEN_LIMIT";
    echo "Current Limit : $CURRENT_LIMIT";
    if [[ $CURRENT_LIMIT -lt $GITKRAKEN_LISTEN_LIMIT ]]; then
        raise_listen_limit $GITKRAKEN_LISTEN_LIMIT
        echo "Waking the Kraken!";
    fi

    gitkraken $1
}

alias ~~='wake_the_kraken';