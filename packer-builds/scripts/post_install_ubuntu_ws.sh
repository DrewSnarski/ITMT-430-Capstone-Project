#!/bin/bash
set -e
set -v
export TEAMREPO=/home/vagrant/2022-team01m

#################################################################################
# Install additional packages and dependencies here
# Make sure to leave the -y flag on the apt-get to auto accept the install
# Firewalld is required
#################################################################################
sudo apt-get install -y firewalld
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

###################################################
# Example how to install NodeJS
###################################################
# https://nodejs.org/en/download/
# https://github.com/nodesource/distributions/blob/master/README.md
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# This will use the package.json files to install all the applcation
# needed packages and upgrade npm
sudo npm install -g npm@8.5.2

# This will install pm2 - a javascript process manager -- like systemd for
# starting and stopping javascript applciations
# https://pm2.io/
sudo npm install pm2 -g

#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
python3 -m pip install --upgrade pip
sudo apt-get install -y python3-dev
sudo apt-get install -y default-libmysqlclient-dev
sudo apt-get install -y build-essential
python3 -m pip install mysqlclient

#Django installs
sudo apt install -y python3-django
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB
python3 -m pip install django-crispy-forms #Library for management of django forms
python3 -m pip install django-allauth
python3 -m pip install django-ckeditor --upgrade

#################################################################################
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################
su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"

# set the /etc/hosts file to match hostname
#echo "10.0.2.15 stackprj stackprj.com" | sudo tee -a /etc/hosts
# set django startup file host ip
#sed -i "s/host/$IP/g" $TEAMREPO/code/website/*.json

##########################################
# Need to mv the Django code to homebase #
##########################################
cp -r /home/vagrant/2022-team01m/code/website /home/vagrant/

#Setup for DB connection
echo "[mysqld]" > /home/vagrant/.my.cnf
echo "[client]" >> /home/vagrant/.my.cnf
echo "host = team-$NUMBER-db-vm0.service.consul" >> /home/vagrant/.my.cnf
echo "user = $USERNAME" >> /home/vagrant/.my.cnf
echo "password = $USERPASS" >> /home/vagrant/.my.cnf
echo "database = $DATABASE" >> /home/vagrant/.my.cnf

#Autostart Django
# Command to create a service handler and start that javascript app at boot time
chmod u+x /home/vagrant/website/pm2-django.sh
cd /home/vagrant/website
su - vagrant -c "pm2 startup" &
sleep 10
su - vagrant -c "source /home/vagrant/website/pm2-django.sh"

#Start Django server script
echo "cd ~/website" > /home/vagrant/startserver.sh
echo "pm2 start stackprj.json" >> /home/vagrant/startserver.sh
chmod u+x /home/vagrant/startserver.sh

#Restart Django server script
echo "cd ~/website" > /home/vagrant/serverstatus.sh
echo "pm2 status stackprj.json" >> /home/vagrant/serverstatus.sh
chmod u+x /home/vagrant/serverstatus.sh

#Stop Django server script
echo "cd ~/website" > /home/vagrant/stopserver.sh
echo "pm2 stop stackprj.json" >> /home/vagrant/stopserver.sh
chmod u+x /home/vagrant/stopserver.sh

#Runserver Django server script
#echo "cd ~/website" > /home/vagrant/runserver.sh
#echo "python3 manage.py runserver 0.0.0.0:8000  > /dev/null 2>&1 &" >> /home/vagrant/runserver.sh
#chmod u+x /home/vagrant/runserver.sh

#Stop Django server script
#echo "pkill -f runserver" >> /home/vagrant/killserver.sh
#chmod u+x /home/vagrant/killserver.sh

# Fix vagrant file permissions
sudo chown -R vagrant:vagrant /home/vagrant/.*

#Cleanup
rm -v /home/vagrant/website/pm2-django.sh

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
#################################################################################
if [ "$HOST" = "vm" ]
then
  # (Proxmox) Open firewall port to allow only connections from 192.168.172.0/24
  sudo firewall-cmd --zone=public --add-source=192.168.172.0/24 --permanent
fi
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
