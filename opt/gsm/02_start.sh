#!/bin/bash
echo "Script started"
echo "23101 - 00000 - 00000 -  00dB - +00.0000 - +00.000 - " > /opt/gsm/tmp_fs/bts.log
echo "23102 - 00000 - 00000 -  00dB - +00.0000 - +00.000 - " >> /opt/gsm/tmp_fs/bts.log
echo "23103 - 00000 - 00000 -  00dB - +00.0000 - +00.000 - " >> /opt/gsm/tmp_fs/bts.log
echo "23106 - 00000 - 00000 -  00dB - +00.0000 - +00.000 - " >> /opt/gsm/tmp_fs/bts.log

for i in `ls /opt/gsm | grep clf$`; do 
 mv /opt/gsm/${i} /opt/gsm/${i}.tmp
 sort /opt/gsm/${i}.tmp > /opt/gsm/${i}
 rm -f /opt/gsm/${i}.tmp
done

while true; do
 /opt/gsm/get_bts.sh 2>/dev/null
 echo "" 
done
