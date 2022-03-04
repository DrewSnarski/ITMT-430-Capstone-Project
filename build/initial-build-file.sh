# Build Scripts for Automation

#!/bin/bash
set -e
set -v

# Set IP address in environment
. ~/set_ip_env.sh

# set the /etc/hosts file to match hostname
echo "$IP_ADDR stackprj stackprj.com" | sudo tee -a /etc/hosts

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
#echo -e "\n\n[client]\nuser = root\npassword = 2022-team01m" >> /root/.my.cnf
#echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /root/.my.cnf
echo -e "[mysql]" > ~/.my.cnf
echo -e "user = root\npassword = 2022-team01m" >> ~/.my.cnf
echo -e "host = $IP_ADDR" >> ~/.my.cnf
echo -e "\n[mysqldump]" >> ~/.my.cnf
echo -e "user = root\npassword = 2022-team01m" >> ~/.my.cnf

# contents of create-database.sql
# CREATE DATABASE team01m DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
chmod u+r create-database.sql
mysql < create-database.sql
# Change mysql bind address
sudo sed -i "s/.*bind-address.*/bind-address = $IP_ADDR/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Create vagrant user
# contents of create-user.sql
# CREATE USER 'vagrant'@'localhost' IDENTIFIED BY '2022-team01m';
# GRANT ALL PRIVILEGES ON team01m.* TO 'vagrant'@'localhost' WITH GRANT OPTION;
# CREATE USER 'vagrant'@'%' IDENTIFIED BY '2022-team01m';
# GRANT ALL PRIVILEGES ON team01m.* TO 'vagrant'@'%' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
chmod u+rx create-user.sql
mysql < create-user.sql

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
#echo -e "[mysqld]" > ~/.my.cnf
#echo -e "[client]" >> ~/.my.cnf
#echo -e "host = $IP_ADDR" >> ~/.my.cnf
#echo -e "user = root" >> ~/.my.cnf
#echo -e "password = 2022-team01m" >> ~/.my.cnf
#echo -e "database = team01m" >> ~/.my.cnf
#chmod u+r ~/.my.cnf

#Django installs
sudo apt install -y python3-django
python3 -m pip install Django
python3 -m pip install --upgrade Pillow #Library for images interface with DB
python3 -m pip install django-crispy-forms #Library for management of django forms
python3 -m pip install django-allauth

##########################################
# Need to mv the Django code to homebase #
##########################################

# Create Django tables in the db
python3 manage.py migrate

# Create Django superuser
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('vagrant', 'vagrant@iit.edu', '2022-team01m')" | python3 manage.py shell

#Start Django server script
echo -e "cd ~/website" > runserver.sh
echo -e "python3 manage.py runserver $IP_ADDR:8000  > /dev/null 2>&1 &" >> runserver.sh
chmod u+rx runserver.sh

#Stop Django server script
echo -e "pkill -f runserver" >> stopserver.sh
chmod u+rx stopserver.sh

./runserver.sh &
