#!/bin/bash
systemctl daemon-reload
systemctl enable capture-image.timer
systemctl start capture-image.timer
systemctl enable process-images.timer
systemctl start process-images.timer
python -m SimpleHTTPServer 80 > /dev/null 2>&1 &
journalctl -f
