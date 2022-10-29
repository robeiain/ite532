#!/bin/bash
# to load this script automatically in Oracle Cloud, copy the following line to "Cloud-init script" section (without the #)
# source <(curl -s http://mywebsite.example/myscript.txt)


apt update -y && apt upgrade -y

apt install net-tools

# install desktop

apt install ubuntu-desktop xrdp firefox -y

#set up xrdp to work with tcp4
sed -i 's#port=3389#port=tcp://:3389#g' /etc/xrdp/xrdp.ini

systemctl restart xrdp

#make sure nothing is blocking us
iptables -F

netfilter-persistent save

systemctl restart xrdp

# create a user

NEWUSER=ite532
PASS=Ch@ngeMe

useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' $PASS) $NEWUSER

#make super user

usermod -aG sudo $NEWUSER


#set up terminal with colours for root
sudo sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc


reboot
