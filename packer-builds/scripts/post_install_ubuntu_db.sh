#!/bin/bash
set -e
set -v

#################################################################################
# Install additional packages and dependencies here
# Make sure to leave the -y flag on the apt-get to auto accept the install
# Firewalld is required
#################################################################################

sudo apt-get install -y mariadb-server firewalld
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
IP=$(hostname -I | awk '{print $1}' | cut -d . -f3)

if [ $IP = 172 ]
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

#################################################################################
# Changing the mysql bind address with a script to listen for external
# connections
# This is important because mysql by default only listens on localhost and needs
# to be configured to listen for external connections
# https://serverfault.com/questions/584607/changing-the-mysql-bind-address-within-a-script
# https://en.wikipedia.org/wiki/Sed
#################################################################################

if [ $IP = 172 ]
then
  # Detect if we are in the Vagrant environement (third IP octet will be 56) or Proxmox environment -- will be 172
  # If using mysql instead of MariaDB the path to the cnf file is /etc/mysql/mysql.conf.d/mysql.cnf
  # The command: $(cat /etc/hosts | grep db | awk '{ print $1 }') will retrieve the IP address of the db from the /etc/hosts file, a bit of a hack...
  # sudo sed -i "s/.*bind-address.*/#bind-address = $(cat /etc/hosts | grep team-$NUMBER-db-vm0 | awk '{ print $1 }')/" /etc/mysql/mysql.conf.d/mysql.cnf
  # Kind of a hack....
  sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
else
  sudo sed -i "s/.*bind-address.*/bind-address = $(cat /etc/hosts | grep team-$NUMBER-db-vm0 | awk '{ print $1 }')/" /etc/mysql/mariadb.conf.d/50-server.cnf
fi

#################################################################################
# Using sed to replace placeholder variables in the code/db-samples/*.sql files
# with the USER variables passed from PACKER
# There isn't a cleaner way to do this but at least its verbose
#################################################################################
export TEAMREPO=/home/vagrant/2022-team01m/code/db
sed -i "s/\$ACCESSFROMIP/$ACCESSFROMIP/g" $TEAMREPO/*.sql
sed -i "s/\$USERPASS/$USERPASS/g" $TEAMREPO/*.sql
sed -i "s/\$USERNAME/$USERNAME/g" $TEAMREPO/*.sql
sed -i "s/\$DATABASE/$DATABASE/g" $TEAMREPO/*.sql

##################################################################################
# Create database and vagrant user (Greg E)                                             #
##################################################################################
sudo mysql < $TEAMREPO/create-database.sql
sudo mysql < $TEAMREPO/create-user.sql
sudo mysql $DATABASE < $TEAMREPO/database.sql

##################################################################################
# Secure the MariaDB (Greg E)                                             #
##################################################################################
mysql -sfu root <<EOS
-- set root password
UPDATE mysql.user SET Password=PASSWORD('$USERPASS') WHERE User='root';
-- delete anonymous users
DELETE FROM mysql.user WHERE User='';
-- delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- drop database 'test'
DROP DATABASE IF EXISTS test;
-- also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- make changes immediately
FLUSH PRIVILEGES;
EOS

#################################################################################
# Linux systemd Firewall - firewalld https://firewalld.org/
# Remember to open proper firewall ports
#################################################################################
# Open firewall port for port 3306/tcp
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
if [ $IP = 172 ]
then
  # (Proxmox) Open firewall port to allow only connections from 192.168.172.0/24
  sudo firewall-cmd --zone=public --add-source=192.168.172.0/24 --permanent
else
  # (Vagrant) Open firewall port to allow only connections from 192.168.56.0/24
  sudo firewall-cmd --zone=public --add-source=192.168.56.0/24 --permanent
fi
# Reload changes to firewall
sudo firewall-cmd --reload
