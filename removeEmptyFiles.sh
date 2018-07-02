#!/bin/bash
NUM_FILES=`find /home/pi/picam -size -100k -print | wc -l`
if [ $NUM_FILES -gt 0 ]
then
   find /home/pi/picam -size -100k -print | xargs rm 
fi
