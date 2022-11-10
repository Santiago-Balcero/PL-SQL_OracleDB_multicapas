CREATE OR REPLACE PACKAGE BODY TECH1.PKG_TRANSACCION IS

	-- Asigna nuevo saldo en una cuenta
	PROCEDURE prASIGNAR_NUEVO_SALDO (idcuenta IN cuenta.id_cuenta%TYPE, nuevosaldo IN transaccion.monto_transaccion%TYPE) IS
		BEGIN 
			UPDATE CUENTA 
			SET SALDO_CUENTA = nuevosaldo
			WHERE /*+PKG_TRANSACCION.prASIGNAR_NUEVO_SALDO*/ ID_CUENTA = idcuenta;
		END prASIGNAR_NUEVO_SALDO;

	-- Inserta el registro de la transacción en la tabla TRANSACCION
	PROCEDURE prHACER_TRANSACCION (iorc IN OUT nocopy tyrcTRANSACCION) IS
		BEGIN
			iorc.id_transaccion := seq_idtransaccion.NEXTVAL;
			iorc.fecha_transaccion := CURRENT_TIMESTAMP;
			INSERT INTO TRANSACCION VALUES /*+PKG_TRANSACCION.prHACER_TRANSACCION*/ iorc;
		END prHACER_TRANSACCION;
	
END PKG_TRANSACCION;