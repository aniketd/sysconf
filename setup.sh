# update this sh*t
sudo pacman -Syyu --noconfirm

# basic setup
sudo pacman -S --noconfirm git tmux gdm emacs neovim xclip xsel fish inotify-tools st
sudo yaourt -S --noconfirm aura-bin
sudo aura -A --noconfirm ttf-fantasque-sans
sudo aura -A --noconfirm tor-browser-en
sudo aura -A --noconfirm spideroak-one encryptr
sudo aura -A --noconfirm slack-desktop

# setup git
git config --global user.name "Aniket Deshpande"
git config --global user.email "anicake@gmail.com"
git config --global core.editor nvim
git config --global core.autocrlf input
git config --global credential.helper 'cache --timeout=3600'

mkdir ~/Code
mkdir -p ~/.config/systemd/user/

# clone sysconf
cd ~/Code
git clone https://github.com/aniketd/sysconf.git
cd

# xorg.conf for xmonad
sudo ln -s ~/Code/sysconf/xorg.conf /etc/X11/xorg.conf
ln -s ~/Code/sysconf/blackhole.png ~/Pictures/blackhole.png

# xmonad
sudo pacman -S --noconfirm xmonad xmonad-contrib xmobar stalonetray dmenu scrot cabal-install xcompmgr feh slim slock
sudo cabal-update
sudo cabal-install --global yeganesh
cd
mv .xmonad .xmonad.orig
git clone https://github.com/aniketd/xmonad-config.git .xmonad
ln -s .xinitrc .xmonad/xmonad-session-rc
ln -s .xsessionrc .xmonad/xmonad-session-rc
ln -s .xsession .xmonad/xmonad-session-rc

# tmux
cd ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s Code/sysconf/tmux.conf .tmux.conf
echo "TMUX: `tmux source ~/.tmux.conf` and then PREFIX-I (^b-I) to install plugins."

# oh my fish # TODO
curl -L http://get.oh-my.fish | fish # TODO

# spacemacs
cp ~/Code/sysconf/systemd.emacs.service ~/.config/systemd/user/emacs.service
# systemctl --user enable emacs.service
# systemctl --user start emacs.service
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/Code/sysconf/spacemacs ~/.spacemacs

# neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "NEOVIM: enter and type :PlugInstall!"

# # an2linux notification from the phone.
# sudo pacman -S --noconfirm bluez-libs python-pybluez libnotify
# cd ~/Code
# git clone https://github.com/rootkiwi/an2linuxserver.git
# cp ~/Code/sysconf/systemd.an2linux.service ~/.config/systemd/user/an2linux.service
# systemctl --user enable an2linux.service
# systemctl --user start an2linux.service
