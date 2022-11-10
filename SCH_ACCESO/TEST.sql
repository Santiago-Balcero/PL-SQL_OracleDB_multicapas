-- Prueba en consola SQL desde el esquema TECH2
DECLARE
	tr TECH1.SYN_TY_TRANSACCION;
	e NUMBER;
	m VARCHAR2(50);
BEGIN
    -- Se inicializa el objeto tr de tipo TECH1.SYN_TR_TRANSACCION
	-- Estos valores están quemados de acuerdo a los datos que YA se tienen en las tablas
	tr := TECH1.SYN_TY_TRANSACCION(5, 6, 999, 3);

    -- Se llama el paquete.procedimiento de la capa de exposición de TECH1
	TECH1.PKG_CEX_TRANSACCION.prHACER_TRANSACCION(tr, e, m);
	
    -- Se recibe y muestra el mensaje de salida del procedimiento
	DBMS_OUTPUT.PUT_LINE(m);
END;