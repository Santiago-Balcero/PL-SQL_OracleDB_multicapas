CREATE OR REPLACE PACKAGE TECH1.PKG_CEX_TRANSACCION IS

	PROCEDURE prHACER_TRANSACCION (
		ircTRANSACCION IN OUT nocopy TY_TRANSACCION,
		idERROR OUT NUMBER,
		MSG OUT VARCHAR2
	);
		
END PKG_CEX_TRANSACCION;