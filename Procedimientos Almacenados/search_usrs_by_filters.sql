use sin_nombre;

DELIMITER //

drop procedure if exists search_usrs_by_filters//
create procedure search_usrs_by_filters(in _nombre varchar(100), in _pais varchar(30))
begin 
	select u.DNI, u.Nombres, u.PrimerApellido, u.SegundoApellido, p.Nombre, u.FechaNac
    from usuarios u
    inner join paises p
    on p.ID = u.Pais
    where concat(u.Nombres,' ',u.PrimerApellido,' ',u.SegundoApellido) like concat("%",_nombre,'%') 
    and p.Nombre like concat('%',_pais,'%') 
end ;
//
DELIMITER ; 