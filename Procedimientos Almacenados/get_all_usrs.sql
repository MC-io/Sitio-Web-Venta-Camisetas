use sin_nombre;

DELIMITER //

drop procedure if exists get_all_usrs//
create procedure get_all_usrs()
begin 
	select u.DNI, u.Nombres, u.PrimerApellido, u.SegundoApellido, p.Nombre 'Pais', u.FechaNac
    from usuarios u
    inner join paises p
    on p.ID = u.Pais;
end ;
//
DELIMITER ; 