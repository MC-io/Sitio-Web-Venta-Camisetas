
use sin_nombre;

# Insertando paises

insert into paises
values (null,'Peru','America');
insert into paises
values (null,'Chile','America');
insert into paises
values (null,'Colombia','America');
insert into paises
values (null,'Estados Unidos','America');
insert into paises
values (null,'Alemania','Europa');
insert into paises
values (null,'Francia','Europa');
insert into paises
values (null,'Italia','Europa');
insert into paises
values (null,'Mexico','America');
insert into paises
values (null,'Japon','Asia');
insert into paises
values (null,'Corea del Sur','Asia');
insert into paises
values (null,'Indonesia','Asia');
insert into paises
values (null,'Egipto','Africa');
insert into paises
values (null,'Australia','Oceania');
insert into paises
values (null,'Rusia','Europa');
insert into paises
values (null,'Reino Unido','Europa');


# Insertando ciudades

call insertar_Ciudad('Arequipa','Peru');
call insertar_Ciudad('Lima','Peru');
call insertar_Ciudad('Santiago','Chile');
call insertar_Ciudad('Berlin','Alemania');
call insertar_Ciudad('Londres','Reino Unido');
call insertar_Ciudad('El Cairo','Egipto');
call insertar_Ciudad('Sydney','Australia');
call insertar_Ciudad('Bali','Indonesia');
call insertar_Ciudad('Osaka','Japon');
call insertar_Ciudad('Seul','Corea del Sur');
call insertar_Ciudad('Paris','Francia');
call insertar_Ciudad('Tokyo','Japon');
call insertar_Ciudad('Cusco','Peru');
call insertar_Ciudad('Austin','Estados Unidos');
call insertar_Ciudad('Hamburgo','Alemania');


# Insertando usuarios :D
call registrar_usr(70861091,'Moises Alejandro','Casaverde','Aleman','Peru','2003-06-02','mcasaverde@gmail.com','contrasena');
call registrar_usr(90438223,'Maria Alejandra','Cuellar','Quispe','Mexico','2000-11-23','mcuellar@gmail.com','contrasena1');
call registrar_usr(18795457,'Ernesto Enrique','Perez','Acosta','Colombia','1999-10-02','eperez@gmail.com','contrasena1');
call registrar_usr(98140854,'Zhong Xina','Ching','Cheng','Japon','2003-03-09','zching@gmail.com','contrasena1');
call registrar_usr(90231873,'Ander Patrick','Smith','Ape','Estados Unidos','1986-08-12','asmith@gmail.com','contrasena1');
call registrar_usr(92048497,'Louis Pierre','Macron','Gaulle','Francia','1997-01-17','lmacron@gmail.com','contrasena1');
call registrar_usr(23456898,'Kumar Jhero','Khan','Sharma','Estados Unidos','1986-08-12','kkhan@gmail.com','contrasena1');

# Insertando categorias 

insert into categorias
values (null,'Selecciones nacionales','Las camisetas de la seleccion peruana y los mejores equipos nacionales del mundo');
insert into categorias
values (null,'Clubes de UEFA','Las camisetas de Futbol de la mayor competicion de clubes');
insert into categorias
values (null,'Originales','Disenos originales de camisetas de Futbol de la tienda');
insert into categorias
values (null,'Clubes del Peru','Las camisetas de los hinchas del futbol peruano.');
insert into categorias
values (null,'Color Unico','Simples y minimalistas de gran calidad');
insert into categorias
values (null,'Basketball','Con las camisetas de los equipos de la NBA');
insert into categorias
values (null,'Tenis','Las mejores camisetas para jugar Tenis');
insert into categorias
values (null,'Voleyball','Las mejores camisetas para jugar el popular deporte del Volleyball');
insert into categorias
values (null,'Baseball','Las camisetas de mejor calidad para este deporte tan famoso.');

# Insertando proveedores

call insertar_Proveedor('Disenos Peru','dperu@gmail.com');
call insertar_Proveedor('Camisetitas','camisetitas@gmail.com');
call insertar_Proveedor('Pro Costuras','pcosturas@gmail.com');
call insertar_Proveedor('DeporTShirts','dptshirts@gmail.com');
call insertar_Proveedor('Ropa-AQP','raqp@gmail.com');
call insertar_Proveedor('Polos W','polosw@gmail.com');
call insertar_Proveedor('Ropamaniacos','rpmaniacs@gmail.com');
call insertar_Proveedor('Politos de la sierra','psierra@gmail.com');
call insertar_Proveedor('International Clothing Team','ict@gmail.com');

# Insertando productos

call crear_Producto('Camiseta de la Seleccion Peruana - N9','peru9.png',20.00,'M','M',8,'Selecciones Nacionales','Disenos Peru');
call crear_Producto('Camiseta de la Seleccion Argentina - N10','arg10.png',22.00,'L','M',6,'Selecciones Nacionales','Ropamaniacos');
call crear_Producto('Camiseta de la Seleccion de PSG - N30','psg30.png',22.00,'S','F',5,'Clubes de UEFA','Ropamaniacos');
call crear_Producto('Camiseta de la Seleccion de Real Madrid - N7','madrid7.png' ,25.00,'XL','F',6,'Clubes de UEFA','Polos W');
call crear_Producto('Camiseta de la Seleccion de Bayern Munich - N8','bayern8.png',23.00,'L','M',5,'Clubes de UEFA','Polos W');
call crear_Producto('Camiseta de la Seleccion Chilena - N12','chile12.png',25.00,'L','M',10,'Selecciones Nacionales','Interanational Clothing Team');
call crear_Producto('Camiseta de la Seleccion Peruana - N7','peru7.png',18.00,'XS','M',8,'Selecciones Nacionales','Disenos Peru');
call crear_Producto('Camiseta del club del FC Melgar - N9','melgar9.png',20.00,'L','F',3,'Clubes del Peru','Politos de la sierra');
call crear_Producto('Camiseta de futbol turquesa - N1','turq1.png',16.00,'L','M',6,'Color Unico','DeporTShirts');
call crear_Producto('Camiseta estilo tejidos andinos - N20','andino20.png',26.00,'M','M',13,'Originales','Camisetitas');
call crear_Producto('Camiseta estilo olas del mar - N8','olas8.png',28.00,'XL','F',2,'Originales','Camisetitas');
call crear_Producto('Camiseta Basketball Chicago Bulls','chicbull.png',20.00,'S','F',1,'Basketball','Pro Costuras');
call crear_Producto('Camiseta clasica de Tennis azul','tennisazul.png',21.00,'M','F',5,'Tenis','Polos W');
call crear_Producto('Camiseta de volleyball peruana','volleype.png',19.00,'M','F',7,'Volleyball','Ropa-AQP');
call crear_Producto('Camiseta de Baseball de los EEUU','baseballeeuu.png',22.00,'M','M',10,'Baseball','Ropa-AQP');
