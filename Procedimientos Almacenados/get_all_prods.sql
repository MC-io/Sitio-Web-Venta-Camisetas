use sin_nombre;

DELIMITER //

drop procedure if exists get_all_prods()//
create procedure get_all_prods()
begin
	select p.ID, p.Nombre, p.IMG, p.Precio, p.Talla, p.Para, c.Nombre 'Categoria'
    from productos p
    inner join categorias c
    on p.ID_Categoria = c.ID;
end ;
//
DELIMITER ;