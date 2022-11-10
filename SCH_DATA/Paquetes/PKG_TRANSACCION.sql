-- Crea paquete TRANSACCION capa de acceso a datos.

CREATE OR REPLACE PACKAGE TECH1.PKG_TRANSACCION IS

	subtype tyrcTRANSACCION IS TECH1.TRANSACCION%rowtype;

	PROCEDURE prASIGNAR_NUEVO_SALDO (idcuenta IN cuenta.id_cuenta%TYPE, nuevosaldo IN transaccion.monto_transaccion%TYPE);

	PROCEDURE prHACER_TRANSACCION (iorc IN OUT nocopy tyrcTRANSACCION);
	
END PKG_TRANSACCION;