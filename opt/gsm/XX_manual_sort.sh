#!/bin/bash
for i in `ls /opt/gsm | grep clf$`; do
 mv /opt/gsm/${i} /opt/gsm/${i}.tmp
 sort /opt/gsm/${i}.tmp > /opt/gsm/${i}
 rm -f /opt/gsm/${i}.tmp
done

