use sin_nombre;

DELIMITER //

drop procedure if exists ganancias_por_prod//
create procedure ganancias_por_prod()
begin
	select p.ID, p.Nombre, p.IMG, p.Precio, p.Talla, p.Para, c.Nombre, sum(p.Precio * pc.Cantidad)
    from productos p
    inner join categorias c
    inner join productos_carrito pc
    on pc.ID_Producto = p.ID
    inner join carrito_compras cc
    on cc.ID = pc.ID
    inner join pedidos pe 
    on pe.ID_Carrito = cc.ID;
end ;
//
DELIMITER ;