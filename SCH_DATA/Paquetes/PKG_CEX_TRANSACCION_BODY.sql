CREATE OR REPLACE PACKAGE BODY TECH1.PKG_CEX_TRANSACCION IS

	PROCEDURE prHACER_TRANSACCION (
		ircTRANSACCION IN OUT nocopy TY_TRANSACCION,
		idERROR OUT NUMBER,
		MSG OUT VARCHAR2
	) IS
	
		rcTRANSACCION PKG_TRANSACCION.tyrcTRANSACCION;
		
	BEGIN
        -- Mapeo de tipo de entrada a tipo declarado internamente
        rcTRANSACCION.cuenta_origen := ircTRANSACCION.cuenta_origen;
        rcTRANSACCION.cuenta_destino := ircTRANSACCION.cuenta_destino;
        rcTRANSACCION.monto_transaccion := ircTRANSACCION.monto_transaccion;
        rcTRANSACCION.sucursal_transaccion := ircTRANSACCION.sucursal_transaccion;
    
        -- Invoca capa negocio
        PKG_CLN_TRANSACCION.prHACER_TRANSACCION(rcTRANSACCION);
        idERROR := 0;
        MSG := 'Transacción realizada con éxito.';
		
	EXCEPTION
        -- Validar manejo de excepciones en el resto de capas y personalizar errores
        WHEN OTHERS THEN
            idERROR := 1;
            MSG := 'Error al realizar la transacción. PERSONALIZAR MSG SEGÚN ERRORES';

	END prHACER_TRANSACCION;
END PKG_CEX_TRANSACCION;