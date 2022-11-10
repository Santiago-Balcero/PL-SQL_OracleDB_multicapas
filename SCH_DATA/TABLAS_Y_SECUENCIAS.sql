-- TABLA CLIENTE
-- Crear tabla Cliente
CREATE TABLE cliente (
    id_cliente NUMBER(10) PRIMARY KEY,
    documento VARCHAR2(100) NOT NULL UNIQUE,
    nombres VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    departamento VARCHAR2(100) NOT NULL,
    ciudad VARCHAR2(100) NOT NULL,
    direccion VARCHAR2(250) NOT NULL,
    celular VARCHAR2(25) NOT NULL,
    contrasena VARCHAR2(100) NOT NULL
);

-- Crear secuencia para campo autoincrement idmascota
CREATE SEQUENCE seq_idcliente --Nombre de secuencia
START WITH 1 --Valor de inicio
INCREMENT BY 1
NOMAXVALUE;

----------------------------------------------------------------------------------------

-- TABLA TIPO_CUENTA
CREATE TABLE tipo_cuenta (
    id_tipo_cuenta NUMBER(10) NOT NULL PRIMARY KEY,
    nombre_cuenta VARCHAR(100) NOT NULL UNIQUE,
    tasa_interes NUMBER(10)
);

--Crear secuencia para id_tipo_cuenta TIPO_CUENTA
CREATE SEQUENCE seq_idtipocuenta
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

----------------------------------------------------------------------------------------

-- TABLA CUENTA
-- Crear tabla cuenta
CREATE TABLE cuenta (
    id_cuenta NUMBER(10) NOT NULL PRIMARY KEY,
    numero_cuenta VARCHAR2(100) NOT NULL UNIQUE,
    tipo_cuenta NUMBER(10) NOT NULL,
    saldo_cuenta NUMBER(10) NOT NULL,
    fecha_apertura TIMESTAMP NOT NULL,
    cliente_cuenta NUMBER(10) NOT NULL,
    FOREIGN KEY (cliente_cuenta) REFERENCES cliente (id_cliente),
    FOREIGN KEY (tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta)
);

--Crear secuencia para id_cuenta CUENTA
CREATE SEQUENCE seq_idcuenta
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

----------------------------------------------------------------------------------------

-- TABLA SUCURSAL
CREATE TABLE sucursal (
    id_sucursal NUMBER(10) NOT NULL PRIMARY KEY,
    nombre_sucursal VARCHAR2(100) NOT NULL,
    correo_sucursal VARCHAR2(100) NOT NULL,
    departamento_sucursal VARCHAR2(100) NOT NULL,
    ciudad_sucursal VARCHAR2(100) NOT NULL,
    direccion_sucursal VARCHAR2(250) NOT NULL,
    telefono_sucursal VARCHAR2(25) NOT NULL
);

--Crear secuencia para id_sucursal
CREATE SEQUENCE seq_idsucursal
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

----------------------------------------------------------------------------------------

-- TABLA TRANSACCION
-- Crear tabla Transaccion
CREATE TABLE transaccion (
    id_transaccion NUMBER(10) NOT NULL PRIMARY KEY,
    cuenta_origen NUMBER(10) NOT NULL,
    cuenta_destino NUMBER(10) NOT NULL,
    fecha_transaccion TIMESTAMP NOT NULL,
    monto_transaccion NUMBER(10) NOT NULL,
    sucursal_transaccion NUMBER(10) NOT NULL,
    FOREIGN KEY (cuenta_origen) REFERENCES cuenta (id_cuenta),
    FOREIGN KEY (cuenta_destino) REFERENCES cuenta (id_cuenta),
    FOREIGN KEY (sucursal_transaccion) REFERENCES sucursal (id_sucursal)
);

--Crear secuencia para id_movimiento
CREATE SEQUENCE seq_idtransaccion
START WITH 1
INCREMENT BY 1
NOMAXVALUE;