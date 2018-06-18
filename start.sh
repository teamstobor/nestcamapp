#!/bin/bash
python -m SimpleHTTPServer 80 &
python timelapse.py &
