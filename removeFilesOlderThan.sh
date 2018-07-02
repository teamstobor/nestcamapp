#!/bin/bash
NUM_FILES=`find /home/pi/picam -mmin +$1 -print | wc -l`
if [ $NUM_FILES -gt 0 ]
then
   find /home/pi/picam -mmin +$1 -print | xargs rm
fi
