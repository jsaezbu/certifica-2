#!/bin/bash

# Interfaz Bash para la gestión de certificados en MultiversX
# Utiliza mxpy para interactuar con el smart contract certificados_mvx
# Autor: Profesor de Informática
# Fecha: 2025

# ======================= CONFIGURACIÓN INICIAL =======================
CONTRACT_ADDRESS="erd1qqqqqqqqqqqqqpgqnqedff8xd00lr8p56fammwftypdh5d85md8qeu72h0"
PEM_PATH="$HOME/wallet2.pem"
PROXY="https://devnet-gateway.multiversx.com"
CHAIN="D"

# ======================= FUNCIÓN: Expedir un nuevo certificado =======================
expedir_certificado() {
  echo "Introduce el hash (huella) del certificado PDF (por ejemplo, SHA256):"
  read hash_certificado
  echo "Introduce la dirección de wallet del alumno (empieza por erd1...):"
  read direccion_alumno

  mxpy contract call $CONTRACT_ADDRESS \
    --pem $PEM_PATH \
    --proxy $PROXY \
    --chain $CHAIN \
    --function expedir_certificado \
    --arguments "str:$hash_certificado" addr:$direccion_alumno \
    --gas-limit 50000000 \
    --send

  echo "Certificado emitido (transacción enviada a la blockchain)."
}

# ======================= FUNCIÓN: Listar todos los hashes de certificados emitidos =======================
listar_certificados() {
  echo "Listando todos los hashes de certificados emitidos:"
  mxpy contract query $CONTRACT_ADDRESS \
    --function listar_certificados \
    --proxy $PROXY
}

# ======================= FUNCIÓN: Comprobar si un certificado es válido =======================
comprobar_certificado() {
  echo "Introduce el hash (huella) del certificado PDF a comprobar:"
  read hash_certificado

  mxpy contract query $CONTRACT_ADDRESS \
    --function es_certificado_valido \
    --arguments "str:$hash_certificado" \
    --proxy $PROXY
}

# ======================= FUNCIÓN: Listar certificados por wallet =======================
listar_por_wallet() {
  echo "Introduce la dirección de wallet del alumno (empieza por erd1...):"
  read direccion_alumno

  mxpy contract query $CONTRACT_ADDRESS \
    --function hashes_por_wallet \
    --arguments addr:$direccion_alumno \
    --proxy $PROXY
}

# ======================= MENÚ PRINCIPAL =======================
while true; do
  echo ""
  echo "===== Gestión de Certificados Blockchain (MultiversX) ====="
  echo "1. Expedir un nuevo certificado"
  echo "2. Listar todos los certificados emitidos"
  echo "3. Comprobar validez de un certificado"
  echo "4. Listar certificados de un alumno"
  echo "5. Salir"
  echo "Selecciona una opción:"
  read opcion

  case $opcion in
    1) expedir_certificado ;;
    2) listar_certificados ;;
    3) comprobar_certificado ;;
    4) listar_por_wallet ;;
    5) echo "¡Hasta luego!"; exit 0 ;;
    *) echo "Opción no válida, por favor elige 1-5." ;;
  esac
done
