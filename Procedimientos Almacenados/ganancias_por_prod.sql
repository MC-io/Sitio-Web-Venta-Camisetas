use sin_nombre;

DELIMITER //

drop procedure if exists ganancias_por_prod//
create procedure ganancias_por_prod()
begin
	select p.ID, p.Nombre, p.IMG, p.Precio, p.Talla, p.Para, c.Nombre 'Categoria', sum(p.Precio * pp.Cantidad) 'Ganancias'
    from productos p
    inner join categorias c
    inner join productos_pedido pp
    on pp.ID_Producto = p.ID and c.ID = p.ID_Categoria 
    inner join pedidos pe 
    on pe.ID = pp.ID_Pedido;
end ;
//
DELIMITER ;