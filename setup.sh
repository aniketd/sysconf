# setup the network first
#cd /etc/
#sudo mv resolv.conf resolv.conf.orig
#sudo ln -s /etc/systemd/resolve/resolv.conf /etc/resolv.conf

sudo echo "
# /etc/wpa_supplicant/wpa_supplicant-wlp1s0.conf
ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=wheel
update_config=1
eapol_version=1
ap_scan=1
fast_reauth=1
" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant-{DEVICE-NAME}.conf
# WIRELESS_DEVICE = TODO capture wireless device and then use that to write wpa_supplicant files etc.
sudo echo "
# /etc/systemd/network/wireless.network
[Match]
Name=wl*

[Network]
DHCP=yes
RouteMetric=20
IPv6PrivacyExtensions=true
## to use static IP uncomment these instead of DHCP
#DNS=192.168.1.254
#Address=192.168.1.87/24
#Gateway=192.168.1.254
" | sudo tee -a /etc/systemd/network/wireless.network

sudo echo "
# /etc/systemd/network/wired.network
[Match]
Name=en*

[Network]
DHCP=yes
RouteMetric=10
IPv6PrivacyExtensions=true
## to use static IP uncomment these instead of DHCP
#DNS=192.168.1.254
#Address=192.168.1.87/24
#Gateway=192.168.1.254
" | sudo tee -a /etc/systemd/network/wired.network

sudo systemctl disable networkmanager
sudo systemctl stop networkmanager

sudo -i
rm /etc/resolv.conf
systemctl enable systemd-networkd 
systemctl enable wpa_supplicant@{DEVICE-NAME}
systemctl enable systemd-resolved
systemctl start systemd-networkd
systemctl start wpa_supplicant@wlp1s0 # like this one
systemctl start systemd-resolved
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

set +o history
sudo wpa_passphrase <ESSID> <passphrase> >> /etc/wpa_supplicant/wpa_supplicant-wlp1s0.conf
set -o history

echo "REBOOT: wifi should work..."

# update this sh*t
sudo pacman -Syyu --noconfirm

# basic setup
sudo pacman -S --noconfirm git tmux emacs neovim xclip xsel fish inotify-tools st
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

# user dir
mkdir ~/Code
mkdir -p ~/.config/systemd/user/

# clone sysconf
cd ~/Code
git clone https://github.com/aniketd/sysconf.git
cd

# xorg.conf for xmonad
sudo ln -s ~/Code/sysconf/xorg.conf /etc/X11/xorg.conf

# wallpaper [extremely important]
ln -s ~/Code/sysconf/blackhole.png ~/Pictures/blackhole.png

# xmonad
sudo pacman -S --noconfirm xmonad xmonad-contrib xmobar stalonetray scrot cabal-install xcompmgr feh slock # slim (no)
# # if you want dmenu with yeganesh
# sudo cabal-update
# sudo pacman -S --noconfirm dmenu
# sudo cabal-install --global yeganesh
cd
mv .xmonad .xmonad.orig
git clone https://github.com/aniketd/xmonad-config.git .xmonad
ln -s .xmonad/xmonad-session-rc .xinitrc
ln -s .xmonad/xmonad-session-rc .xsessionrc
ln -s .xmonad/xmonad-session-rc .xsession
# not you can start with `startx`, after login.

# screw gnome dependency over at-spi-bus-launcher et. al.
sudo echo -e "\n[options]\nNoExtract = usr/share/dbus-1/services/org.a11y.*\n" | sudo tee -a /etc/pacman.conf # this will print the echo to stdout too, unless > /dev/null
sudo pacman -S gtk3 at-spi2-core # this stops useless buggy gnome-dependent software to spawn

# tmux
cd
mkdir -p .tmux/plugins
git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
ln -s Code/sysconf/tmux.conf .tmux.conf
echo "TMUX: `tmux source ~/.tmux.conf` and then PREFIX-I (^b-I) to install plugins."

# oh my fish # TODO
cd
curl -L http://get.oh-my.fish | fish # TODO
cd
omf install chain # this is THE theme!

# spacemacs
cd
cp Code/sysconf/systemd.emacs.service .config/systemd/user/emacs.service
# systemctl --user enable emacs.service
# systemctl --user start emacs.service
git clone https://github.com/syl20bnr/spacemacs .emacs.d
ln -s ~/Code/sysconf/spacemacs ~/.spacemacs

# neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "NEOVIM: enter and type :PlugInstall!"

# # an2linux notification from the phone. [not working] [TODO: write a better version in rust :0]
# sudo pacman -S --noconfirm bluez-libs python-pybluez libnotify
# cd ~/Code
# git clone https://github.com/rootkiwi/an2linuxserver.git
# cp ~/Code/sysconf/systemd.an2linux.service ~/.config/systemd/user/an2linux.service
# systemctl --user enable an2linux.service
# systemctl --user start an2linux.service
