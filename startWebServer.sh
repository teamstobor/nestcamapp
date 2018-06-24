#!/bin/bash
systemctl daemon-reload
systemctl enable capture-image
systemctl start capture-image
systemctl enable process-images
systemctl start process-images
python -m SimpleHTTPServer 80 > /dev/null 2>&1 &
journalctl -f
