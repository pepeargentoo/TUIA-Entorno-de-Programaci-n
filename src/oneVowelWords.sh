#!/bin/bash

declare -A PALABRAS_CONVOCALES
while read -r p;
do
  PALABRA=$(echo "$p" | tr " " "\n")
  for pal in $PALABRA
  do
    if [[ ${#pal} -gt 4 ]] ;then
      CON_A=$(echo "$pal" | grep  -E '[A|a]' | grep -v '[e|E]' | grep -v '[i|I]' | grep -v '[o|O]' | grep -v '[u|U]' | tr " " "\n")
      for a in $CON_A
      do
        if [[ ! -v PALABRAS_CONVOCALES["$a"] ]]; then
            PALABRAS_CONVOCALES["$a"]=0
        fi
      done
      
      CON_E=$(echo "$pal" | grep  -v '[A|a]' | grep -E '[e|E]' | grep -v '[i|I]' | grep -v '[o|O]' | grep -v '[u|U]' | tr " " "\n")
      for e in $CON_E
      do
        if [[ ! -v PALABRAS_CONVOCALES["$e"] ]]; then
            PALABRAS_CONVOCALES["$e"]=0
        fi
      done
      
      CON_I=$(echo "$pal" | grep  -v '[A|a]' | grep -v '[e|E]' | grep -E '[i|I]' | grep -v '[o|O]' | grep -v '[u|U]' | tr " " "\n")
      for i in $CON_I
      do
        if [[ ! -v PALABRAS_CONVOCALES["$i"] ]]; then
            PALABRAS_CONVOCALES["$i"]=0
        fi
      done
      
      CON_O=$(echo "$pal" | grep  -v '[A|a]' | grep -v '[e|E]' | grep -v '[i|I]' | grep -E '[o|O]' | grep -v '[u|U]' | tr " " "\n")
      for o in $CON_O
      do
        if [[ ! -v PALABRAS_CONVOCALES["$o"] ]]; then
            PALABRAS_CONVOCALES["$o"]=0
        fi
      done

      CON_U=$(echo "$pal" | grep  -v '[A|a]' | grep -v '[e|E]' | grep -v '[i|I]' | grep -v '[o|O]' | grep -E '[u|U]' | tr " " "\n")
      for u in $CON_U
      do
        if [[ ! -v PALABRAS_CONVOCALES["$u"] ]]; then
            PALABRAS_CONVOCALES["$u"]=0
        fi
      done
    fi
  done
done < ./demo/data.txt
echo "======================================================"
echo "Lista de palabras que tengan una sola vocal diferente:"
echo "======================================================"

for key in $(for x in "${!PALABRAS_CONVOCALES[@]}"; do echo "$x"; done | sort); do
  echo "$key" 
done
echo "======================================================"
