#!/bin/bash

# Muestro los discos
lsblk 

# Crear particiones en el disco /dev/sdc
(echo n; echo p; echo 1; echo; echo +2.5G; # Primera partición primaria
 echo n; echo p; echo 2; echo; echo +2.5G; # Segunda partición primaria
 echo n; echo p; echo 3; echo; echo +2.5G; # Tercera partición primaria
 echo n; echo e; echo 4; echo; echo; # Partición extendida
 echo w) | sudo fdisk /dev/sdc

echo "se crearon las particiones"

# Formatear las particiones
sudo mkfs.ext3 /dev/sdc1
sudo mkfs.ext3 /dev/sdc2
sudo mkfs.ext3 /dev/sdc3

echo "se formatearon los discos"

# Crear puntos de montaje
sudo mkdir -p /mnt/particion1
sudo mkdir -p /mnt/particion2
sudo mkdir -p /mnt/particion3

echo "Se crearon los directorios de montaje"

# Montar las particiones
sudo mount /dev/sdc1 /mnt/particion1
sudo mount /dev/sdc2 /mnt/particion2
sudo mount /dev/sdc3 /mnt/particion3

echo "Se montaron las particiones"

lsblk 

echo "Funciono"


