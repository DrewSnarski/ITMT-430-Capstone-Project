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
# Change the value of XX to be your team GitHub Repo
# Otherwise your clone operation will fail
# The command: su - vagrant -c switches from root to the user vagrant to execute
# the git clone command
##################################################################################
su - vagrant -c "git clone git@github.com:illinoistech-itm/2022-team01m.git"

#################################################################################
# Enable http in the firewall
# We will be using the systemd-firewalld firewall by default
# https://firewalld.org/
# https://firewalld.org/documentation/
# Enable http in the firewall
#################################################################################

sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload

###########################################
# Enable load-balancing and reverse proxy #
###########################################
sudo sed -i '/^http {/a \\n\tupstream django {\n\t\tleast_conn;\n\t\tip_hash;\n\t\tserver 192.168.56.102:8000;\n\t\tserver 192.168.56.103:8000;\n\t\tserver 192.168.56.104:8000;\n\t}\n' /etc/nginx/nginx.conf
sudo sed -i '/^server {/a \\tserver_name stackprj.com;' /etc/nginx/sites-enabled/default
sudo sed -i '/# First attempt/i \\t\tproxy_set_header Host $host;\n\t\tproxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\t\tproxy_set_header X-Forwarded-Proto $scheme;\n\t\tproxy_pass http://django;' /etc/nginx/sites-enabled/default
sudo sed -i '\%try_files $uri $uri/ =404;% s/^/#/' /etc/nginx/sites-enabled/default
