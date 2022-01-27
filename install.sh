[[ ! -d $HOME/.vimundo ]] && mkdir $HOME/.vimundo
[[ ! -d $HOME/.vim ]] && mkdir $HOME/.vim
[[ ! -d $HOME/.vim/colors ]] && mkdir $HOME/.vim/colors
[[ ! -f $HOME/.vim/colors/gruvbox.vim ]] && wget -q https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P $HOME/.vim/colors/

if [[ -f $HOME/.vimrc ]]
then
	cmp -s .vimrc $HOME/.vimrc && echo "No changes made to .vimrc" || mv $HOME/.vimrc $HOME/.vimrc.old
fi
[[ ! -f $HOME/.vimrc ]] && cp .vimrc $HOME
[[ -f $HOME/.vimrc && -f $HOME/.vim/colors/gruvbox.vim && -d $HOME/.vimundo ]] && echo "Install successful" || echo "Something went wrong"
