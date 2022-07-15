#!/bin/bash

MIN_PALABRA=10000000000
MAX_PALABRA=0
PROM_PALABRA=0
CANT_PALABRAS=0

while read -r P;
do
  LINEA=$(echo "$P" | tr " " "\n")
  for PALABRA in $LINEA
  do
    if [ ${#PALABRA} -gt $MAX_PALABRA ];then
      MAX_PALABRA=${#PALABRA}
    fi
    if [ ${#PALABRA} -lt $MIN_PALABRA ];then
      MIN_PALABRA=${#PALABRA}
    fi
    CANT_PALABRAS=$((CANT_PALABRAS+1))
    PROM_PALABRA=$((PROM_PALABRA+${#PALABRA}))
  done
done < ./demo/data.txt

echo "============================================================================"
echo "ESTADISTICA:"
echo "============================================================================"
echo "MAX_PALABRA: " "$MAX_PALABRA" 
echo "MIN_PALABRA: " "$MIN_PALABRA" 
echo "PROM_PALABRA: " "$((PROM_PALABRA/CANT_PALABRAS))"
echo "============================================================================"