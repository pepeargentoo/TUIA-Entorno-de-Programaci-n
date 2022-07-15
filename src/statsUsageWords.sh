#!/bin/bash
#!/bin/bash

declare -A PALABRAS_MAS_USADAS
while read -r P;
do
  LINEA=$(echo "$P" | tr " " "\n")
  for PALABRA in $LINEA
  do
    if [ ${#PALABRA} -ge 4 ];then
      LIMPIO=$(echo "$PALABRA" | cut -d "," -f 1 )
      LIMPIO=$(echo "$LIMPIO" | cut -d ")" -f 1 )
      LIMPIO=$(echo "$LIMPIO" | cut -d "(" -f 2 )
      
      if [[ -v PALABRAS_MAS_USADAS["$LIMPIO"] ]]; then
        PALABRAS_MAS_USADAS[$LIMPIO]=$((PALABRAS_MAS_USADAS[$LIMPIO]+1))
      else  
        PALABRAS_MAS_USADAS[$LIMPIO]=0
      fi 
    fi
  done
done < ./demo/data.txt

echo "============================================================================"
echo "Top Ten de estas palabras:"
echo "============================================================================"
for K in "${!PALABRAS_MAS_USADAS[@]}"
do 
  echo $K ' - ' ${PALABRAS_MAS_USADAS["$K"]} 
done | sort -rn -k3 | head -n 10
echo "============================================================================"