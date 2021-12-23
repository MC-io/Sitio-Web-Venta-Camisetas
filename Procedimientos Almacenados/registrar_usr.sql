use sin_nombre;

DELIMITER //

drop procedure if exists registrar_usr//
create procedure registrar_usr(
in _dni int,
in _nombres varchar(30),
in _prim_ape varchar(30),
in _seg_ape varchar(30),
in _pais varchar(30),
in _fecha_nac date,
in _email varchar(50),
in _paswrd varchar(200))
begin
	
	declare _id_pais int;
    declare _id_contacto int;
    declare EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @error_string = MESSAGE_TEXT;
        SELECT @error_string;
        ROLLBACK;
    END;
    START TRANSACTION;
		IF(SELECT COUNT(*) FROM usuarios WHERE DNI = _dni) = 0 THEN /* Si no existe ya */
			IF(SELECT COUNT(*) FROM loginusr WHERE Email = _email) = 0 THEN  /* Y el nombre del pais existe */
				set _id_pais = (select p.ID
                from paises p
                where _pais = p.Nombre
                );
                insert into contacto values (null);
                set _id_contacto = (select last_insert_id());
                insert into usuarios values (_dni, _nombres, _prim_ape, _seg_ape,_id_pais,_fecha_nac,_id_contacto);
                insert into loginusr values (_dni, _email, _paswrd);
            END IF;
        END IF;
    COMMIT;
end ;
// 
DELIMITER ; 