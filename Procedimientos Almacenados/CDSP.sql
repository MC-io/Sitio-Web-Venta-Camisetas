USE sin_nombre;
/** AQUI CIUDAD, DIRECCION, SEDE Y PRODUCTO **/

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

/***************  SEDE  **************************/
/*
CREATE TABLE Sedes(
	ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(30),
    Estado ENUM('Activo','No Activo'),
    ID_Ciudad INTEGER
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Sede; //
CREATE PROCEDURE insertar_Sede(
	IN _Nombre VARCHAR(30), 
    IN _Estado ENUM('Activo','No Activo'),
    In _NombreCiudad VARCHAR(30))
BEGIN
	DECLARE _ID_Ciudad INTEGER;
    DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _Nombre) = 0 THEN /* Si no existe la sede ya */
			IF(SELECT COUNT(*) FROM Ciudades WHERE Nombre = _NombreCiudad) = 1 THEN /* Si la ciudad existe */
				SET _ID_Ciudad = (SELECT ID FROM Ciudades WHERE Nombre = _NombreCiudad); /* Sacamos el ID de la ciudad */
				INSERT INTO Contacto VALUES (NULL);
				SET _ID = (SELECT last_insert_id());
				INSERT INTO Sedes(ID, Nombre, Estado, ID_Ciudad) VALUES (_ID, _Nombre, _Estado, _ID_Ciudad); /* E insertamos */
			END IF;
        END IF;
    COMMIT;
END;
//

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_Sede_Nombre; //
CREATE PROCEDURE actualizar_Sede_Nombre(
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
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una sede con ese nombre */
            SET _ID = (SELECT ID FROM Sedes WHERE Nombre = _Nombre);  /* Sacamos su ID */
            UPDATE Sedes SET Nombre = _NewNombre WHERE ID = _ID;  /* Actualizamoa */
        END IF;
    COMMIT;
END;
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS cambiarEstadoSede; //
CREATE PROCEDURE cambiarEstadoSede(
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
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _Nombre) = 1 THEN /* Si la sede existe */
			SET _ID = (SELECT ID FROM Sedes WHERE Nombre = _Nombre); /* Sacamos su ID */
            IF(SELECT Estado FROM Sedes WHERE ID = _ID) = "Activo" THEN 
				UPDATE Sedes SET Estado = "No Activo" WHERE ID = _ID;
			ELSEIF (SELECT Estado FROM Sedes WHERE ID = _ID) = "No Activo" THEN
				UPDATE Sedes SET Estado = "Activo" WHERE ID = _ID;
            END IF;
        END IF;
    COMMIT;
END;
//

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_Sede; //
CREATE PROCEDURE eliminar_Sede(
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
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _Nombre) = 1 THEN  /* Si existe una sede con ese nombre */
			SET _ID = (SELECT ID FROM Sedes WHERE Nombre = _Nombre); 
			IF(SELECT COUNT(*) FROM Productos_Sedes WHERE ID_Sede = _ID) = 0 THEN /*Si no hay productos en la sede */
				DELETE FROM Sedes WHERE ID = _ID;
			END IF;
        END IF;
    COMMIT;
END;
//
DELIMITER ;
/***************  -- SEDE --  **************************/

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

/***************  PRODUCTO-SEDE // PROVEEDORES - PRODUCTOS **************************/
/*
CREATE TABLE IF NOT EXISTS Productos_Sedes(
	ID_Producto INTEGER,
    ID_Sede INTEGER,
    Stock INTEGER,
    PRIMARY KEY(ID_Producto, ID_Sede)
);
*/
/*
CREATE TABLE IF NOT EXISTS Proveedores_Productos(
	ID_Proveedor INTEGER,
    ID_Producto INTEGER,
    PRIMARY KEY(ID_Proveedor, ID_Producto)
);
*/

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_Producto; //
CREATE PROCEDURE insertar_Producto(
	IN _Nombre VARCHAR(30), 
    IN _IMG BLOB,
    In _Precio DECIMAL,
    IN _Talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    IN _Para ENUM('F', 'M'),
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
					INSERT INTO Productos(Nombre, IMG, Precio, Talla, Para, ID_Categoria) VALUES (_Nombre, _IMG, _Precio, _Talla, _Para, _ID_Categoria); /* E insertamos */
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
DROP PROCEDURE IF EXISTS insertar_ProductoSede; //
CREATE PROCEDURE insertar_ProductoSede(
	IN _Nombre VARCHAR(30), 
    IN _NombreSede VARCHAR(30),
    IN _PlusStock INTEGER
    )
BEGIN
    DECLARE _ID_Sede INTEGER;
    DECLARE _ID_Producto INTEGER;
    DECLARE _Stock INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _NombreSede) = 1 THEN /* Si la sede existe */
			SET _ID_Sede = (SELECT ID FROM Sedes WHERE Nombre = _NombreSede); /* Sacamos el ID de la sede */
            IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _Nombre) = 1 THEN /* Si el producto ya existe */
				SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _Nombre); /* Obtenemos su ID */
                /** Si el producto no tiene stock en tal sede entonces insertamos **/
				IF(SELECT COUNT(*) FROM  Productos_Sedes PS WHERE PS.ID_Producto = _ID_Producto AND PS.ID_Sede = _ID_Sede ) = 0 THEN 
					INSERT INTO Productos_Sedes(ID_Producto, ID_Sede, Stock) VALUES(_ID_Producto, _ID_Sede, _PlusStock);
				ELSE /** Si el producto si tiene stock **/
					SET _Stock = (SELECT Stock FROM Productos_Sedes WHERE ID_Producto = _ID_Producto AND ID_Sede = _ID_Sede);  
					UPDATE Productos_Sedes SET Stock = _Stock + _PlusStock WHERE ID_Producto = _ID_Producto AND ID_Sede = _ID_Sede;
				END IF;
			END IF;
        END IF;
    COMMIT;
END;
//

DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_ProductoSede; //
CREATE PROCEDURE eliminar_ProductoSede(
	IN _NombreProducto VARCHAR(30), 
    IN _NombreSede VARCHAR(30),
    IN _Cantidad INTEGER)
BEGIN
    DECLARE _ID_Sede INTEGER;
    DECLARE _ID_Producto INTEGER;
    DECLARE _Stock INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Sedes WHERE Nombre = _NombreSede) = 1 THEN /* Si la sede existe */
			SET _ID_Sede = (SELECT ID FROM Sedes WHERE Nombre = _NombreSede); /* Sacamos el ID de la sede */
            IF(SELECT COUNT(*) FROM Productos WHERE Nombre = _NombreProducto) = 1 THEN /* Si el producto ya existe */
				SET _ID_Producto = (SELECT ID FROM Productos WHERE Nombre = _Nombre); /* Obtenemos su ID */
				IF(SELECT COUNT(*) FROM  Productos_Sedes PS WHERE PS.ID_Producto = _ID_Producto AND PS.ID_Sede = _ID_Sede ) = 1 THEN
					SET _Stock = (SELECT Stock FROM Productos_Sedes WHERE ID_Producto = _ID_Producto AND ID_Sede = _ID_Sede);  
                    IF(_Cantidad > _Stock) THEN 
						SET _Cantidad = _Stock;
                    END IF;
                    UPDATE Productos_Sedes SET Stock = _Stock - _Cantidad WHERE ID_Producto = _ID_Producto AND ID_Sede = _ID_Sede;
				END IF;
			END IF;
        END IF;
    COMMIT;
END;
//

/***************  -- PRODUCTO-SEDE // PROVEEDORES - PRODUCTOS -- **************************/
