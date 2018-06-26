#!/bin/bash
firstFile=""
for file in /home/pi/nestpics/*
do
   echo $file
   if [ -z $firstFile ]
   then
      firstFile=$file
   else
        compare -metric MSE $firstFile $file null: > /dev/null 2>&1
        diff=$?
        case $diff in
            1)
                if [ ! -d "./output" ]
                then
                    mkdir -p /home/pi/output                    
                fi
                cp $file /home/pi/output
                firstFile=$file
                ;;
            *)
                echo "an unexpected error occured"
                ;;
        esac
        rm $file
   fi
done
