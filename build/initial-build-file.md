# Build Scripts for Automation

#!/bin/bash
set -e
set -v

# Install mysqldb
export DEBIAN_FRONTEND=noninteractive
sudo  debconf-set-selections <<< "mysql-server mysql-server/root_password password 2022-team01m"
sudo  debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 2022-team01m"
sudo apt-get update
sudo apt-get install -y mysql-server

# Enable the service
sudo systemctl start mysql

# Inject the username and password for autologin later in a ~/.my.cnf file
# http://serverfault.com/questions/103412/how-to-change-my-mysql-root-password-back-to-empty/103423#103423
# https://stackoverflow.com/questions/8020297/mysql-my-cnf-file-found-option-without-preceding-group
#echo -e "[mysqld]" > /root/.my.cnf
#echo -e "\n\n[client]\nuser = root\npassword = $DBPASS" >> /root/.my.cnf
#echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /root/.my.cnf

# contents of create-database.sql
# CREATE DATABASE team01m DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
sudo mysql -u root -p < create-database.sql


# Front-end script
#Install PIP
#Install pre-reqs
sudo apt install -y python3-pip
python3 -m pip install --upgrade pip
sudo apt-get install -y python3-dev
sudo apt-get install -y default-libmysqlclient-dev
sudo apt-get install -y build-essential
python3 -m pip install mysqlclient

#Setup for DB connection
echo "[client]" >> /home/vagrant/.my.cnf
echo "host = 10.0.2.15" >> /home/vagrant/.my.cnf
echo "user = root" >> /home/vagrant/.my.cnf
echo "password = 2022-team01m" >> /home/vagrant/.my.cnf
echo "database = my_db" >> /home/vagrant/.my.cnf

#Django installs
sudo apt install python3-django
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB
