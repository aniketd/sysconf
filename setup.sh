sudo pacman -S --noconfirm git tmux gdm emacs neovim xclip xsel fish
sudo yaourt -S aura-bin --noconfirm
sudo aura -A ttf-fantasque-sans tor-browser-en --noconfirm

# setup git
git config --global user.name "Aniket Deshpande"
git config --global user.email "anicake@gmail.com"
git config --global core.editor nvim
git config --global core.autocrlf input
git config --global credential.helper 'cache --timeout=3600'

# clone sysconf
mkdir ~/Code
cd ~/Code
git clone https://github.com/aniketd/sysconf.git

# tmux
cd ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s Code/sysconf/tmux.conf .tmux.conf
echo "TMUX: `tmux source ~/.tmux.conf` and then PREFIX-I to install plugins."

# oh my fish # TODO
curl -L http://get.oh-my.fish | fish # TODO

# spacemacs
mkdir -p ~/.config/systemd/user/
cp ~/Code/sysconf/systemd.emacs.service ~/.config/systemd/user/emacs.service
systemctl --user enable emacs.service
systemctl --user start emacs.service

# neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "NEOVIM: enter and type :PlugInstall!"
