import errno
import os
import sys
import yaml

from datetime import datetime
from picamera import PiCamera
from time import sleep

config = yaml.safe_load(open(os.path.join(sys.path[0], "config.yml")))

output_dir = config['output_dir']

def create_output_dir(dir):
    try:
        if not os.path.exists(dir):
            os.makedirs(dir)
    except OSError as e:
        if e.errno != errno.EEXIST:
            raise


def set_camera_options(camera):
    # Set camera resolution.
    if config['resolution']:
        camera.resolution = (
            config['resolution']['width'],
            config['resolution']['height']
        )

    # Set ISO.
    if config['iso']:
        camera.iso = config['iso']

    # Set shutter speed.
    if config['shutter_speed']:
        camera.shutter_speed = config['shutter_speed']
        # Sleep to allow the shutter speed to take effect correctly.
        sleep(1)
        camera.exposure_mode = 'off'

    # Set white balance.
    if config['white_balance']:
        camera.awb_mode = 'off'
        camera.awb_gains = (
            config['white_balance']['red_gain'],
            config['white_balance']['blue_gain']
        )

    # Set camera rotation
    if config['rotation']:
        camera.rotation = config['rotation']

    return camera


def capture_image():
    try:
        # Start up the camera.
        camera = PiCamera()
        set_camera_options(camera)
        sleep(2)

        # Capture a picture.
        camera.capture(output_dir + '/image-' + datetime.now().strftime('%Y-%m-%d_%H-%M-%S') + '.jpg')
        camera.close()

    except KeyboardInterrupt, SystemExit:
        print '\nTime-lapse capture cancelled.\n'


create_output_dir(output_dir)

# Kick off the capture process.
capture_image()
