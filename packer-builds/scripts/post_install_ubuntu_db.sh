#!/bin/bash
set -e
set -v

#################################################################################
# Install additional packages and dependencies here
# Make sure to leave the -y flag on the apt-get to auto accept the install
# Firewalld is required
#################################################################################

sudo apt-get install -y mariadb-server firewalld

#################################################################################
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################

su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"

##################################################################################
# Create database and vagrant user (Greg E)                                             #
##################################################################################

sudo export TEAMREPO=/home/vagrant/2022-team01m
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sudo mysql < $TEAMREPO/build/create-database.sql
sudo mysql < $TEAMREPO/build/create-user.sql
sudo systemctl restart mariadb

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
#################################################################################

sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload
