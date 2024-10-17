#!/bin/bash

# Creación de grupos secundarios
sudo groupadd grupoprogramadores
sudo groupadd grupotester
sudo groupadd grupoanalistas
sudo groupadd grupodisenadores

# Crear usuarios y agregar grupos secu
sudo useradd -m -G grupoprogramadores programadores
sudo useradd -m -G grupotester tester
sudo useradd -m -G grupoanalistas analistas
sudo useradd -m -G grupodisenadores disenadores

# -m crea el home y el -G asigna al grupo secu

# Mostrar la lista de usuarios y grupos para verificar

groups programadores
groups tester
groups analistas
groups disenadores


# Ajustar permisos

chmod -R 750 examenes/alumno_1
chmod -R 770 examenes/alumno_2
chmod -R 750 examenes/alumno_3
chmod -R 775 examenes/profesores
	

sudo chown -R programadores:grupoprogramadores examenes/alumno_1
sudo chown -R tester:grupotester examenes/alumno_2
sudo chown -R analistas:grupoanalistas examenes/alumno_3
sudo chown -R disenadores:grupodisenadores examenes/profesores



# Crear archivos validar.txt
echo "Usuario: $(whoami)" > examenes/alumno_1/validar.txt
echo "Usuario: $(whoami)" > examenes/alumno_2/validar.txt
echo "Usuario: $(whoami)" > examenes/alumno_3/validar.txt
echo "Usuario: $(whoami)" > examenes/profesores/validar.txt

# Verificar permisos para escribir
if [ ! -w examenes/alumno_1 ]; then
    echo "Usuario: $(whoami)" > ~/AySO-Parcial1-AlanMischuk/validar.txt
fi
