#!/bin/bash

# Crear el directorio si no existe
mkdir -p /home/vagrant/parcial1

# Crear el archivo con información del sistema y guardar en informacion_sistema.txt
cat << EOF | tee /home/vagrant/parcial1/informacion_sistema.txt
Mi IP Publica es: $(curl -s ifconfig.me)
Mi usuario es: $(whoami)
El Hash de mi usuario es: $(sudo grep $USER /etc/shadow | awk -F ':' '{ print $2}')
La URL de mi repositorio es: $(git remote get-url origin)
EOF
