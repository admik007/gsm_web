#!/bin/bash
#stty -F /dev/ttyS0 -echo
#gpsd /dev/ttyS0 -nb -S 9999 -G -F /var/run/gpsd.sock
#gpsd /dev/ttyUSB0 -nb -S 9999 -G -F /var/run/gpsd.sock

rfcomm bind /dev/rfcomm0 00:02:76:C8:D9:C8
gpsd /dev/rfcomm0 -nb -S 9999 -G -F /var/run/gpsd.sock
