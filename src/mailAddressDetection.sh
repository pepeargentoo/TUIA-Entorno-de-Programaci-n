#!/bin/bash

declare -A EMAILS
while read -r p;
do
  PALABRA=$(echo "$p" | tr " " "\n")
  for pal in $PALABRA
  do
    if [[ $pal =~ ^[A-Za-z0-9._%+-]+@[A-Za-z]+\.[A-Za-z]{2,4}$ ]] ;then
      if [[ ! -v EMAILS["$pal"] ]]; then
        EMAILS["$pal"]=0
      fi
    fi
  done
done < ./demo/data.txt

echo "============================================================================"
echo "lista de emails en el texto:"
echo "============================================================================"

for key in $(for x in "${!EMAILS[@]}"; do echo "$x"; done | sort); do
  echo "$key" 
done