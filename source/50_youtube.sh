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
  parallel -a $1 youtube-dl --extract-audio --audio-format mp3
}

alias ry="rip-youtube-clipboard"
