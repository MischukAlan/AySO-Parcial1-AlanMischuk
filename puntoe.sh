#!/bin/bash
# Obtener el total de la memoria RAM y guardarlo en Filtro_Basico.txt
cat /proc/meminfo | grep MemTotal > Filtro_Basico.txt

# Obtener el fabricante del chassis y subirllo a Filtro_Basico.txt
sudo dmidecode -t chassis | grep Manufacturer >> Filtro_Basico.txt

cat Filtro_Basico.txt
