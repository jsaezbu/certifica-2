Aquest contracte conté les següents funcions:
EXPEDIR CERTIFICADO
mxpy contract call <DIRECCION_CONTRATO> \
  --pem path/to/tu_wallet.pem \
  --gas-limit=10000000 \
  --proxy=https://devnet-gateway.multiversx.com \
  --chain=D \
  --function=expedir_certificado \
  --arguments str:<HASH_CERTIFICADO> addr:<DIRECCION_ALUMNO> \
  --send
COMPROBAR CERTIFICADO ESTA EN LA BLOCKCHAIN  
mxpy contract query <DIRECCION_CONTRATO> \
  --function=es_certificado_valido \
  --arguments str:<HASH_CERTIFICADO> \
  --proxy=https://devnet-gateway.multiversx.com
LISTAR TODOS LOS CERTIFICADOS
mxpy contract query <DIRECCION_CONTRATO> \
  --function=listar_certificados \
  --proxy=https://devnet-gateway.multiversx.com
  
-----NOVA FUNCIÓ RESPECTE LA VERSIÓ ANTERIOR 
MOSTRAR CERTIFICADOS DE UNA WALLET EN CONCRETO
mxpy contract query <DIRECCION_CONTRATO> \
  --function=hashes_por_wallet \
  --arguments addr:<DIRECCION_ALUMNO> \
  --proxy=https://devnet-gateway.multiversx.com
