function vimrc (){
	[[ ! -d $HOME/.vimundo ]] && mkdir $HOME/.vimundo
	[[ ! -d $HOME/.vim ]] && mkdir $HOME/.vim
	[[ ! -d $HOME/.vim/colors ]] && mkdir $HOME/.vim/colors
	[[ ! -f $HOME/.vim/colors/gruvbox.vim ]] && wget -q https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P $HOME/.vim/colors/

	if [[ -f $HOME/.vimrc ]]
	then
		cmp -s vimrc/.vimrc $HOME/.vimrc && echo "No changes made to .vimrc" || mv $HOME/.vimrc $HOME/.vimrc.old
	fi
	[[ ! -f $HOME/.vimrc ]] && cp vimrc/.vimrc $HOME
	[[ -f $HOME/.vimrc && -f $HOME/.vim/colors/gruvbox.vim && -d $HOME/.vimundo ]] && echo "Install successful" || echo "Something went wrong"
}
PS3='Which do you want to install? '
options=("vimrc" "bashrc" "bash aliases" "neofetch" "mangohud" "kb shortcuts" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"vimrc")
			echo "You chose vimrc"
			vimrc
			;;
		"Quit")
			break
			;;
		*) echo "opção inválida $REPLY";;
	esac
done

