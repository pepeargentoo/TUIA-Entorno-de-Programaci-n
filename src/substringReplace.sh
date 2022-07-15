#!/bin/bash

echo "==========================================================="
echo "ingrese cadena1 "
read -r CADENA1
echo "ingrese cadena2 "
read -r CADENA2
echo "REEMPLAZAMOS:" "$CADENA1" " POR: " "$CADENA2"
echo "==========================================================="

TEXTO=$(cat ./demo/data.txt)

echo "${TEXTO//$CADENA1/"$CADENA2"}" 
echo "==========================================================="
