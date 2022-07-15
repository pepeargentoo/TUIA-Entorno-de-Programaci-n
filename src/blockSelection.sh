#!/bin/bash

while true
do
    echo "Selección de oración y/o párrafo"
    echo "O) oración"
    echo "P) parrafo"
    read -r OP
    if [ "${OP^^}" = "O" ] || [ "${OP^^}" = "P" ];then
        while true
        do
            echo "Ingrese numero "
            read -r NUM
            if [[ "$NUM" =~ ^[0-9]+$ ]];then
                break
            else
                echo "debe ingresar un numero"   
            fi
        done        
        break
        else
            echo "ingrese una opcion valida"
    fi
done
NUM=$((NUM-1))
if [ "$OP" = "P" ]; then
    PARRAFO=""
    ARRAYPARRAFO=()
    while IFS= read -r line;
    do
        if [[ ${line:${#line}-1:1} == '.' ]]; then
            PARRAFO=$PARRAFO$line
            ARRAYPARRAFO+=("$PARRAFO")
            PARRAFO=""
        else
            PARRAFO=$PARRAFO$line$" "
        fi
    done < ./demo/data.txt
    if [ $NUM -gt ${#ARRAYPARRAFO[*]} ]; then
        echo "EL TEXTO TIENE : " ${#ARRAYPARRAFO[*]}    
    else
        for i in "${!ARRAYPARRAFO[@]}"; do
            if [ "$i" -eq $NUM ];then
                echo "${ARRAYPARRAFO[$i]}"
                break
            fi 
        done
    fi
    else
    readarray -d . -t ORACION <<<"$(cat ./demo/data.txt)"
    if [ $NUM -gt ${#ORACION[*]} ]; then
        echo "EL TEXTO TIENE : " ${#ORACION[*]}    
    else
        for (( n=0; n < ${#ORACION[*]}; n++ ))  
        do  
            if [ $NUM -eq "$n" ];then
                echo "ORACION: " "${ORACION[n]}"
                break 
            fi
        done 
    fi
fi
