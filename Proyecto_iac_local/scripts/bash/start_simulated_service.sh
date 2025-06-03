#!/bin/bash
APP_NAME=$1
INSTALL_PATH=$2
CONFIG_FILE=$3

echo "--- Iniciando servicio simulado: $APP_NAME ---"
echo "Ruta de instalación: $INSTALL_PATH"
echo "Archivo de configuración: $CONFIG_FILE"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: Archivo de configuración no encontrado: $CONFIG_FILE"
  exit 1
fi

PID_FILE="$INSTALL_PATH/${APP_NAME}.pid"
LOG_FILE="$INSTALL_PATH/logs/${APP_NAME}_startup.log"

echo "Simulando inicio de $APP_NAME a las $(date)" >> "$LOG_FILE"
# Simular más líneas de logging y operaciones
for i in {1..25}; do
    echo "Paso de arranque $i: verificando sub-componente $i..." >> "$LOG_FILE"
    # sleep 0.01 # Descomenta para simular tiempo
done

# Crear un archivo PID simulado
echo $$ > "$PID_FILE"
echo "Servicio $APP_NAME 'iniciado'. PID guardado en $PID_FILE" >> "$LOG_FILE"
echo "Servicio $APP_NAME 'iniciado'. PID: $(cat $PID_FILE)"
echo "--- Fin inicio servicio $APP_NAME ---"

# 
if [ "$APP_NAME" == "database_connector_v1.0.0" ]; then
  LOCK_FILE="$INSTALL_PATH/.db_lock"
  if [ -f "$LOCK_FILE" ]; then
    echo "Archivo .db_lock ya existía en: $LOCK_FILE" >> "$LOG_FILE"
  else
    touch "$LOCK_FILE"
    echo "Archivo .db_lock creado en: $LOCK_FILE" >> "$LOG_FILE"
  fi
fi

