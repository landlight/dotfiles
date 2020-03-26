function rip-youtube() {
  youtube-dl --extract-audio --audio-format mp3 $1
}

function rip-youtube-playlist() {
  youtube-dl --extract-audio --audio-format mp3 --yes-playlist $1
}

function rip-youtube-clipboard() {
  rip-youtube $(pbpaste)
}

function rip-youtube-list() {
  parallel -a youtube-dl --extract-audio --audio-format mp3 $(pbpaste)
}

function update-youtube-dl() {
  pip3 install --upgrade youtube-dl
}

alias ry="rip-youtube-clipboard"
