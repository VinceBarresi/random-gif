
function get_gif {
    url="http://api.giphy.com/v1/gifs/random?&api_key=dc6zaTOxFJmzC"
    gif=$(curl $url | jq -r '.data.url')
    gif=$gif/fullscreen
    open $gif
}

get_gif
