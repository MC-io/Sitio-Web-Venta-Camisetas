use sin_nombre;

DELIMITER //

drop procedure if exists registrar_usr//
create procedure registrar_usr(in _dni int, in _nombres varchar(30), in _prim_ape varchar(30),
in _seg_ape varchar(30), in _pais varchar(30), in _fecha_nac date)
begin
	
	declare _id_pais int;
    declare _id_contacto int;
    set _id_pais = (select p.ID
    from paises p
    where _pais = p.Nombre
    );
    insert into contacto values (null);
    set _id_contacto = (select last_insert_id());
    insert into usuarios values (_dni, _nombres, _prim_ape, _seg_ape,_id_pais,_fecha_nac,_id_contacto); 
end  ;
// 
DELIMITER ; 