use sin_nombre;

DELIMITER //

drop procedure if exists search_prods_by_category//
create procedure search_prods_by_category(in cat_nom varchar(30))
begin
	select p.ID, p.Nombre, p.IMG, p.Precio, p.Talla, p.Para, c.Nombre
    from productos p
    inner join categorias c
    on p.ID_Categoria = c.ID
    where lower(cat_nom) = lower(c.Nombre);
end ;
//
DELIMITER ;