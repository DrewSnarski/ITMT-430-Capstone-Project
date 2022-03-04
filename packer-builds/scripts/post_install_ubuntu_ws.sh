#!/bin/bash
set -e
set -v

#################################################################################
# Install additional packages and dependencies here
# Make sure to leave the -y flag on the apt-get to auto accept the install
# Firewalld is required
#################################################################################
sudo apt-get install -y nginx firewalld

#################################################################################
# Example how to install NodeJS
#################################################################################
# https://nodejs.org/en/download/
# https://github.com/nodesource/distributions/blob/master/README.md
# Using Ubuntu
# curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# sudo apt-get install -y nodejs

#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
sudo python3 -m pip install --upgrade pip
sudo apt-get install -y python3-dev
sudo apt-get install -y default-libmysqlclient-dev
sudo apt-get install -y build-essential
sudo python3 -m pip install mysqlclient

#Django installs
sudo apt install -y python3-django
sudo python3 -m pip install Django
sudo python3 -m pip install --upgrade Pillow #Library for images interface with DB
sudo python3 -m pip install django-crispy-forms #Library for management of django forms
sudo python3 -m pip install django-allauth

#################################################################################
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################
su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"

# Set IP address in environment
. /home/vagrant/set_ip_env.sh

# set the /etc/hosts file to match hostname
echo "10.0.2.15 stackprj stackprj.com" | sudo tee -a /etc/hosts

export TEAMREPO=/home/vagrant/2022-team01m

#Setup for DB connection
echo -e "[mysqld]" > /home/vagrant/.my.cnf
echo -e "[client]" >> /home/vagrant/.my.cnf
echo -e "host = 192.168.56.105" >> /home/vagrant/.my.cnf
echo -e "user = vagrant" >> /home/vagrant/.my.cnf
echo -e "password = 2022-team01m" >> /home/vagrant/.my.cnf
echo -e "database = team01m" >> /home/vagrant/.my.cnf

#Start Django server script
echo -e "cd ~/website" > /home/vagrant/runserver.sh
echo -e "python3 manage.py runserver 10.0.2.15:8000  > /dev/null 2>&1 &" >> /home/vagrant/runserver.sh
chmod u+x /home/vagrant/runserver.sh

#Stop Django server script
echo -e "pkill -f runserver" >> /home/vagrant/stopserver.sh
chmod u+x /home/vagrant/stopserver.sh

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
#################################################################################
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
