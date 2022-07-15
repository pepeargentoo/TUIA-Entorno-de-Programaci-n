#!/bin/bash
echo "============================================================================"
echo "texto original:"
cat ./demo/data.txt
echo "============================================================================"
echo "texto convertido:"
echo "============================================================================"
while read -r  P
do
TMP=""
LINEA=$(echo "$P" | tr " " "\n")
for PALABRA in $LINEA
  do
    TMP+=" "
    for i in  $(echo "$PALABRA" | fold -w1)
    do
      if [[ "$i" =~ [a-z] ]]; then
        TMP+="${i^^}"
      else
        if [[ "$i" =~ [A-Z] ]]; then
        TMP+="${i,}"
        else
          TMP+="$i"
        fi
      fi
    done
  done
  echo "$TMP"
done < ./demo/data.txt
echo "============================================================================"