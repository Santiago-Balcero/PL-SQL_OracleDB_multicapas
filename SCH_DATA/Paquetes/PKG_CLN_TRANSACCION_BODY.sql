CREATE OR REPLACE PACKAGE BODY TECH1.PKG_CLN_TRANSACCION IS

	PROCEDURE prHACER_TRANSACCION (iorcTRANSACCION IN OUT nocopy PKG_TRANSACCION.tyrcTRANSACCION) IS
		
		saldoorigen cuenta.saldo_cuenta%TYPE;
		saldodestino cuenta.saldo_cuenta%TYPE;
		
		BEGIN
		-- Validaciones y lógica de negocio se realiza acá
		-- Lanzar excepciones en caso de que las validaciones no se superen
			PKG_CUENTA.prCONSULTAR_SALDO(iorcTRANSACCION.cuenta_origen, saldoorigen);
			PKG_CUENTA.prCONSULTAR_SALDO(iorcTRANSACCION.cuenta_destino, saldodestino);
			IF (saldoorigen >= iorcTRANSACCION.monto_transaccion AND saldodestino > -1) THEN 
				saldoorigen := saldoorigen - iorcTRANSACCION.monto_transaccion;
				saldodestino := saldodestino + iorcTRANSACCION.monto_transaccion;
				PKG_TRANSACCION.prASIGNAR_NUEVO_SALDO(iorcTRANSACCION.cuenta_origen, saldoorigen);
				PKG_TRANSACCION.prASIGNAR_NUEVO_SALDO(iorcTRANSACCION.cuenta_destino, saldodestino);
				PKG_TRANSACCION.prHACER_TRANSACCION(iorcTRANSACCION);
			END IF;
		
		END prHACER_TRANSACCION;

END PKG_CLN_TRANSACCION;