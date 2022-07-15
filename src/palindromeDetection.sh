#!/bin/bash

echo "============================================================================"
echo "ingrese Palabra"
echo "============================================================================"
read -r PALABRA
PALINDROMO=$(echo "$PALABRA" | rev)
if [ "$PALABRA" = "$PALINDROMO" ];then
    echo "es palindromo"
else
    echo "no es un palindromo "
fi
echo "============================================================================"
