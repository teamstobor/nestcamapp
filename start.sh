#!/bin/bash
modprobe i2c-dev
modprobe v4l2_common

# Run one process loop
python process.py

# Start resin-wifi-connect
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
./wifi-connect

python -m SimpleHTTPServer 80 stream.py &

