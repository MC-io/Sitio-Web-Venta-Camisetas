use sin_nombre;

DELIMITER //

drop procedure if exists actualizar_usr//
create procedure actualizar_usr(in _dni int, in _nombres varchar(30), in _prim_ape varchar(30),
in _seg_ape varchar(30), in _pais varchar(30), in _fecha_nac date, in _id_contacto int)
begin
	declare _id_pais int;
    set _id_pais = (
		select p.ID
        from paises p
        where p.Nombre = _pais
	);
	update usuarios
    set dni = _dni, Nombres = _nombres, PrimerApellido = _prim_ape, SegundoApellido = _seg_ape, Pais = _id_pais, FechaNac = _Fecha_nac
    where id_contacto = _id_contacto;
end ;
//
DELIMITER ;
