#!/bin/bash
crontab crontab.nest
python -m SimpleHTTPServer 80 > /dev/null 2>&1 &

