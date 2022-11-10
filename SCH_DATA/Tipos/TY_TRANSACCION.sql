-- Creación de tipo TY_TRANSACCION en esquema TECH1
CREATE OR REPLACE TYPE TECH1.TY_TRANSACCION AS OBJECT (
	cuenta_origen number,
	cuenta_destino number,
	monto_transaccion number,
	sucursal_transaccion number
);