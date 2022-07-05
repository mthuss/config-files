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

function bash_aliases (){
	[[ -f $HOME/.bashrc ]] && cat $HOME/.bashrc | grep -q .bash_aliases && cp $HOME/.bashrc $HOME/.bashrc.old
	[[ -f $HOME/.bash_aliases ]] && mv $HOME/.bash_aliases $HOME/.bash_aliases.old
	cat $HOME/.bashrc | grep -q .bash_aliases && echo ".bashrc already has a .bash_aliases line" || (echo "[[ -f \$HOME/.bash_aliases ]] && source \$HOME/.bash_aliases" >> $HOME/.bashrc &> /dev/null) 
	cp .bash_aliases $HOME
}

function neofetch_config (){
	if [[ -f $HOME/.config/neofetch/config.conf ]] 
	then
		cmp -s neofetch/config.conf $HOME/.config/neofetch/config.conf && echo "No changes made to neofetch config" || mv $HOME/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf.old
	fi
	[[ ! -d $HOME/.config/neofetch/ ]] && mkdir $HOME/.config/neofetch/
	cp neofetch/config.conf neofetch/SGBadge $HOME/.config/neofetch/
}

function mangohud_config (){
	[[ -f $HOME/.config/MangoHud/MangoHud.conf ]] && mv $HOME/.config/MangoHud/MangoHud.conf $HOME/.config/MangoHud/MangoHud.conf.old 
	[[ ! -d $HOME/.config/MangoHud/ ]] && mkdir $HOME/.config/MangoHud/
	cp MangoHud.conf $HOME/.config/MangoHud/
}

function kb_shortcuts (){
	[[ -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ]] && mv $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.old
	[[ ! -d $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/ ]] && mkdir -p $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
	cp xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
}

function alacritty_config (){
	[[ -f $HOME/.config/alacritty/alacritty.yml ]] && mv $HOME/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml.old
	[[ ! -d $HOME/.config/alacritty/ ]] && mkdir $HOME/.config/alacritty
	cp alacritty.yml $HOME/.config/alacritty/
}

function vscode_config (){
	[[ -d $HOME/.config/Code/ && ! -d $HOME/.config/Code\ -\ OSS/ ]] && VSC_PATH=$HOME/.config/Code/
	[[ -d $HOME/.config/Code\ -\ OSS/ ]] && VSC_PATH=$HOME/.config/Code\ -\ OSS
	bash vscode/vscode_exts
	echo "installing config files"
	[[ -f $VSC_PATH/User/settings.json ]] && mv "$VSC_PATH"/User/settings.json "$VSC_PATH"/User/settings.json.old 
	cp vscode/settings.json "$VSC_PATH"/User/
}
function FSS (){
	OS="$(lsb_release -is)"
	if [[ "$(sudo -l)" ]]
	then
		[[ $OS == "ManjaroLinux" || $OS == "ArchLinux" ]] && sudo pacman -S vim alacritty code neofetch --needed
		
		[[ $OS == "Ubuntu" ]] && sudo apt install vim alacritty code neofetch
		
	fi

	#vimrc
	echo "installing vimrc"
	[[ "$(which vim)" ]] &> /dev/null && vimrc || echo "vim not installed. Skipping..."

	#bash aliases
	echo "installing bash aliases"
	[[ $SHELL == "/bin/bash" ]] && bash_aliases || echo "not using bash. Skipping..."

	#vscode config
	echo "configuring vscode"
	[[ "$(which code)" ]]  &> /dev/null && vscode_config || echo "vscode not installed. Skipping..."

	#alacritty config
	echo "installing alacritty config"
	[[ "$(which alacritty)" ]] &> /dev/null && alacritty_config || echo "alacritty not installed. Skipping..."

	#neofetch config
	echo "installing neofetch config"
	[[ "$(which neofetch)" ]] &> /dev/null && neofetch_config || echo "neofetch not installed. Skipping..."

	#gitconfig
	echo "installing gitconfig"
	gitconfig
	 
}

function gitconfig (){
	[[ -f $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old
	cp .gitconfig $HOME/.gitconfig
}

echo -e "General Installation Script\n"
PS3='Select an option: '
options=("First-time setup" "vimrc" "bash aliases" "neofetch" "mangohud" "kb shortcuts" "alacritty" "vscode" "gitconfig" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"First-time setup")
			echo "Performing first time setup"
			FSS
			;;
		"vimrc")
			echo "Installing vimrc"
			vimrc
			;;
		"bash aliases")
			echo "Installing bash aliases"
			bash_aliases
			;;
		"neofetch")
			echo "Installing neofetch config"
			neofetch_config
			;;
		"mangohud")
			echo "Installing mangohud config"
			mangohud_config
			;;	
		"kb shortcuts")
			echo "Installing keyboard shortcuts"
			kb_shortcuts
			;;
		"alacritty")
			echo "Installing alacritty config"
			alacritty_config
			;;
		"vscode")
			echo "configuring vscode"
			vscode_config
			;;
		"gitconfig")
			echo "Installing gitconfig"
			gitconfig
			;;
		"Quit")
			break
			;;
		*) echo "opção inválida $REPLY";;
	esac
done

