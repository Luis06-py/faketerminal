#!/bin/bash

read -p "Username: " usuario
read -p "Servidor: " servidor
read -p "Directorio (dejar vacío para ~): " directorio
if [[ -z "$directorio" ]]; then
    directorio="~"
fi

echo -ne "\033]0;${usuario}@${servidor}: ${directorio}\007"

read -p "Input: " entrada

VERDE="\e[32m"
AZUL="\e[34m"
BLANCO="\e[0m"

lineas=()

while true; do
    read -p "> " linea

    if [[ "$linea" == "nada" ]]; then
        lineas+=("")
    elif [[ -z "$linea" ]]; then
        clear
        echo -e "${VERDE}${usuario}@${servidor}${BLANCO}:${AZUL}${directorio}${BLANCO}\$ ${entrada}"
        for l in "${lineas[@]}"; do
            echo "$l"
        done
    else
        lineas+=("$linea")
    fi
done
