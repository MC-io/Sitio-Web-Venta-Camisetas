DROP DATABASE IF EXISTS sin_nombre;
CREATE DATABASE sin_nombre;

USE sin_nombre;

CREATE TABLE IF NOT EXISTS Contacto(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS Usuarios(
	DNI INTEGER,
    Nombres VARCHAR(30),
    PrimerApellido VARCHAR(30),
    SegundoApellido VARCHAR(30),
    Pais VARCHAR(30),
    FechaNac DATE,
    ID_Contacto INTEGER,
    PRIMARY KEY(DNI, ID_Contacto)
);

CREATE TABLE IF NOT EXISTS Emails(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50),
    Interesado BOOL,
    ID_Contacto INTEGER
);

CREATE TABLE IF NOT EXISTS Telefonos(
    Telefono INTEGER,
    ID_Contacto INTEGER,
    PRIMARY KEY(ID_Contacto, Telefono)
);

CREATE TABLE IF NOT EXISTS Direcciones(
	ID INTEGER AUTO_INCREMENT,
    ID_Ciudad INTEGER,
    Direccion TEXT,
    ID_Contacto INTEGER,
    PRIMARY KEY(ID)
);

CREATE TABLE Ciudades(
	ID INTEGER AUTO_INCREMENT,
    Nombre VARCHAR(30),
    ID_Pais INTEGER,
    PRIMARY KEY(ID, ID_Pais)
);

CREATE TABLE Paises(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30),
    Continente ENUM('África', 'Asia', 'América', 'Antártida', 'Europa', 'Oceanía')
);

CREATE TABLE Sedes(
	ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(30),
    Estado ENUM('Activo','No Activo'),
    ID_Ciudad INTEGER
);

CREATE TABLE IF NOT EXISTS Productos(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    IMG BLOB,
    Precio DECIMAL(16,2),
    Talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    Para ENUM('F', 'M'),
    ID_Categoria INTEGER
);

CREATE TABLE IF NOT EXISTS Categorias(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Pedidos(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME, 
    Estado ENUM('Pendiente', 'Procesando', 'En Transporte', 'Completo', 'Devuelto', 'Cancelado') NOT NULL,
    DNI_Usuario INTEGER NOT NULL,
    ID_Direccion INTEGER NOT NULL,
    Total DECIMAL DEFAULT 0.00 NOT NULL,
	ID_Cupon INTEGER DEFAULT NULL,
    ID_Carrito INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS CuponesDescuentos(
	ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30),
    Porcentaje DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS LibroReclamaciones(
	ID INTEGER AUTO_INCREMENT,
    Reclamo TEXT,
    Fecha DATETIME,
    ID_Usuario INTEGER,
    PRIMARY KEY(ID, ID_Usuario)
);

CREATE TABLE IF NOT EXISTS Proveedores(
	ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Proveedores_Productos(
	ID_Proveedor INTEGER,
    ID_Producto INTEGER,
    PRIMARY KEY(ID_Proveedor, ID_Producto)
);

CREATE TABLE IF NOT EXISTS CarritoCompras(
	ID INTEGER AUTO_INCREMENT,
    ID_Usuario INTEGER,
    PRIMARY KEY (ID, ID_usuario)
);

CREATE TABLE IF NOT EXISTS Productos_Carrito(
	ID_Producto INTEGER,
    ID_Carrito INTEGER,
    Cantidad INTEGER,
    PRIMARY KEY(ID_Producto, ID_Carrito)
);

CREATE TABLE IF NOT EXISTS Tarjetas(
	ID INTEGER AUTO_INCREMENT,
    NumeroTarjeta INTEGER,
    CVV TINYINT,
    Nombre VARCHAR(50),
    MMAA  TINYINT,
    PrimerApellido VARCHAR(30),
    SegundoApellido VARCHAR(30),
    Email VARCHAR (30),
    ID_Usuario INTEGER,
    PRIMARY KEY(ID, ID_Usuario)
);

CREATE TABLE IF NOT EXISTS Productos_Sedes(
	ID_Producto INTEGER,
    ID_Sede INTEGER,
    Stock INTEGER DEFAULT 0,
    PRIMARY KEY(ID_Producto, ID_Sede)
);


ALTER TABLE Usuarios ADD FOREIGN KEY (ID_Contacto) REFERENCES Contacto (ID);
ALTER TABLE Proveedores ADD FOREIGN KEY (ID) REFERENCES Contacto (ID);
ALTER TABLE Emails ADD FOREIGN KEY (ID_Contacto) REFERENCES Contacto (ID);
ALTER TABLE Telefonos ADD FOREIGN KEY (ID_Contacto) REFERENCES Contacto (ID);
ALTER TABLE Direcciones ADD FOREIGN KEY (ID_Contacto) REFERENCES Contacto (ID);
ALTER TABLE Direcciones ADD FOREIGN KEY (ID_Ciudad) REFERENCES Ciudades (ID);
ALTER TABLE Ciudades ADD FOREIGN KEY (ID_Pais) REFERENCES Paises (ID);
ALTER TABLE Pedidos ADD FOREIGN KEY (DNI_Usuario) REFERENCES Usuarios (DNI);
ALTER TABLE Pedidos ADD FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID);
ALTER TABLE Pedidos ADD FOREIGN KEY (ID_Cupon) REFERENCES CuponesDescuentos (ID); 
ALTER TABLE Pedidos ADD FOREIGN KEY (ID_Carrito) REFERENCES CarritoCompras (ID); 
ALTER TABLE Proveedores_Productos ADD FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID);
ALTER TABLE Proveedores_Productos ADD FOREIGN KEY (ID_Producto) REFERENCES Productos (ID);
ALTER TABLE LibroReclamaciones ADD FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (DNI);
ALTER TABLE Productos ADD FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID);
ALTER TABLE CarritoCompras ADD FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (DNI);
ALTER TABLE Tarjetas ADD FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (DNI);
ALTER TABLE Productos_Carrito ADD FOREIGN KEY (ID_Producto) REFERENCES Productos(ID);
ALTER TABLE Productos_Carrito ADD FOREIGN KEY (ID_Carrito) REFERENCES CarritoCompras(ID);
ALTER TABLE Sedes ADD FOREIGN KEY (ID) REFERENCES Contacto (ID);
ALTER TABLE Sedes ADD FOREIGN KEY (ID_Ciudad) REFERENCES Ciudades (ID);
ALTER TABLE Productos_Sedes ADD FOREIGN KEY (ID_Producto) REFERENCES Productos (ID);
ALTER TABLE Productos_Sedes ADD FOREIGN KEY (ID_Sede) REFERENCES Sedes (ID); 
