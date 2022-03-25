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
# Update /etc/hosts file
#################################################################################

echo "192.168.56.101     lb    lb.class.edu"    | sudo tee -a /etc/hosts
echo "192.168.56.102     ws1   ws1.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.103     ws2   ws2.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.104     ws3   ws3.class.edu"   | sudo tee -a /etc/hosts
echo "192.168.56.105     db    db.class.edu"    | sudo tee -a /etc/hosts

#################################################################################
# Set hostname
#################################################################################
sudo hostnamectl set-hostname db

#################################################################################
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################

su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"

#sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sudo sed -i "s/.*bind-address.*/bind-address = $(cat /etc/hosts | grep db | awk '{ print $1 }')/" /etc/mysql/mariadb.conf.d/50-server.cnf

#################################################################################
# Using sed to replace placeholder variables in the code/db-samples/*.sql files
# with the USER variables passed from PACKER
# There isn't a cleaner way to do this but at least its verbose
#################################################################################
export TEAMREPO=/home/vagrant/2022-team01m
sed -i "s/\$ACCESSFROMIP/$ACCESSFROMIP/g" $TEAMREPO/build/*.sql
sed -i "s/\$USERPASS/$USERPASS/g" $TEAMREPO/build/*.sql
sed -i "s/\$USERNAME/$USERNAME/g" $TEAMREPO/build/*.sql
sed -i "s/\$DATABASE/$DATABASE/g" $TEAMREPO/build/*.sql
cat $TEAMREPO/build/create-database.sql
cat $TEAMREPO/build/create-user.sql
head $TEAMREPO/build/database.sql

##################################################################################
# Create database and vagrant user (Greg E)                                             #
##################################################################################
sudo mysql < $TEAMREPO/build/create-database.sql
sudo mysql < $TEAMREPO/build/create-user.sql
sudo mysql $DATABASE < $TEAMREPO/build/database.sql

#################################################################################
# Linux systemd Firewall - firewalld https://firewalld.org/
# Remember to open proper firewall ports
#################################################################################
# Open firewall port for port 3306/tcp
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
# Open firewall port to allow only connections from 192.168.56.0/24
sudo firewall-cmd --zone=public --add-source=192.168.56.0/24 --permanent
# Reload changes to firewall
sudo firewall-cmd --reload
