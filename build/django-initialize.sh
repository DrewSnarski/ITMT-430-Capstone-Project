# Build Scripts for Automation

#!/bin/bash
set -e
set -v

# Create Django tables in the db
cd /home/vagrant/website/
python3 manage.py migrate

# Create Django superuser
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('vagrant', 'vagrant@iit.edu', '2022-team01m')" | python3 manage.py shell
