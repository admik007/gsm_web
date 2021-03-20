#!/bin/bash
#LATLON="48.716526,21.209384"
#23106;07005;52702;00000;+48.727040;+21.241616;26;Festivalove Namestie 40|Kosice|GSM;0

DIR="/opt/gsm/"
for ID in `ls ${DIR} | grep clf$ | cut -d "." -f1`; do
 FILE="${ID}.clf"
 dos2unix ${FILE} > /dev/null 2>&1
 ADDRESS_LIST="address_list_${ID}.txt"
 NOW=`date +%Y%m%d_%H%I%S`
 cp ${FILE} bak/${FILE}.${NOW}
 echo "Work with ${ID}"
 OP='0'
 for ADDRESS in `cat ${ADDRESS_LIST}  | sed 's/ /_/g' | sort | uniq | cut -d ';' -f1`; do 
  ADDR=`echo ${ADDRESS} | sed 's/_/ /g'`
  GPS=`cat ${ADDRESS_LIST} | grep "${ADDR}" | sort | uniq | tr -d '+' | cut -d ';' -f2`
  for ROW in `cat ${FILE} | grep -i "${ADDR}" | sed 's/ /_/g'`; do 
   echo -n "."
   let OP++;
   DGPS=`echo "+"${GPS} | tr -d 'N' | tr -d 'E' | tr -d ' ' | sed 's/,/;+/g'`	# GPS from file clf, as source
   ROW=`echo ${ROW} | cut -d ';' -f1,2,3,4,5,6,7`
   DDATA1=`cat ${FILE} | grep -i "${ROW}" | cut -d ';' -f1,2,3,4`
   DDATA2=`cat ${FILE} | grep -i "${ROW}" | cut -d ';' -f7,8,9`
   DEST=`cat ${FILE} | grep -i "${ROW}" | cut -d ';' -f7`
   if [ "${ROW}" != "${DDATA1};${DGPS};${DEST}" ]; then 
    echo ""
    echo "Change GPS for ${DDATA2}"
#    echo "Source: ${ROW}"
#    echo "Destin: ${DDATA1};${DGPS};${DEST}"
    sed -i "/${ROW}/d" ${FILE}      # Delete line
    echo "${DDATA1};${DGPS};${DDATA2}" >> ${FILE} # Insert new line
   fi
  done
 done
 echo ""
 LINES=`cat ${FILE} | egrep -v "cell list|;0$" | wc -l`
 if [ ${LINES} -gt "1" ]; then
  echo "Errors for ${ID}: ${LINES}"
 fi
 echo "Total addresses for ${ID}: ${OP}"
 echo ""
done
date
