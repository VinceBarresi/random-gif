function log {
  echo "======== $1 ========"
}

function check_install_homebrew_mac {
  log "Checking/Installing Homebrew"
  if [ "$(which brew)" == "" ]; then
    log "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    log "Homebrew is already installed"
  fi;
}

function check_install_jq {
  log "Checking/Installing jq"
  if [ "$(find /usr/local/Cellar/jq)" == "" ]; then
    log "Installing pq with Homebrew"
    brew install jq
  else
    log "jq is already installed"
  fi;
}

function get_gif {
    url="http://api.giphy.com/v1/gifs/random?&api_key=dc6zaTOxFJmzC"
    gif=$(curl $url | jq -r '.data.url')
    gif=$gif/fullscreen
    open $gif
}

check_install_homebrew_mac
check_install_jq
get_gif
