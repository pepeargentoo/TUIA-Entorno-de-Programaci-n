#!/bin/bash

echo "============================================================================"
echo "Indicador estadístico de longitud de oraciones" 
echo "============================================================================"
MENOR=1000
PROM=0
CANT=0
MAYOR=0
while read -r P;
  do  
  if [ ${#P} -gt 0 ];then
    TMP=${#P}
    if [ "$TMP" -gt "$MAYOR" ];then
        MAYOR=$TMP
    fi

    if [ "$TMP" -lt $MENOR ];then
      MENOR=$TMP
    fi
    PROM=$((PROM+${#P}))
    CANT=$((CANT+1))
  fi
  done < ./demo/data.txt

  echo "oración más corta:" "$MENOR"
  echo "oración mas larga: " "$MAYOR"
  echo "oración promedio: " $((PROM/CANT))
echo "============================================================================"