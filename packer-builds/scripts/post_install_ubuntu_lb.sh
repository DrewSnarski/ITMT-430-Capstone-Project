#!/bin/bash
set -e
set -v

#################################################################################
# Install additional packages and dependencies here
# Make sure to leave the -y flag on the apt-get to auto accept the install
# Firewalld is required
#################################################################################

sudo apt-get install -y nginx firewalld
##################################################################################
# Installs fail2ban to prevent intrusions (Phallyn H)                          #
##################################################################################
sudo apt-get install -y fail2ban
sudo sed -i "s/bantime = 600/bantime = -1/g" /etc/fail2ban/jail.conf
sudo systemctl enable fail2ban
sudo service fail2ban restart

#################################################################################
# Use an IF statement to determine if we are building for Proxmox Cloud server
# 192.168.172.x or for VirtualBox 192.168.56.x
#################################################################################
HOST=$(hostname | cut -d - -f4 | cut -c 1-2)

if [ "$HOST" = "vm" ]
then
  echo "Building for Proxmox Cloud Environment -- we have Dynamic DNS, no need for /etc/hosts files"
else
  echo "192.168.56.101     team-$NUMBER-lb-vm0    team-$NUMBER-lb-vm0.service.consul"    | sudo tee -a /etc/hosts
  echo "192.168.56.102     team-$NUMBER-ws-vm0   team-$NUMBER-ws-vm0.service.consul"   | sudo tee -a /etc/hosts
  echo "192.168.56.103     team-$NUMBER-ws-vm1   team-$NUMBER-ws-vm1.service.consul"   | sudo tee -a /etc/hosts
  echo "192.168.56.104     team-$NUMBER-ws-vm2   team-$NUMBER-ws-vm2.service.consul"   | sudo tee -a /etc/hosts
  echo "192.168.56.105     team-$NUMBER-db-vm0    team-$NUMBER-db-vm0.service.consul"    | sudo tee -a /etc/hosts
fi

#################################################################################
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################
su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"
export TEAMREPO=/home/vagrant/2022-team01m

#################################################################################
# Documentation for configuring load-balancing in Nginx
#################################################################################
# https://nginx.org/en/docs/http/load_balancing.html
# https://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl
# https://ethitter.com/2016/05/generating-a-csr-with-san-at-the-command-line/
# Nginx configurations
# https://nginx.org/en/docs/beginners_guide.html
# https://dev.to/guimg/how-to-serve-nodejs-applications-with-nginx-on-a-raspberry-jld
###########################################
# Enable load-balancing and reverse proxy #
###########################################
sudo cp -v $TEAMREPO/code/nginx/default /etc/nginx/sites-enabled
sudo cp -v $TEAMREPO/code/nginx/nginx.conf /etc/nginx/

# Restart the Nginx service so it actualizes the updates just made
sudo nginx -t
sudo systemctl daemon-reload
sudo systemctl reload nginx
sudo systemctl restart nginx

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
# Enable http in the firewall
#################################################################################

sudo firewall-cmd --zone=public --add-service=http --permanent
#sudo firewall-cmd --zone=public --add-service=https --permanent
sudo firewall-cmd --reload
