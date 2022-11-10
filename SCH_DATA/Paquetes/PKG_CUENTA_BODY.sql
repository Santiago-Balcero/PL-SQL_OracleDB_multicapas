CREATE OR REPLACE PACKAGE BODY TECH1.PKG_CUENTA IS

	PROCEDURE prCONSULTAR_SALDO (idcuenta IN NUMBER, saldo OUT NUMBER) IS
		BEGIN
			SELECT saldo_cuenta INTO saldo
		    FROM cuenta
		    WHERE id_cuenta = idcuenta;
		EXCEPTION
		WHEN no_data_found THEN
			saldo := -1;
	END prCONSULTAR_SALDO;
	
END PKG_CUENTA;