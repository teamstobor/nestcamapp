#!/usr/bin/env python

import subprocess

def main():
    # Get the current SSID
    SSID = None
    try:
        SSID = subprocess.check_output(["iwgetid", "-r"]).strip()
    except subprocess.CalledProcessError:
        # If there is no connection subprocess throws a 'CalledProcessError'
        pass

    # Show status on the LCD display
    if SSID is None:
        print("No SSID found")
    else:
        print("SSID = " + SSID)


if __name__ == "__main__":
    main()