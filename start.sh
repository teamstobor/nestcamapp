#!/bin/bash
mkdir -p /usr/src/app/picam
python webServer.py --port 80 --dir /usr/src/app/picam > /dev/null 2>&1 &
python capturePic.py > /dev/null 2>&1 &

