#!/bin/bash
SRC="/home/tkovac/23101.clf"
DST="23101.clf"
for i in `cat ${SRC} | grep 23101 | cut -d ';' -f1,2,3`; do 
 S=`cat /home/tkovac/23101.clf | grep "${i}"`
 D=`cat ${DST} | grep "${i}"`
 if [ "${S}" != "${D}" ]; then
  DNR=`echo ${D} | wc -l`
  if [ "${DNR}" == "1" ]; then
   echo "${S}" >> ${DST}
  fi
#  echo "${S} - ${D}"
 fi
done

