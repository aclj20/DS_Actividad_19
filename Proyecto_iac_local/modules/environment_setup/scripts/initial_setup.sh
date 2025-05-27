#!/bin/bash
# Script: initial_setup.sh
ENV_NAME=$1
README_PATH=$2
echo "Ejecutando setup inicial para el entorno: $ENV_NAME"
echo "Fecha de setup: $(date)" > setup_log.txt
echo "Readme se encuentra en: $README_PATH" >> setup_log.txt
# Verificar si ya existe el archivo de control
if [ ! -f placeholder_control.txt ]; then
    echo "Creando archivo de control y placeholder..."
    touch placeholder_control.txt
    touch placeholder_$(date +%s).txt
else
    echo "Archivo de control ya existe. No se crean nuevos placeholders."
fi

echo "Setup inicial completado."
# Simular más líneas de código
for i in {1..20}; do
    echo "Paso de configuración simulado $i..." >> setup_log.txt
    # sleep 0.01 # Descomenta para simular trabajo
done
