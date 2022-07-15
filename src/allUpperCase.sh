#!/bin/bash

declare -A PALABRAS_LIST
while read -r p
do
  PALABRA=$(echo "$p" | tr " " "\n")
  for pal in $PALABRA
  do
    if [[ $pal =~ ^[A-Z]*$ ]] ;then
      if [[ ! -v PALABRAS_LIST["$pal"] ]]; then
        PALABRAS_LIST["$pal"]=0
      fi
    fi
  done
done < ./demo/data.txt

echo "============================================================================"
echo "Listar lexicográficamente las palabras que se presenten con todas sus letras
en mayúsculas:"
echo "============================================================================"
for key in $(for x in "${!PALABRAS_LIST[@]}"; do echo "$x"; done | sort)
do
  echo "$key" 
done