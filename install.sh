[[ ! -d $HOME/.vimundo ]] && mkdir $HOME/.vimundo
[[ ! -d $HOME/.vim ]] && mkdir $HOME/.vim
[[ ! -d $HOME/.vim/colors ]] && mkdir $HOME/.vim/colors
[[ ! -f $HOME/.vim/colors/gruvbox.vim ]] && wget -q https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P $HOME/.vim/colors/
[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc.old
[[ ! -f $HOME/.vimrc ]] && mv .vimrc $HOME
[[ -f $HOME/.vimrc && -f $HOME/.vim/colors/gruvbox.vim && -d $HOME/.vimundo ]] && echo "Install successful" || echo "Something went wrong"
