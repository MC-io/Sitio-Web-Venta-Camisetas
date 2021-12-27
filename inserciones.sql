
use sin_nombre;

# Insertando paises

call insertar_Pais('Peru','America');
call insertar_Pais('Chile','America');
call insertar_Pais('Colombia','America');
call insertar_Pais('Estados Unidos','America');
call insertar_Pais('Alemania','Europa');
call insertar_Pais('Francia','Europa');
call insertar_Pais('Italia','Europa');
call insertar_Pais('Mexico','America');
call insertar_Pais('Japon','Asia');
call insertar_Pais('Corea del Sur','Asia');
call insertar_Pais('Indonesia','Asia');
call insertar_Pais('Egipto','Africa');
call insertar_Pais('Australia','Oceania');
call insertar_Pais('Rusia','Europa');
call insertar_Pais('Reino Unido','Europa');


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
call registrar_usr(70861091,'Moises Alejandro','Casaverde','Aleman','Peru','2003-06-02','mcasaverde@gmail.com','contrasena',0);
call registrar_usr(90438223,'Maria Alejandra','Cuellar','Quispe','Mexico','2000-11-23','mcuellar@gmail.com','contrasena1',1);
call registrar_usr(18795457,'Ernesto Enrique','Perez','Acosta','Colombia','1999-10-02','eperez@gmail.com','contrasena1',1);
call registrar_usr(98140854,'Zhong Xina','Ching','Cheng','Japon','2003-03-09','zching@gmail.com','contrasena1',1);
call registrar_usr(90231873,'Ander Patrick','Smith','Ape','Estados Unidos','1986-08-12','asmith@gmail.com','contrasena1',0);
call registrar_usr(92048497,'Louis Pierre','Macron','Gaulle','Francia','1997-01-17','lmacron@gmail.com','contrasena1',1);
call registrar_usr(23456898,'Kumar Jhero','Khan','Sharma','Estados Unidos','1986-08-12','kkhan@gmail.com','contrasena1',0);
call registrar_usr(72866778,'Rushell Vanessa','Zavalaga','Orozco','Peru','1975-01-15','rzava@gmail.com','contrasena2',0);
call registrar_usr(72784548,'Paula','Mcdonalid','King','Francia','2003-01-03','paula.mcdonalid@example.com','contrasena2',0);
call registrar_usr(74512018,'Frank','Hall','Donald','Egipto','1996-12-26','frank.king@example.com','contrasena2',0);
call registrar_usr(75122018,'Curtis','Hall','Hall','Alemania','1972-06-06','curtis.hall@example.com','contrasena2',1);
call registrar_usr(75145518,'Claudia','Horton','Smi','Australia','1971-06-02','claudia.horton@example.com','contrasena2',0);
call registrar_usr(75421563,'Eun-jin','Lee','Chou','Corea del Sur','1999-07-14','tsuyu@example.com','contrasena2',0);
call registrar_usr(13213200,'Troy','Matthews','Julie','Indonesia','1975-07-03','troy.matthews@example.com','contrasena2',1);
call registrar_usr(13215600,'Claudia','Schiffer','Heinz','Alemania','1970-08-25','clau.schi@example.com','contrasena2',0);

# Insertando direcciones
call insertar_Direccion('Paris', 'Av. du Presidenr Wilson', 1);
call insertar_Direccion('Tokyo', 'Suginami', 2);
call insertar_Direccion('Hamburgo', 'Jungfernstieg', 3);
call insertar_Direccion('Lima', 'Av. Bolivia', 4);
call insertar_Direccion('Sydney', 'Bangalla Rd', 5);
call insertar_Direccion('Cusco', 'Av. Garcilaso', 6);
call insertar_Direccion('El Cairo', 'Nagib Al Rihani', 7);
call insertar_Direccion('Seul', 'Inwangsan-ro', 8);
call insertar_Direccion('Osaka', 'Pirundae-ro', 9);
call insertar_Direccion('Londres', 'Berners St', 10);
call insertar_Direccion('Berlin', 'Hannah-Arendt-Strabe', 11);
call insertar_Direccion('Austin', 'Grover Ave', 12);
call insertar_Direccion('Bali', 'Gg. Lalang Sari', 13);
call insertar_Direccion('Santiago', 'Isabel Riquelme', 14);
call insertar_Direccion('Arequipa', 'C. La Merced', 15);

# Insertando Telefonos
call insertar_Telefono(965478945, 1);
call insertar_Telefono(962398132, 2);
call insertar_Telefono(954122133, 3);
call insertar_Telefono(954211032, 4);
call insertar_Telefono(974510320, 5);
call insertar_Telefono(967854545, 6);
call insertar_Telefono(998465123, 7);
call insertar_Telefono(965846546, 8);
call insertar_Telefono(987451215, 9);
call insertar_Telefono(998465123, 10);
call insertar_Telefono(998765123, 11);
call insertar_Telefono(984653213, 12);
call insertar_Telefono(987546315, 13);
call insertar_Telefono(984653542, 14);
call insertar_Telefono(984532165, 15);

# Insertando Tarjetas
call insertar_Tarjeta(4000123456789010, 123, 'Maria', 1224, 'Arias', 'Tamayo', 'ar.lo@gmail.com', 1);
call insertar_Tarjeta(4845131321345666, 156, 'Jean', 1220, 'Farn', 'Echeverri', 'jn.fe@gmail.com', 2);
call insertar_Tarjeta(9876532135465213, 875, 'Lois', 0225, 'Patt', 'Pintt', 'lpp@gmail.com', 3);
call insertar_Tarjeta(3203348498465465, 465, 'Antoi', 1115, 'Luu', 'Blue', 'anluu@gmail.com', 4);
call insertar_Tarjeta(8465465465465421, 946, 'Jeun', 0802, 'Won', 'Lee', 'jeunwo@gmail.com', 5);
call insertar_Tarjeta(8754648463164984, 463, 'Julia', 0515, 'Lopez', 'Rivero', 'julriv@gmail.com', 6);
call insertar_Tarjeta(6546513546865465, 120, 'Sam', 0715, 'Orozco', 'De Monte', 'samonte@gmail.com', 7);
call insertar_Tarjeta(9546542132101166, 846, 'Kol', 1129, 'Mendoza', 'Bruzual', 'kolbru@gmail.com', 8);
call insertar_Tarjeta(7465132165487984, 845, 'Morena', 1015, 'Da Cruz', 'Ramirez', 'moreda@gmail.com', 9);
call insertar_Tarjeta(6421032034646465, 798, 'Troy', 0622, 'Dulie', 'River', 'troydu@gmail.com', 10);
call insertar_Tarjeta(4513203215465420, 465, 'Frank', 0411, 'Truh', 'Boy', 'frtr@gmail.com', 11);
call insertar_Tarjeta(6548321354872103, 984, 'Karina', 1006, 'Sulo', 'Rey', 'karsul@gmail.com', 12);
call insertar_Tarjeta(9874651635103465, 015, 'Luca', 0125, 'Lopz', 'Fernandez', 'lulop@gmail.com', 13);
call insertar_Tarjeta(8465163516546848, 894, 'Loise', 1213, 'LaTorres', 'Alvarez', 'loisela@gmail.com', 14);
call insertar_Tarjeta(8465484654875610, 651, 'Mar', 0211, 'Alcolea', 'Damia', 'maral@gmail.com', 15);

# Insertando categorias 
call insertar_Categoria('Selecciones nacionales','Las camisetas de la seleccion peruana y los mejores equipos nacionales del mundo');
call insertar_Categoria('Clubes de UEFA','Las camisetas de Futbol de la mayor competicion de clubes');
call insertar_Categoria('Originales','Disenos originales de camisetas de Futbol de la tienda');
call insertar_Categoria('Clubes del Peru','Las camisetas de los hinchas del futbol peruano.');
call insertar_Categoria('Color Unico','Simples y minimalistas de gran calidad');
call insertar_Categoria('Basketball','Con las camisetas de los equipos de la NBA');
call insertar_Categoria('Tenis','Las mejores camisetas para jugar Tenis');
call insertar_Categoria('Voleyball','Las mejores camisetas para jugar el popular deporte del Volleyball');
call insertar_Categoria('Baseball','Las camisetas de mejor calidad para este deporte tan famoso.');
call insertar_Categoria('Coleccion Doil','Camisetas del reconocido confeccionista Doil Leari.');
call insertar_Categoria('Casuales','Del dia a dia, comodas y sencillas para las actividades diarias.');
call insertar_Categoria('Especiales','Camisetas unicas y con stock limitado.');
call insertar_Categoria('Segunda Mano','Dale una segunda oportunidad a la ropa.');
call insertar_Categoria('Atletismo','Tus favoritas de calidad.');
call insertar_Categoria('Rugby','Las mejores camisetas de tus selecciones favoritas.');

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
call insertar_Proveedor('Camicami','cami@gmail.com');
call insertar_Proveedor('Plus','plus@gmail.com');
call insertar_Proveedor('DeTodo','deT@gmail.com');
call insertar_Proveedor('JEUJEU','jeujeu@gmail.com');
call insertar_Proveedor('FootFeet','ftft@gmail.com');
call insertar_Proveedor('Soy el mejor','sem@gmail.com');

# Insertando productos
call crear_Producto('Camiseta de la Seleccion Peruana - N9','peru9.png',20.00,'M','M',100,'Selecciones Nacionales','Disenos Peru');
call crear_Producto('Camiseta de la Seleccion Argentina - N10','arg10.png',22.00,'L','M',106,'Selecciones Nacionales','Soy el mejor');
call crear_Producto('Camiseta de la Seleccion de PSG - N30','psg30.png',22.00,'S','F',150,'Clubes de UEFA','Ropamaniacos');
call crear_Producto('Camiseta de la Seleccion de Real Madrid - N7','madrid7.png' ,25.00,'XL','F',160,'Clubes de UEFA','Plus');
call crear_Producto('Camiseta de la Seleccion de Bayern Munich - N8','bayern8.png',23.00,'L','M',50,'Clubes de UEFA','Polos W');
call crear_Producto('Camiseta de la Seleccion Chilena - N12','chile12.png',25.00,'L','M',100,'Selecciones Nacionales','International Clothing Team');
call crear_Producto('Camiseta de la Seleccion Peruana - N7','peru7.png',18.00,'XS','M',80,'Selecciones Nacionales','JEUJEU');
call crear_Producto('Camiseta del club del FC Melgar - N9','melgar9.png',20.00,'L','F',300,'Clubes del Peru','Politos de la sierra');
call crear_Producto('Camiseta de futbol turquesa - N1','turq1.png',16.00,'L','M',160,'Color Unico','DeporTShirts');
call crear_Producto('Camiseta estilo tejidos andinos - N20','andino20.png',26.00,'M','M',130,'Originales','Camisetitas');
call crear_Producto('Camiseta estilo olas del mar - N8','olas8.png',28.00,'XL','F',200,'Originales','DeTodo');
call crear_Producto('Camiseta Basketball Chicago Bulls','chicbull.png',20.00,'S','F',100,'Basketball','Pro Costuras');
call crear_Producto('Camiseta clasica de Tennis azul','tennisazul.png',21.00,'M','F',50,'Tenis','Polos W');
call crear_Producto('Camiseta de volleyball peruana','volleype.png',19.00,'M','F',70,'Volleyball','Camicami');
call crear_Producto('Camiseta de Baseball de los EEUU','baseballeeuu.png',22.00,'M','M',100,'Baseball','Ropa-AQP');

# Insertando productos a algunos carritos
call insertar_ProductoCarrito('Camiseta de la Seleccion Peruana - N9', 70861091, 2);
call insertar_ProductoCarrito('Camiseta de Baseball de los EEUU', 23456898, 1);
call insertar_ProductoCarrito('Camiseta estilo olas del mar - N8', 13213200, 3);
call insertar_ProductoCarrito('Camiseta del club del FC Melgar - N9', 75421563, 4);
call insertar_ProductoCarrito('Camiseta de la Seleccion Chilena - N12', 90438223, 1);
call insertar_ProductoCarrito('Camiseta estilo tejidos andinos - N20', 18795457, 6);
call insertar_ProductoCarrito('Camiseta de la Seleccion Peruana - N7', 72866778, 3);
call insertar_ProductoCarrito('Camiseta de la Seleccion de Bayern Munich - N8', 13215600, 2);
call insertar_ProductoCarrito('Camiseta de futbol turquesa - N1', 75145518, 1);
call insertar_ProductoCarrito('Camiseta de la Seleccion de Real Madrid - N7', 74512018, 3);
call insertar_ProductoCarrito('Camiseta de la Seleccion de PSG - N30', 75122018, 5);
call insertar_ProductoCarrito('Camiseta de la Seleccion Peruana - N9', 72784548, 8);
call insertar_ProductoCarrito('Camiseta de la Seleccion de Bayern Munich - N8', 92048497, 6);
call insertar_ProductoCarrito('Camiseta de la Seleccion Argentina - N10', 98140854, 4);
call insertar_ProductoCarrito('Camiseta Basketball Chicago Bulls', 90231873, 6);}

call insertar_ProductoCarrito('Camiseta de futbol turquesa - N1', 18795457, 10);

call crear_Pedido(70861091, 1, 0);