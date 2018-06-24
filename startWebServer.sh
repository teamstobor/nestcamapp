#!/bin/bash
cd /etc/systemd/system 
systemctl start capture-image.timer 
systemctl start process-images.timer
cd ~
python -m SimpleHTTPServer 80 > /dev/null 2>&1 &
