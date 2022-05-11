alias gh='history|grep'

#Updates my vimrc file from github
alias vimup='git clone --quiet https://github.com/mthuss/config-files.git && cd config-files/vimrc && bash install.sh && cd ../.. && rm -rf config-files || echo "Something went wrong"'

#Shortcut for editing this file
alias valias='vim $HOME/.bash_aliases'

#Downloads bandcamp albums w/ proper formating and metadata
alias bcdl='yt-dlp -o "%(playlist_index)s. %(title)s.%(ext)s" --add-metadata'

mkcd () { mkdir $1 && cd $1; }

#Shorten some common commands
alias c='clear'
alias e='exit'
