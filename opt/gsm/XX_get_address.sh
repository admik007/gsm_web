#!/bin/bash
LACE2="none"

for CLF in `ls | grep clf$ | grep 06`; do
 ADDRESS=`cat ${CLF} | cut -d ';' -f8 | egrep -v "no info|exchange" | sort | uniq | sed 's/ /_/g'`
 echo ${ADDRESS}
# for LACE1 in `cat ${CLF} | grep "${ADDRESS}" | cut -d ";" -f5,6`; do
# sleep 1
#  if [ "${LACE2}" == "none" ]; then
#   LACE2=${LACE1}
#   echo "LACE2 was none, is ${LACE2}"
#  else
#   echo ${LACE1}
#   echo ${LACE2}
#   if [ "${LACE2}" != "${LACE1}" ]; then
#    echo "Tu je zle"
#    cat ${CLF} | grep "${LACE1}"
#   fi
#  fi
# done
done

