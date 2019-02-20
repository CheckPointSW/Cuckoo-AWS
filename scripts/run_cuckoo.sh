#!/bin/bash
cd /home/ubuntu/.cuckoo
sudo supervisord -c /home/ubuntu/.cuckoo/supervisord.conf
sleep 10
sudo supervisorctl start cuckoo-webserver
