
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "vim-plug installed!"


if [ -d ~/replitrustprojects/.config/ ]; 
	rm -rf ~/replitrustprojects/.config/
fi

mkdir ~/replitrustprojects/.config/
cp -R ~/replitrustprojects/config/nvim/ ~/replitrustprojects/.config/

echo ".config directory generated!"


if [ -f ~/.emacs.el ]; then 
    rm ~/.emacs.el
fi

cp ~/replitrustprojects/.config/.emacs.el ~/

echo "set up .emacs.el!"
