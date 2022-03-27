#!/bin/bash
set -e
set -v

# Command to create a service handler and start that javascript app at boot time
cd /home/vagrant/website
pm2 startup
# The pm2 startup command generates this command
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u vagrant --hp /home/vagrant
pm2 start stackprj.json
pm2 save
pm2 stop stackprj.json
