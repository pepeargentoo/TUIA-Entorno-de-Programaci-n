#!/bin/bash

echo "============================================================================"
echo "Indicador estadístico de longitud de oraciones" 
echo "============================================================================"
MENOR=1000
PROM=0
CANT=0
MAYOR=0

readarray -d . -t PALA <<<"$(cat ./demo/data.txt)"  

for((n=0;n<${#PALA[*]};n++))
do
    if [ ${#PALA[n]} -lt $MENOR ];then
            MENOR=${#PALA[n]}
        fi
        if [ ${#PALA[n]} -gt $MAYOR ];then
            MAYOR=${#PALA[n]}
        fi
        CANT=$((CANT+1))
        PROM=$((PROM+${#PALA[n]}))
done
  echo "oración más corta:" "$MENOR"
  echo "oración mas larga: " "$MAYOR"
  echo "oración promedio: " $((PROM/CANT))
echo "============================================================================"
