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
# Update /etc/hosts file
#################################################################################

echo "192.168.56.101     lb    lb.class.edu"    | sudo tee -a /etc/hosts
echo "192.168.56.102     ws1   ws1.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.103     ws2   ws2.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.104     ws3   ws3.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.105     db    db.class.edu"    | sudo tee -a /etc/hosts

#################################################################################
# Code to use a decision tree to determine the ws IP and changing the hostname
# accordingly
#################################################################################
IP=$(hostname -I | awk '{print $2}')

if [ $IP == '192.168.56.102' ]
    then
        sudo hostnamectl set-hostname ws1
elif [ $IP == '192.168.56.103' ]
    then
        sudo hostnamectl set-hostname ws2
elif [ $IP == '192.168.56.104' ]
    then
        sudo hostnamectl set-hostname ws3
fi

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

# Set IP address in environment
#. /home/vagrant/set_ip_env.sh

# set the /etc/hosts file to match hostname
echo "10.0.2.15 stackprj stackprj.com" | sudo tee -a /etc/hosts

export TEAMREPO=/home/vagrant/2022-team01m

#Setup for DB connection
echo "[mysqld]" > /home/vagrant/.my.cnf
echo "[client]" >> /home/vagrant/.my.cnf
echo "host = 192.168.56.105" >> /home/vagrant/.my.cnf
echo "user = $USERNAME" >> /home/vagrant/.my.cnf
echo "password = $USERPASS" >> /home/vagrant/.my.cnf
echo "database = $DATABASE" >> /home/vagrant/.my.cnf

##########################################
# Need to mv the Django code to homebase #
##########################################
cp -r /home/vagrant/2022-team01m/code/website /home/vagrant/
#cp /home/vagrant/2022-team01m/build/django-initialize.sh.txt /home/vagrant/django-initialize.sh
#chmod u+x /home/vagrant/django-initialize.sh


#Start Django server script
echo "cd ~/website" > /home/vagrant/runserver.sh
echo "python3 manage.py runserver 0.0.0.0:8000  > /dev/null 2>&1 &" >> /home/vagrant/runserver.sh
chmod u+x /home/vagrant/runserver.sh

#Stop Django server script
echo "pkill -f runserver" >> /home/vagrant/stopserver.sh
chmod u+x /home/vagrant/stopserver.sh

# Fix vagrant file permissions
sudo chown -R vagrant:vagrant /home/vagrant/.*

# Add Django start to crontab for autostart on boot
#su - vagrant -c "(crontab -l ; echo "@reboot /home/vagrant/runserver.sh") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -"

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
#################################################################################
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
