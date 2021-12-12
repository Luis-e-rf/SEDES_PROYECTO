Create database Sedes;

use sedes;

create table profesion( 
id_profesion bigint auto_increment not null,
nombre_profesion varchar (50) not null,
descripcion_profesion varchar (500) not null,
primary key (id_profesion)
);


create table sede( 
id_sede bigint auto_increment not null,
nombre_sede varchar (50) not null,
Horario_sede varchar (100) NOT NULL,
observaciones_sede varchar (500) not null,
primary key (id_sede)
);

create table tipo_aula( 
id_tipo_aula bigint auto_increment not null,
nombre_tipo_aula varchar (50) not null,
descripcion_tipo_aula varchar (500) not null,
primary key (id_tipo_aula)
);

create table programa( 
id_programa bigint not null,
nombre_programa varchar (50) not null,
version_programa bigint not null,
descripcion_programa varchar (500) not null,
primary key (id_programa)
);

create table Tipo_Inventario (
Id_Tipo_Inventario BIGINT(15) NOT NULL AUTO_INCREMENT,
Nombre_Tipo_Inventario VARCHAR(50) NOT NULL,
Descripcion_Tipo_Inventario VARCHAR(500) NOT NULL,
PRIMARY KEY (Id_Tipo_Inventario)
);
create table Tipo_Elemento (
  idTipo_Elemento BIGINT(20) NOT NULL AUTO_INCREMENT,
  Nombre_Tipo_Elemento VARCHAR(100) NOT NULL,
  PRIMARY KEY (idTipo_Elemento)
  );
create table Marca(
  idMarca BIGINT (20) NOT NULL AUTO_INCREMENT,
  Nombre_Marca VARCHAR(100) NOT NULL,
  Descripcion_Marca VARCHAR(200) NOT NULL,
  PRIMARY KEY (idMarca)
  );
  create table Estado(
Id_Estado BIGINT(15) NOT NULL auto_increment,
Nombre_Estado VARCHAR(45) NULL,
Observaciones_Estado VARCHAR(45) NULL,
primary key (Id_Estado)
);
  
create table Tipo_usuario(
Id_Tipo_usuario bigint (20) NOT NULL auto_increment,
Nombre_Tipo_usuario VARCHAR(50) NOT NULL,
Descripcion_Tipo_usuario  VARCHAR(500) NOT NULL,
primary key  (Id_Tipo_usuario)
);

create table tipo_documento( 
id_tipo_documento bigint auto_increment not null,
nombre_tipo_documento varchar (50) not null,
descripcion_tipo_documento varchar (500) not null,
primary key (id_tipo_documento)
);
create table Tipo_Persona(
id_Tipo_Persona BIGINT(15) NOT NULL auto_increment,
Nombre_Tipo_Persona VARCHAR(50) NOT NULL,
Descripcion_Tipo_Persona VARCHAR(500) NULL,
PRIMARY KEY (id_Tipo_Persona)
);
create table ficha( 
numero_ficha bigint not null,
id_programa bigint not null,
fecha_inicio date not null,
fecha_fin date not null,
primary key (numero_ficha),
constraint fk_ficha_programa foreign key (id_programa) references programa (id_programa)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table aula( 
id_aula bigint not null,
id_tipo_aula bigint not null,
id_sede bigint not null,
nombre_aula varchar (50) not null,
observaciones_aula varchar (500) not null,
primary key (id_aula),
constraint fk_aula_tipo_aula foreign key (id_tipo_aula) references tipo_aula (id_tipo_aula),
constraint fk_aula_sede foreign key (id_sede) references sede (id_sede)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
create table Elementos(
Id_Elemento BIGINT(15) NOT NULL,
idTipo_Elemento BIGINT(20) NOT NULL,
idMarca BIGINT(20) NOT NULL,
Id_Estado bigint(15) not null,
Nombre_Elemento VARCHAR(50) NOT NULL,
Descripcion_Elemento VARCHAR(500) NOT NULL,

PRIMARY KEY (Id_Elemento),
constraint fk_Elementos_Tipo_Elemento foreign key (idTipo_Elemento) references Tipo_Elemento (idTipo_Elemento),
constraint fk_Elementos_Marca foreign key (idMarca) references Marca (idMarca),
constraint fk_Elementos_Estado foreign key (Id_Estado) references Estado (Id_Estado)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table Persona(
documento_Persona BIGINT(20) NOT NULL,
id_tipo_documento BIGINT(20) NOT NULL,
Id_Tipo_Persona BIGINT(15) NOT NULL,
Nombre_Persona VARCHAR(50) NOT NULL,
Apellido_Persona VARCHAR(50) NOT NULL,
Direccion_Persona VARCHAR(100) NOT NULL,
Telefono_Persona VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
primary key (documento_Persona),
constraint fk_Persona_tipo_documento foreign key (id_tipo_documento) REFERENCES tipo_documento (id_tipo_documento),
constraint fk_Persona_Tipo_Persona foreign key (Id_Tipo_Persona) REFERENCES Tipo_Persona (id_Tipo_Persona)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
create table Usuario (
Nombre_Usuario VARCHAR(50) NOT NULL,
Contraseña_Usuario VARCHAR(50) NOT NULL,
documento_Persona BIGINT(20) NOT NULL,
Id_Tipo_usuario bigint NOT NULL,
primary key (Nombre_Usuario),
constraint fk_Usuario_Persona foreign key  (documento_Persona) references Persona (documento_Persona),
constraint fk_Usuario_Tipo_usuario foreign key (Id_Tipo_usuario) references Tipo_usuario ( Id_Tipo_usuario)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);



create table Persona_profesion(
id_Persona_profesion BIGINT(20) NOT NULL AUTO_INCREMENT,
documento_Persona BIGINT(20) NOT NULL,
id_profesion BIGINT(20) NOT NULL,
primary key (id_Persona_profesion),
constraint fk_Personar_profesion_Persona foreign key (documento_Persona) REFERENCES Persona (documento_Persona),
constraint fk_Persona_profesion_Persona foreign key (id_profesion) REFERENCES profesion (id_profesion)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table Persona_ficha(
id_Persona_ficha BIGINT(20) NOT NULL AUTO_INCREMENT,
numero_ficha BIGINT(20) NOT NULL,
documento_Persona BIGINT(20) NOT NULL,
primary key (id_Persona_ficha),
constraint fk_Persona_ficha_ficha foreign key (numero_ficha) REFERENCES ficha (numero_ficha),
constraint fk_Persona_ficha_Persona foreign key (documento_Persona) REFERENCES Persona (documento_Persona)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table aula_ficha(
id_aula_ficha bigint auto_increment not null,
numero_ficha bigint not null,
id_aula bigint not null,
primary key (id_aula_ficha),
constraint fk_aula_ficha_ficha foreign key (numero_ficha) references ficha (numero_ficha),
constraint fk_aula_ficha_aula foreign key (id_aula) references aula (id_aula)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table Sede_inventario(
Id_Sede_inventario BIGINT(15) NOT NULL AUTO_INCREMENT,
Id_sede BIGINT(20) NOT NULL,
Id_Tipo_Inventario BIGINT(15) NOT NULL,
primary key (Id_Sede_inventario),
constraint fk_Sede_inventario_sede foreign key (Id_sede) REFERENCES sede (id_sede),
constraint fk_Sede_inventario_Tipo_Inventario foreign key (Id_Tipo_Inventario) REFERENCES Tipo_Inventario (Id_Tipo_Inventario)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
 
create table inventario_elementos(
Id_inventario_elementos BIGINT(15) NOT NULL AUTO_INCREMENT,
Id_Tipo_Inventario BIGINT(15) NOT NULL,
Id_Elemento BIGINT(15) NOT NULL,
primary key(Id_inventario_elementos),
constraint fk_inventario_elementos_Tipo_Inventario foreign key (Id_Tipo_Inventario) REFERENCES Tipo_Inventario( Id_Tipo_Inventario),
constraint fk_inventario_elementos_Elementos foreign key (Id_Elemento) REFERENCES Elementos (Id_Elemento)
);


create table Prestamos(
Id_Prestamos BIGINT(15) NOT NULL AUTO_INCREMENT,
documento_Persona BIGINT(20) NOT NULL,
Id_Elemento BIGINT(15) not null,
Fecha_Prestamos DATE NOT NULL,
Hora_Prestamos TIME (6) NOT NULL,
Fecha_Entrega DATE ,
Hora_entrega TIME(6) ,
Observaciones varchar(200),
primary key( Id_Prestamos),
constraint fk_Prestamos_Persona foreign key (documento_Persona) REFERENCES Persona (documento_Persona),
constraint fk_Prestamos_Elementos foreign key (Id_Elemento) REFERENCES Elementos (Id_Elemento)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );

-- -----------------------------------------------------
-- Datos
-- -----------------------------------------------------

insert into tipo_usuario (Nombre_Tipo_usuario,Descripcion_Tipo_usuario) values ('Administrador','Coordinador o Persona encargada de Administrar la sede');
insert into tipo_documento (nombre_tipo_documento,descripcion_tipo_documento) values ('Cedula de Ciudadania', 'Documento que reciben las personas mayores de 18 años');
insert into Tipo_Documento (nombre_tipo_documento,descripcion_tipo_documento) values ('Tarjeta de Identidad', 'Documento que reciben las personas mayores los 7 años y menor de 18 años');
insert into tipo_persona (Nombre_Tipo_Persona,Descripcion_Tipo_Persona)values ('Coordinador','Persona encargada de Administrar la sede');
insert into profesion (nombre_profesion, descripcion_profesion) values ('Ingeniero de sistemas', 'Aplicacion tecnologica de la teoria de sistemas a los esfuerzos de la ingeniería'),
('Ingeniero Ambiental', 'que estudia los problemas ambientales de forma científica e integrada'),
('Topografo', 'Estudia el conjunto de principios y procedimientos que tienen por objeto la representaciín gráfica de la superficie'),
('Ingeniero Quimico', 'Se encarga del diseño, manutencion, evaluación, optimización, simulación, planificación, construcción y operación de todo tipo de elementos en la industria de procesos'),
('Ingeniero de minas', 'que posee los conocimientos específicos en minas'),
('Otro', 'Otra Profesion'),('Aprendiz','Aprendiz en Formación');






