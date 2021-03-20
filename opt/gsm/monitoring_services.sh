#!/bin/bash
GPS_RUNNING=`ps -ef | grep SCREEN | grep get_gps | wc -l`
if [ ${GPS_RUNNING} -eq "0" ]; then
 screen -S get_gps -dm python /opt/gsm/get_gps.py
 logger "Starting GPS"
fi

BTS_RUNNING=`ps -ef | grep SCREEN | grep get_bts | wc -l`
if [ ${BTS_RUNNING} -eq "0" ]; then
 screen -S get_bts -dm /opt/gsm/02_start.sh
 logger "Starting BTS"
fi

/opt/vc/bin/vcgencmd measure_temp > /opt/gsm/tmp_fs/cpu_temp.txt
