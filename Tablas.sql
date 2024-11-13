-- Tabla Pelicula
CREATE TABLE Pelicula (
    Titulo VARCHAR(255) PRIMARY KEY,
    Resumen TEXT,
    Imagen TEXT,
    Link_IMDB VARCHAR(255),
    Trailer TEXT
);

-- Tabla Sala
CREATE TABLE Sala (
    N_Sala INT PRIMARY KEY
);

-- Tabla Sesion
CREATE TABLE Sesion (
    Sesion_Hora TIMESTAMP, 
    Tit_Pel VARCHAR(255),
    N_Sala INT,
    Precio DECIMAL(10, 2),
    PRIMARY KEY (Sesion_Hora, N_Sala),
    FOREIGN KEY (Tit_Pel) REFERENCES Pelicula(Titulo) ON DELETE CASCADE,
    FOREIGN KEY (N_Sala) REFERENCES Sala(N_Sala)
);

-- Tabla Butaca
CREATE TABLE Butaca (
    N_Butaca INT,
    Sala_N INT,
    PRIMARY KEY (N_Butaca, Sala_N) ,
    FOREIGN KEY (Sala_N) REFERENCES Sala(N_Sala) ON DELETE CASCADE
);

-- Tabla Cliente
CREATE TABLE Cliente (
    Correo VARCHAR(255) PRIMARY KEY,
    Contrasenia VARCHAR(255),
    Nombre VARCHAR(255)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    Correo VARCHAR(255) PRIMARY KEY,
    Contrasenia VARCHAR(255),
    Nombre VARCHAR(255)
);

-- Tabla Entrada
CREATE TABLE Entrada (
    ID SERIAL PRIMARY KEY,
    Correo VARCHAR(255),
    Sesion_Hora TIMESTAMP,
	N_Sala INT,
	N_But INT,
    FOREIGN KEY (Correo) REFERENCES Cliente(Correo) ON DELETE CASCADE,
    FOREIGN KEY (Sesion_Hora, N_Sala) REFERENCES Sesion(Sesion_Hora, N_Sala),
	FOREIGN KEY (N_But, N_Sala) REFERENCES Butaca(N_Butaca, Sala_N)
);

-- Tabla Producto
CREATE TABLE Producto (
    Nombre VARCHAR(255) PRIMARY KEY,
    Precio DECIMAL(10, 2),
	Disponible Bool
);

-- Tabla Prod_Ent
CREATE TABLE Prod_Ent (
    ID_Ent INT,
    Nombre_Prod VARCHAR(255),
    PRIMARY KEY (ID_Ent, Nombre_Prod),
    FOREIGN KEY (ID_Ent) REFERENCES Entrada(ID) ON DELETE CASCADE,
    FOREIGN KEY (Nombre_Prod) REFERENCES Producto(Nombre)
);

CREATE TABLE Comentario (
	Texto VARCHAR(500),
	Pelicula VARCHAR(255),
	ID SERIAL,
	Usuario VARCHAR(255),
	Fecha TIMESTAMP,
	PRIMARY KEY (ID),
	FOREIGN KEY (Pelicula) REFERENCES Pelicula(Titulo) ON DELETE CASCADE,
	FOREIGN KEY (Usuario) REFERENCES Cliente(Correo) ON DELETE CASCADE
);