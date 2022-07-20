#!/bin/bash
while true
do
    while true
    do
        echo "============================================================================"
        echo "               MENU                     "
        echo "============================================================================"
        echo "1. statsWords.sh"
        echo "2. statsUsageWords.sh"
        echo "3. findNames.sh"
        echo "4. statsSentences.sh"
        echo "5. blankLinesCounter.sh"
        echo "6. caseConverter.sh"
        echo "7. substringReplace.sh"
        echo "8. blockSelection.sh"
        echo "9. palindromeDetection.sh"
        echo "10. oneVowelWords.sh"
        echo "11. allUpperCase.sh"
        echo "12. allVowelsInWord.sh"
        echo "13. mailAddressDetection.sh"
        echo "14. integerDetection.sh"
        echo "15. salir"
        echo "============================================================================"
        echo "Selecione una opcion"
        echo "============================================================================"
        read -r OP
        NUMERO="^-?[0-9]+([.][0-9]+)?$"
        if [[ $OP =~ $NUMERO ]]; then
            if [[ "$OP" -ge 1  &&  "$OP" -le 15 ]]; then
                break
            fi
        fi
    done

    if [ "$OP" -eq 15 ]; then
        echo "============================================================================"
        echo "              ADIOS                     "
        echo "============================================================================"
        break
    fi

    case "$OP" in
        1)
            bash ./src/statsWords.sh
            ;;
        2)
            bash ./src/statsUsageWords.sh
            ;;
        3)
            bash ./src/findNames.sh
            ;;
        4)
            bash ./src/statsSentences.sh
            ;;
        5)
            bash ./src/blankLinesCounter.sh
            ;;
        6)
            bash ./src/caseConverter.sh
            ;;
        7)
            bash ./src/substringReplace.sh
            ;;
        8)
            bash ./src/blockSelection.sh
            ;;
        9)
            bash ./src/palindromeDetection.sh
            ;;
        10)
            bash ./src/oneVowelWords.sh
            ;;
        11)
            bash ./src/allUpperCase.sh
            ;;
        12)
            bash ./src/allVowelsInWord.sh
            ;;
        13)
            bash ./src/mailAddressDetection.sh
            ;;
        14)
            bash ./src/integerDetection.sh
            ;;
    esac
done
exit 0
