#!/bin/bash
# Script: initial_setup.sh
ENV_NAME=$1
README_PATH=$2
WORKING_DIR=$(dirname "$README_PATH")
COUNTER_FILE="$WORKING_DIR/execution_counter.txt"
echo "Ejecutando setup inicial para el entorno: $ENV_NAME"
echo "Fecha de setup: $(date)" > "$WORKING_DIR/setup_log.txt"
echo "Readme se encuentra en: $README_PATH" >> "$WORKING_DIR/setup_log.txt"
cd "$WORKING_DIR"
if [ ! -f placeholder_control.txt ]; then
    echo "Creando archivo de control y placeholder..."
    touch placeholder_control.txt
    touch placeholder_$(date +%s).txt
    # Incrementar el contador de ejecuciones
    if [ -f "$COUNTER_FILE" ]; then
        COUNT=$(cat "$COUNTER_FILE")
        COUNT=$((COUNT + 1))
    else
        COUNT=1
    fi
    echo "$COUNT" > "$COUNTER_FILE"
    echo "Contador de ejecución actualizado: $COUNT"
else
    echo "Archivo de control ya existe. No se crean nuevos archivos ni se incrementa el contador."
fi
echo "Setup inicial completado."
for i in {1..20}; do
    echo "Paso de configuración simulado $i..." >> "$WORKING_DIR/setup_log.txt"
done
