#!/bin/bash

WIFIDEV=`networkctl 2>/dev/null | awk '/wlan/ {print $2}'`

sudo echo "
# /etc/wpa_supplicant/wpa_supplicant-${WIFIDEV}.conf
ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=wheel
update_config=1
eapol_version=1
ap_scan=1
fast_reauth=1
" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant-${WIFIDEV}.conf

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
#Gateway=192.168.1.254c
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

sudo systemctl stop networkmanager
sudo systemctl disable networkmanager

cd /etc/
sudo mv resolv.conf resolv.conf.orig
sudo mkdir -p systemd/resolve
sudo touch systemd/resolve/resolv.conf
sudo ln -s systemd/resolve/resolv.conf resolv.conf
cd

echo "Enter network SSID: "
read SSID
echo "Enter passphrase for -${SSID}- : "
read PASS
#set +o history
sudo wpa_passphrase ${SSID} ${PASS} >> /etc/wpa_supplicant/wpa_supplicant-${WIFIDEV}.conf
#set -o history

sudo systemctl enable systemd-networkd
sudo systemctl enable wpa_supplicant@${WIFIDEV}
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-networkd
sudo systemctl start wpa_supplicant@${WIFIDEV}
sudo systemctl start systemd-resolved

echo "REBOOT: wifi should work..."
echo "If everything worked well, you may remove -networkmanager-"
