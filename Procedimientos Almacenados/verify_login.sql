use sin_nombre;

DELIMITER //

drop procedure if exists verify_login()
create procedure verify_login(in _email varchar(50), int _passwrd varchar(200))
begin
    select *
    from loginusr l
    where _email = l.Email and _passwrd = l.Contrasena
end ;

//
DELIMITER ;
