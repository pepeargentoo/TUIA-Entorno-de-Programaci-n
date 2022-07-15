#!/bin/bash

declare -A NUMEROS
while read -r p
do
  PALABRA=$(echo "$p" | tr " " "\n")
  for pal in $PALABRA
  do
    if [[ $pal =~ ^[-+]?[0-9]*$ ]] ;then
      if [[ ! -v NUMEROS["$pal"] ]]; then
        NUMEROS["$pal"]=0
      fi
    else
      if [[ $pal =~ ^[+-]?[0-9]+\,?[0-9]*$ ]] ;then
        PARTE_ENT=$(echo "$pal" | cut -d "," -f 1 )
        PARTE_DEC=$(echo "$pal" | cut -d "," -f 2)
        if [[ ! -v NUMEROS["$PARTE_ENT"] ]]; then
            NUMEROS["$PARTE_ENT"]=0
        fi

        if [[ ! -v NUMEROS["$PARTE_DEC"] ]]; then
            NUMEROS["$PARTE_DEC"]=0
        fi
        
      fi
    fi
    
  done
done < ./demo/data.txt

echo "==============================="
echo "lista de numeros en el texto:"
echo "==============================="
for key in $(for x in "${!NUMEROS[@]}"; do echo "$x"; done | sort); do
  echo "$key" 
done