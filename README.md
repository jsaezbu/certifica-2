EJEMPLO DE USO:
UTILIZA EL SCRIPT INTERFACENOVA.SH PARA INTERACTUAR CON LA BLOCKCHAIN Y UTLIZA EL CONVERSOR.HTML
PARA CONVERTIR LA INFORMACIÓN RETORNADA POR LA BLOCKCHAIN
TANTO LAS SHELLS COMO EL HTML SE ENCUENTRAN EN LA CARPETA DOCUMENTOS

EL CONTRATO DESPLEGADO ES: erd1qqqqqqqqqqqqqpgqnqedff8xd00lr8p56fammwftypdh5d85md8qeu72h0
LA WALLET QUE EXPIDE CERTICADO ES : erd1vcvu48259xy2l6mavnymr6q5qpck79cuxlk63kh5cnvc8kdpmd8q6j63n2
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
