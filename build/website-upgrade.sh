#!/bin/bash
pkill -f runserver
python3 -m pip install django-ckeditor --upgrade
mv /home/vagrant/website website_old
cp -r /home/vagrant/2022-team01m/code/website /home/vagrant/website/
echo "Website migration completed. Run "./runserver.sh" to start the webserver"
