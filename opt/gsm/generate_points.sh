#!/bin/bash
TOTAL="0"
DIR="/opt/gsm/"

cd ${DIR}

for BTS in `ls ${DIR} | grep clf$ | grep 2310`; do
OP="0"
 echo "var latLong = [" > ${BTS}.txt.tmp
 chown www-data. ${BTS} ${BTS}.txt.tmp
 chmod 644 ${BTS} ${BTS}.txt.tmp
 for SURADNICE in `cat ${DIR}/${BTS} | egrep -v "//|\+0.000" | grep "+" | cut -d ';' -f2,5,6,8 | sed 's/ /_/g' | tr -d '\+' | sort | uniq`; do
#  echo "[\"`echo ${SURADNICE} | cut -d ';' -f1,4`\",`echo ${SURADNICE} | cut -d ';' -f2`,`echo ${SURADNICE} | cut -d ';' -f3`],"
  echo "[\"<b>`echo ${SURADNICE} | cut -d ';' -f1`</b><br>`echo ${SURADNICE} | cut -d ';' -f4`\",`echo ${SURADNICE} | cut -d ';' -f2`,`echo ${SURADNICE} | cut -d ';' -f3`]," >> ${BTS}.txt.tmp
  let TOTAL++;
  let OP++;
 done
 echo "[\"Default\",0.000000,0.000000]" >> ${BTS}.txt.tmp
 echo "];" >> ${BTS}.txt.tmp
 echo "${BTS} = ${OP}";
 mv ${BTS}.txt.tmp ${DIR}${BTS}.txt
done
echo "Total: ${TOTAL}";

