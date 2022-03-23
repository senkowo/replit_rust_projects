
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "vim-plug installed!"

if [ -f ~/.emacs.el ]; then 
    rm ~/.emacs.el
    cp ~/replitrustprojects/.config/.emacs.el ~/
else
    cp ~/replitrustprojects/.config/.emacs.el ~/
fi
echo "set up .emacs.el!"
