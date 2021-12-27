use sin_nombre;

DELIMITER //

drop procedure if exists actualizar_producto//
create procedure actualizar_producto(
    IN _ID INTEGER,
    IN _Nombre VARCHAR(80), 
    IN _IMG VARCHAR(100),
    In _Precio DECIMAL,
    IN _Talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    IN _Para ENUM('F', 'M'),
    IN _Stock INTEGER,
    IN _NombreCategoria VARCHAR(30),
    IN _NombreProveedor VARCHAR(30))
BEGIN
	DECLARE _ID_Categoria INTEGER;
    DECLARE _ID_Proveedor INTEGER;
    DECLARE _ID_Proveedor_anterior INTEGER;
    DECLARE _ID INTEGER;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM Categorias WHERE Nombre = _NombreCategoria) = 1 THEN /* Si la categoria existe */
			IF(SELECT COUNT(*) FROM Proveedores WHERE Nombre = _NombreProveedor) = 1 THEN /* Si el proveedor existe */
				SET _ID_Categoria = (SELECT ID FROM Categorias WHERE Nombre = _NombreCategoria); /* Sacamos el ID de la categoria */
				SET _ID_Proveedor = (SELECT ID FROM Proveedores WHERE Nombre = _NombreProveedor); /* Sacamos el ID del proveedor  */
				SET _ID_Proveedor_anterior = (SELECT ID_Proveedor FROM productos WHERE ID = _ID);
				UPDATE Productos SET Nombre = _Nombre, IMG = _IMG, Precio = _Precio, Talla = _Talla, Para = _Para, Stock = _Stock, ID_Categoria = _ID_Categoria WHERE ID = _ID; /* E insertamos */
				SET _ID = (SELECT last_insert_id()); /* Obtenemos su ID */
				UPDATE Proveedores_Productos SET ID_Proveedor = _ID_Proveedor WHERE _ID_Proveedor =_ID_Proveedor_anterior AND ID_Producto = ID; /* Insertamos en proveedores */
			END IF ;
		END IF;
    COMMIT;
END;
//
DELIMITER ;