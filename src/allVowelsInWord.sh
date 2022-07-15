#!/bin/bash

declare -A PALABRAS_LIST
while read -r p;
do
  PALABRA=$(echo "$p" | tr " " "\n")
  for pal in $PALABRA
  do
    CON_VOCALES=$(echo "$pal" | grep  -E '[A|a]' | grep -E '[e|E]' | grep -E '[i|I]' | grep -E '[o|O]' | grep -E '[u|U]' | tr " " "\n")
      for u in $CON_VOCALES
      do
        if [[ ! -v PALABRAS_LIST["$u"] ]]; then
            PALABRAS_LIST["$u"]=1
        else
            PALABRAS_LIST["$u"]=$((PALABRAS_LIST[$u]+1))
        fi
      done
  done
done < ./demo/data.txt

echo "============================================================================"
echo "Mostrar palabras que tengan todas las vocales incluidas al menos una vez:"
echo "============================================================================"

for key in $(for x in "${!PALABRAS_LIST[@]}"; do echo "$x"; done | sort)
do
  echo "$key" '('${PALABRAS_LIST["$key"]}')'
done
echo "============================================================================"