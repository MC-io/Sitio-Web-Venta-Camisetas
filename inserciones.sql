
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


call registrar_usr(90438223,'Maria Alejandra','Cuellar','Quispe','Mexico','2000-11-23');
call registrar_usr(18795457,'Ernesto Enrique','Perez','Acosta','Colombia','1999-10-02');
call registrar_usr(18795457,'Zhong Xina','Ching','Cheng','China','2003-03-09');
call registrar_usr(90231873,'Ander Patrick','Smith','Ape','Estados Unidos','1986-08-12');
call registrar_usr(90231873,'Louis Pierre','Macron','Gaulle','Francia','1997-01-17');
call registrar_usr(90231873,'Kumar Jhero','Khan','Sharma','Estados Unidos','1986-08-12');






