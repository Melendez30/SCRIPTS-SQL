create database InstitutoTich; 
use InstitutoTich

create table estadosTich(
  id int primary key not null,
  nombre varchar(100) 
)
GO
create table estadosAlumnos(
  id smallint primary key not null,
  clave char(10) not null, 
  nombre varchar(100) not null
)
GO
create table catCursos(
idCatCurso smallint identity(1,1) primary key not null,
clave varchar(15) not null,
nombre varchar(50) not null,
descripcion varchar(1000),
horas tinyint not null,
idPreRequisito smallint,
activo bit not null,
constraint fk_catCurso foreign key (idPreRequisito)
references catCursos (idCatCurso)
)
GO
create table cursos(
id_cursos smallint identity(1,1) primary key not null,
idCatCurso smallint,
fecha_inicio date, 
fecha_termino date,
activo bit,
constraint fk_cursos_catcursos foreign key (idCatCurso)
references catCursos(idCatCurso)
)
GO 
create table alumnos(
id_alumnos int identity(1,1) primary key not null,
nombre_alumno varchar(60),
primer_Apell varchar(50)not null,
segundo_Apell varchar(50),
correo varchar(80)not null,
telefono nchar(10)not null,
fecha_Naci date not null,
curp char(18)not null,
sueldo decimal(9,2),
id_Estado_Origen smallint not null,
id_Estatus int not null,
constraint fk_alumnos_estadosAlumnos foreign key (id_Estado_Origen)
references estadosAlumnos (id),
constraint fk_alumnos_estadosTich foreign key (id_Estatus)
references estadosTich (id),
)
GO
create table instructores(
id_instructores smallint identity(1,1) primary key not null,
nombre varchar(60) not null,
primer_Apellido varchar(50) not null,
segundo_Apellido varchar(50),
correo varchar (80) not null,
telefono nchar(10) not null,
fecha_Nacimiento date not null,
rfc char(13) not null,
curp char(18) not null,
cuota_hora decimal(9,2) not null,
activo bit not null
)
GO 
create table cursoAlumnos(
id_cursoAlumnos int identity(1,1) primary key not null,
idCurso smallint not null foreign key references cursos (id_cursos), 
idAlumno int not null foreign key references alumnos (id_alumnos),
fecha_Inscripcion date not null,
fecha_Baja date,
calificacion tinyint
)
GO 
create table cursoInstructores(
id int identity(1,1) primary key not null,
idCurso smallint not null foreign key references cursos (id_cursos),
id_Instructor smallint not null foreign key references instructores (id_instructores),
fecha_Contratacion date
)
GO 
create table alumnosBaja(
id int identity(1,1) primary key not null,
nombre varchar(60),
primer_apell varchar(50)not null,
segundo_apell varchar(50),
fecha_baja datetime not null
)