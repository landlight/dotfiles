# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias grep='grep --color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

# create a file from clipboard contents
function create_file_from_clipboard() {
  if [ -f "$1" ]
    then
      echo "$1 already exists."
    else
      touch $1 
      echo "$(pbpaste)" > "$1"
  fi
}

# find process running on a given port
function find_and_kill_process_on_port() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

# gets the current unix epoch
get_timestamp() {
    local timestamp=$(date +%s)
    echo $timestamp
}
