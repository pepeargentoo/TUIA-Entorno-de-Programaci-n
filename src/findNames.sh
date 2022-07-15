#!/bin/bash

echo "================================================================================="
echo "Identificación de nombres propios (se identifican sólo si están "
echo "en este formato Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente."
echo "================================================================================"
cut -f1 -d' ' ./demo/data.txt | grep -E '^[A-Z][a-z]{3,}'
echo "================================================================================"
