#!/bin/bash

modprobe i2c-dev
modprobe v4l2_common

sudo systemctl start timelapse
