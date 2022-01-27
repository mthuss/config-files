[[ ! -d $HOME/.vimundo ]] && mkdir $HOME/.vimundo
[[ ! -d $HOME/.vim ]] && mkdir $HOME/.vim
[[ ! -d $HOME/.vim/colors ]] && mkdir $HOME/.vim/colors
[[ ! -f $HOME/.vim/colors/gruvbox.vim ]] && wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P $HOME/.vim/colors/
[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc.old
[[ ! -f $HOME/.vimrc ]] && mv .vimrc $HOME
