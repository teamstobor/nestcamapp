#!/bin/bash

modprobe i2c-dev
modprobe v4l2_common

sudo systemctl enable timelapse
sudo systemctl start timelapse
