alias gh='history|grep'

#Updates my vimrc file from github
alias vimup='git clone --quiet https://github.com/mthuss/config-files.git && cd config-files/vimrc && bash install.sh && cd ../.. && rm -rf config-files || echo "Something went wrong"'

#Shortcut for editing this very file
alias valias='vim $HOME/.bash_aliases'

#Downloads bandcamp albums w/ proper formating and metadata (format still needs to be appended manually)
alias bcdl='yt-dlp -o "%(playlist_index)s. %(title)s.%(ext)s" --add-metadata'

#Copies pwd to clipboard
alias cpwd='pwd | xargs -i echo -n \"{}\"|  xclip -selection clipboard'
#Shorten some common commands
alias c='clear'
alias e='exit'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

#Opens code-oss with liveshare apis enabled
alias codels='code --enable-proposed-api ms-vsliveshare.vsliveshare'


#mkcd () { mkdir "$1" && cd "$1"; }
mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
resize () { convert $2 -resize $1% $2; }
function clip {
startsecs=$(echo $2 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
endsecs=$(echo $3 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
extension="${1#*.}"
ffmpeg -i "$1" -ss $2 -c copy -t $((endsecs-startsecs)) -map 0:v:$4? -map 0:a:$5? "$6".$extension
}
