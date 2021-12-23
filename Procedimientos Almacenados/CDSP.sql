USE sin_nombre;

/************ PAIS **************************/
/*
CREATE TABLE Paises(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30),
    Continente ENUM('África', 'Asia', 'América', 'Antártida', 'Europa', 'Oceanía')
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Pais; //
CREATE PROCEDURE insertar_Pais(
	IN _Nombre VARCHAR(30), 
    IN _Continente ENUM('África', 'Asia', 'América', 'Antártida', 'Europa', 'Oceanía'))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Paises WHERE Nombre = _Nombre) = 0 THEN /* Si no existe ya */
			INSERT INTO Paises(Nombre, Continente) VALUES (_Nombre, _Continente); /* E insertamos */
        END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_Pais; //
CREATE PROCEDURE eliminar_Pais(
	IN _Nombre VARCHAR(30))
BEGIN
	DECLARE _ID_Pais INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Paises WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una ciudad con ese nombre */
			SET _ID_Pais = (SELECT ID FROM Paises WHERE Nombre = _Nombre); 
			IF(SELECT COUNT(*) FROM Ciudades WHERE ID_Pais = _ID_Pais) = 0 THEN /*Si no hay ciudades en el pais */
				DELETE FROM Paises WHERE ID = _ID_Pais;
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_Pais_Nombre; //
CREATE PROCEDURE actualizar_Pais_Nombre(
	IN _Nombre VARCHAR(30), 
    IN _NewNombre VARCHAR(30))
BEGIN
	DECLARE _ID_Pais INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Paises WHERE Nombre = _Nombre) = 1 THEN  /* Si existe un pais con ese nombre */
            SET _ID_Pais = (SELECT ID FROM Paises WHERE Nombre = _Nombre);  /* Sacamos su ID */
            UPDATE Paises SET Nombre = _NewNombre WHERE ID = _ID_Pais;  /* Actualizamoa */
        END IF;
    COMMIT;
END;
//
DELIMITER ;

/************ -- PAIS -- **************************/

/************ CIUDAD **************************/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Ciudad; //
CREATE PROCEDURE insertar_Ciudad(
	IN _Nombre VARCHAR(30), 
    IN _NombrePais VARCHAR(30))
BEGIN
	DECLARE _ID_Pais INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _Nombre) = 0 THEN /* Si no existe ya */
			IF(SELECT COUNT(*) FROM Paises WHERE Nombre = _NombrePais) = 1 THEN  /* Y el nombre del pais existe */
				SET _ID_Pais = (SELECT ID FROM Paises WHERE Nombre = _NombrePais); /* Sacamos el ID del pais */
				INSERT INTO Ciudades(Nombre, ID_Pais) VALUES (_Nombre, _ID_Pais); /* E insertamos */
            END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_Ciudad; //
CREATE PROCEDURE eliminar_Ciudad(
	IN _Nombre VARCHAR(30))
BEGIN
	DECLARE _ID_Ciudad INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una ciudad con ese nombre */
			SET _ID_Ciudad = (SELECT ID FROM Ciudades WHERE Nombre = _Nombre); 
			IF(SELECT COUNT(*) FROM Direcciones WHERE ID_Ciudad = _ID_Ciudad) = 0 THEN /*Si no hay direcciones en la ciudad */
				DELETE FROM Ciudades WHERE ID = _ID_Ciudad;
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_Ciudad_Nombre; //
CREATE PROCEDURE actualizar_Ciudad_Nombre(
	IN _Nombre VARCHAR(30), 
    IN _NewNombre VARCHAR(30))
BEGIN
	DECLARE _ID_Ciudad INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una ciudad con ese nombre */
            SET _ID_Ciudad = (SELECT ID FROM Ciudades WHERE Nombre = _Nombre);  /* Sacamos su ID */
            UPDATE Ciudades SET Nombre = _NewNombre WHERE ID = _ID_Ciudad;  /* Actualizamoa */
        END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_Ciudad_Pais; //
CREATE PROCEDURE actualizar_Ciudad_Pais(
	IN _Nombre VARCHAR(30), 
    IN _NewPais VARCHAR(30))
BEGIN
    DECLARE _ID_Pais INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una ciudad con ese nombre */
            IF(SELECT COUNT(*) FROM Paises WHERE Nombre = _NewPais) = 1 THEN  /* Si existe el pais al cual queremos cambiar */
				SET _ID_Pais = (SELECT ID FROM Paises WHERE Nombre = _NewPais);  /* Sacamos su ID */
				UPDATE Ciudades SET ID_Pais = _ID_Pais WHERE Nombre = _Nombre;  /* Actualizamoa */
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;

/*************** -- CIUDAD -- *********************/


/***************  DIRECCION  **************************/
/*
CREATE TABLE IF NOT EXISTS Direcciones(
	ID INTEGER AUTO_INCREMENT,
    ID_Ciudad INTEGER,
    Direccion TEXT,
    ID_Contacto INTEGER NOT NULL,
    PRIMARY KEY(ID)
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Direccion; //
CREATE PROCEDURE insertar_Direccion(
	IN _NombreCiudad VARCHAR(30), 
    IN _Direccion TEXT,
    IN ID_Contacto INTEGER)
BEGIN
    DECLARE _ID_Ciudad INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
			IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _NombreCiudad) = 1 THEN  /* Y el nombre de la ciudad existe */
				SET _ID_Ciudad = (SELECT ID FROM Ciudades WHERE Nombre = _NombreCiudad); /* Sacamos el ID de la ciudad */
				INSERT INTO Direcciones(Nombre, ID_Pais) VALUES (_Nombre, _ID_Pais); /* E insertamos */
        END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_Direccion; //
CREATE PROCEDURE eliminar_Direccion(
	IN _Nombre VARCHAR(30))
BEGIN
	DECLARE _ID_Ciudad INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una ciudad con ese nombre */
			SET _ID_Ciudad = (SELECT ID FROM Ciudades WHERE Nombre = _Nombre); 
			IF(SELECT COUNT(*) FROM Direcciones WHERE ID_Ciudad = _ID_Ciudad) = 0 THEN /*Si no hay direcciones en la ciudad */
				DELETE FROM Ciudades WHERE ID = _ID_Ciudad;
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;

/*************** -- DIRECCION -- *********************/

/***************  EMAIL  **************************/
/*
CREATE TABLE IF NOT EXISTS Emails(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50),
    Interesado BOOL,
    ID_Contacto INTEGER
);
*/

/***************  -- EMAIL --  **************************/

/***************  TELEFONO  **************************/
/*
CREATE TABLE IF NOT EXISTS Telefonos(
    Telefono INTEGER,
    ID_Contacto INTEGER,
    PRIMARY KEY(ID_Contacto, Telefono)
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Telefono; //
CREATE PROCEDURE insertar_Telefono(
	IN _Telefono INTEGER, 
    IN _ID_Contacto INTEGER)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Contacto WHERE ID = _ID_Contacto) = 1 THEN /* Si existe */
			IF(SELECT COUNT(*) FROM Telefonos WHERE ID = _ID_Contacto AND _Telefono = Telefono) = 0 THEN  /* Si no existe ya*/
					INSERT INTO Telefonos(Telefono, ID_Contacto) VALUES (_Telefono, _ID_Contacto);
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER;
/***************  -- TELEFONO --  **************************/

/************ PROVEEDOR **************************/
/*
CREATE TABLE IF NOT EXISTS Proveedores(
	ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(30)
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Proveedor; //
CREATE PROCEDURE insertar_Proveedor(
	IN _Nombre VARCHAR(30))
BEGIN
    DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _Nombre) = 0 THEN  /* Si el proveedor ya no existe */
            INSERT INTO Contacto VALUES (NULL);
            SET _ID = (SELECT last_insert_id());
			INSERT INTO Proveedores(ID, Nombre) VALUES (_ID, _Nombre); /* E insertamos */
        END IF;
    COMMIT;
END;
//

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_NombreProveedor; //
CREATE PROCEDURE actualizar_NombreProveedor(
	IN _Nombre VARCHAR(30), 
    IN _NewNombre VARCHAR(30))
BEGIN
	DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _Nombre) = 1 THEN  /* Si existe un proveedor con ese nombre */
            SET _ID = (SELECT ID FROM Proveedores WHERE Nombre = _Nombre);  /* Sacamos su ID */
            UPDATE Proveedores SET Nombre = _NewNombre WHERE ID = _ID;  /* Actualizamoa */
        END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_Proveedor; //
CREATE PROCEDURE eliminar_Proveedor(
	IN _Nombre VARCHAR(30))
BEGIN
	DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlsate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _Nombre) = 1 THEN  /* Si existe un proveedor con ese nombre */
			SET _ID = (SELECT ID FROM Proveedores WHERE Nombre = _Nombre); 
			IF(SELECT COUNT(*) FROM Proveedores_Productos WHERE ID_Proveedor = _ID) = 0 THEN /*Si no hay productos que dependan de este proveedor */
				DELETE FROM Proveedores WHERE ID = _ID;
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;
/************ -- PROVEEDOR -- **************************/

/***************  PRODUCTO // PROVEEDORES - PRODUCTOS **************************/
/*
CREATE TABLE IF NOT EXISTS Proveedores_Productos(
	ID_Proveedor INTEGER,
    ID_Producto INTEGER,
    PRIMARY KEY(ID_Proveedor, ID_Producto)
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS crear_Producto; //
CREATE PROCEDURE crear_Producto(
	IN _Nombre VARCHAR(30), 
    IN _IMG BLOB,
    In _Precio DECIMAL,
    IN _Talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    IN _Para ENUM('F', 'M'),
    IN _Stock INTEGER,
    IN _NombreCategoria VARCHAR(30),
    IN _NombreProveedor VARCHAR(30))
BEGIN
	DECLARE _ID_Categoria INTEGER;
    DECLARE _ID_Proveedor INTEGER;
    DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _Nombre) = 0 THEN /* Si el producto no existe */
			IF(SELECT COUNT(*) FROM Categorias WHERE Nombre = _NombreCategoria) = 1 THEN /* Si la categoria existe */
				IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _NombreProveedor) = 1 THEN /* Si el proveedor existe */
					SET _ID_Categoria = (SELECT ID FROM Categorias WHERE Nombre = _NombreCategoria); /* Sacamos el ID de la categoria */
					SET _ID_Proveedor = (SELECT ID FROM Proveedores WHERE Nombre = _NombreProveedor); /* Sacamos el ID del proveedor  */
					INSERT INTO Productos(Nombre, IMG, Precio, Talla, Para, Stock, ID_Categoria) VALUES (_Nombre, _IMG, _Precio, _Talla, _Para, _Stock , _ID_Categoria); /* E insertamos */
					SET _ID = (SELECT last_insert_id()); /* Obtenemos su ID */
                    INSERT INTO Proveedores_Productos(ID_Proveedor, ID_Producto) VALUES (_ID_Proveedor, _ID); /* Insertamos en proveedores */
                END IF;
			END IF;
		END IF;
    COMMIT;
END;
//
DELIMITER; 

DELIMITER //
DROP PROCEDURE IF EXISTS nuevo_ProveedorProducto; //
CREATE PROCEDURE nuevo_ProveedorProducto(
	IN _NombreProducto VARCHAR(30), 
    IN _NombreProveedor VARCHAR(30))
BEGIN
    DECLARE _ID_Proveedor INTEGER;
    DECLARE _ID_Producto INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _NombreProducto) = 1 THEN /* Si el producto no existe */
			IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _NombreProveedor) = 1 THEN /* Si el proveedor existe */
				SET _ID_Proveedor = (SELECT ID FROM Proveedores WHERE Nombre = _NombreProveedor); /* Sacamos el ID del proveedor  */
                SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _NombreProducto); /* Sacamos el ID del producto  */
				INSERT INTO Proveedores_Productos(ID_Proveedor, ID_Producto) VALUES (_ID_Proveedor, _ID_Producto); /* Insertamos en proveedores-productos */
			END IF;
		END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS agregar_ProductoStock; //
CREATE PROCEDURE agregar_ProductoStock(
	IN _Nombre VARCHAR(30),
    IN _PlusStock INTEGER
    )
BEGIN
    DECLARE _ID_Producto INTEGER;
    DECLARE _Stock INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _Nombre) = 1 THEN /* Si el producto existe */
			SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _Nombre); /* Obtenemos su ID */
			SET _Stock = (SELECT Stock FROM Productos WHERE ID_Producto = _ID_Producto);  
            UPDATE Productos SET Stock = _Stock + _PlusStock WHERE ID_Producto = _ID_Producto;
        END IF;
    COMMIT;
END;
//

DELIMITER //
DROP PROCEDURE IF EXISTS reducir_ProductoStock; //
CREATE PROCEDURE reducir_ProductoStock(
	IN _Nombre VARCHAR(30), 
    IN _MoinsStock INTEGER)
BEGIN
    DECLARE _ID_Producto INTEGER;
    DECLARE _Stock INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _Nombre) = 1 THEN /* Si el producto existe */
			SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _Nombre); /* Obtenemos su ID */
			SET _Stock = (SELECT Stock FROM Productos WHERE ID_Producto = _ID_Producto);  
			IF(_MoinsStock > _Stock) THEN 
				SET _MoinsStock = _Stock;
			END IF;
			UPDATE Productos_Sedes SET Stock = _Stock - _MoinsStock WHERE ID_Producto = _ID_Producto;
        END IF;
    COMMIT;
END;
//

/***************  -- PRODUCTO-SEDE // PROVEEDORES - PRODUCTOS -- **************************/

/***************  CARRITO DE COMPRAS **************************/
/*
CREATE TABLE IF NOT EXISTS Productos_Carrito(
	ID_Producto INTEGER,
    ID_Carrito INTEGER,
    Cantidad INTEGER,
    PRIMARY KEY(ID_Producto, ID_Carrito)
);

CREATE TABLE IF NOT EXISTS CarritoCompras(
	ID INTEGER PRIMARY KEY
);

*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_ProductoCarrito; // 
CREATE PROCEDURE insertar_ProductoCarrito(
	IN _NombreProducto VARCHAR(30),
    IN _IDCarrito INTEGER,
    IN _Cantidad INTEGER)
BEGIN
	DECLARE _ID_Producto INTEGER;
    DECLARE _Stock INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _NombreProducto) = 1 THEN /* Si el producto existe */
			IF(SELECT COUNT(*) FROM CarritoCompras WHERE ID = _IDCarrito) = 1 THEN /* Si el carrito existe */
				SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _NombreProducto);
                SET _Stock = (SELECT Stock FROM Productos WHERE ID = _ID_Producto);
                IF(_Cantidad > _Stock) THEN
					SET _Cantidad = _Stock;
				END IF;
                INSERT INTO Productos_Carrito(ID_Producto, ID_Carrito, Cantidad) VALUES (_ID_Producto, _IDCarrito, _Cantidad);
                UPDATE CarritoCompras SET Total = Total(_IDCarrito) WHERE ID = _IDCarrito;
			END IF;
		END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_ProductoCarrito; //
CREATE PROCEDURE eliminar_ProductoCarrito(
	IN _NombreProducto VARCHAR(30), 
    IN _IDCarrito INTEGER,
    IN _CantidadQuitar INTEGER)
BEGIN
    DECLARE _ID_Producto INTEGER;
    DECLARE _Cantidad INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _NombreProducto) = 1 THEN /* Si el producto existe */
            IF(SELECT COUNT(*) FROM CarritoCompras WHERE ID = _IDCarrito) = 1 THEN /* Si el carrito existe */
				SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _NombreProducto); /* Sacamos el ID del producto */
				IF(SELECT COUNT(*) FROM  Productos_Carrito WHERE ID_Producto = _ID_Producto AND ID_Carrito = _IDCarrito ) = 1 THEN
					SET _Cantidad = (SELECT Cantidad FROM Productos_Carrito WHERE ID_Producto = _ID_Producto AND ID_Carrito = _IDCarrito );  
                    IF(_CantidadQuitar > _Cantidad) THEN 
						SET _CantidadQuitar = _Cantidad;
                    END IF;
                    UPDATE Productos_Carrito SET Cantidad = _Cantidad - _CantidadQuitar WHERE ID_Producto = _ID_Producto AND ID_Carrito = _IDCarrito;
					UPDATE CarritoCompras SET Total = Total(_IDCarrito) WHERE ID = _IDCarrito;
                END IF;
			END IF;
        END IF;
    COMMIT;
END;
//

/***************  -- CARRITO DE COMPRAS -- **************************/

/***************  PEDIDOS **************************/
/*
CREATE TABLE IF NOT EXISTS Pedidos(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME, 
    Estado ENUM('Pendiente', 'Procesando', 'En Transporte', 'Completo', 'Devuelto', 'Cancelado') NOT NULL,
    DNI_Usuario INTEGER NOT NULL,
    ID_Direccion INTEGER NOT NULL,
    Total DECIMAL DEFAULT 0.00 NOT NULL,
	ID_Cupon INTEGER DEFAULT NULL
);
*/

/*
CREATE TABLE IF NOT EXISTS Productos(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    IMG BLOB,
    Precio DECIMAL(16,2),
    Talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    Para ENUM('F', 'M'),
    Stock INTEGER DEFAULT 0,
    ID_Categoria INTEGER
);

*/
DELIMITER //
DROP FUNCTION IF EXISTS Total; //
CREATE FUNCTION Total(
	DNI_Usuario
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE _Total;
    SET _Total = (SELECT SUM(P.Precio*PC.Cantidad) FROM Productos_Carrito PC, Productos P WHERE PC.ID_Carrito = DNI_Usuario AND PC.ID_Producto = P.ID) 
END;

DELIMITER //
DROP PROCEDURE IF EXISTS crear_Pedido; //
CREATE PROCEDURE crear_Pedido(
    IN _DNI_Usuario INTEGER,
    IN _ID_Direccion INTEGER,
    In _ID_Cupon INTEGER)
BEGIN
    DECLARE _Total INTEGER;
	DECLARE _Fecha DATETIME;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		SET _Fecha = NOW();
        SET _Total = Total(_DNI_Usuario);
        IF (_Total > 0) THEN
			INSERT INTO Pedidos(Fecha, Estado, DNI_Usuario, ID_Direccion, Total, ID_Cupon) VALUES (_Fecha, "Pendiente", _DNI_Usuario, _ID_Direccion, _Total, _ID_Cupon);
		END IF;
    COMMIT;
END;
//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_Pedido; //
CREATE PROCEDURE actualizar_Pedido(
    IN _ID INTEGER, 
    IN _Estado ENUM('Pendiente', 'Procesando', 'En Transporte', 'Completo', 'Devuelto', 'Cancelado'))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Pedidos WHERE ID = _ID) = 1 THEN /* Si el pedido existe */
			UPDATE Pedidos SET Estado = _Estado WHERE ID = _ID;
        END IF;
    COMMIT;
END;
//


/***************  -- PEDIDOS -- **************************/
