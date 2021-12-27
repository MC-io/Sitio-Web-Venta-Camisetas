use sin_nombre;

DELIMITER //

drop procedure if exists get_prod_by_id//
create procedure get_prod_by_id(in _id integer)
begin 
	select p.ID, p.Nombre, p.IMG, p.Precio, p.Talla, p.Para, p.Stock, c.Nombre 'Categoria'
    from productos p
    inner join categorias c
    on p.ID_Categoria = c.ID
    where p.ID = _id;
end ;
//
DELIMITER ; 