Create database InstitutoTich;
use InstitutoTich;
create table Estados(
  id int PRIMARY KEY IDENTITY NOT NULL,
  nombre varchar(100) NULL
 );

 create table EstatusAlumnos(
  id smallint PRIMARY KEY IDENTITY NOT NULL,
  Clave char(10) NOT NULL,
  Nombre varchar(100) NOT NULL
 );

  create table CatCursos(
  id smallint PRIMARY KEY IDENTITY NOT NULL,
  Clave Varchar(15) NOT NULL,
  Nombre varchar(50) NOT NULL,
  Descripcion varchar(150) NULL,
  Horas tinyint NOT NULL,
  idPreRequisito smallint NULL,
  Activo bit NOT NULL
 );

  create table Cursos(
  id smallint PRIMARY KEY IDENTITY NOT NULL,
  idCatCurso smallint FOREIGN KEY REFERENCES CatCursos(id) NULL,
  fechaInicio date NULL,
  fechaTermino date NULL,
  activo bit NULL
 );

  create table Alumnos(
  id int PRIMARY KEY IDENTITY NOT NULL,
  nombre Varchar(60) NOT NULL,
  primerApellido varchar(50) NOT NULL,
  segundoApellido varchar(50) NULL,
  correo varchar(80) NOT NULL,
  telefono nchar(10) NOT NULL,
  fechaNacimiento date NOT NULL,
  curp char(18) NOT NULL,
  sueldoMensual decimal(9,2) NULL,
  idEstadoOrigen int FOREIGN KEY REFERENCES Estados(id) NOT NULL,
  idEstatus smallint FOREIGN KEY REFERENCES EstatusAlumnos(id) NOT NULL
 );

 create table Instructores(
  id smallint PRIMARY KEY IDENTITY NOT NULL,
  nombre Varchar(60) NOT NULL,
  primerApellido varchar(50) NOT NULL,
  segundoApellido varchar(50) NULL,
  correo varchar(80) NOT NULL,
  telefono nchar(10) NOT NULL,
  fechaNacimiento date NOT NULL,
  rfc char(13) NOT NULL,
  curp char(18) NOT NULL,
  cuotaHora decimal(9,2) NOT NULL,
  activo bit NOT NULL
 );

  create table CursosAlumnos(
  id int PRIMARY KEY IDENTITY NOT NULL,
  idCurso smallint FOREIGN KEY REFERENCES Cursos(id) NOT NULL,
  idAlumno int FOREIGN KEY REFERENCES Alumnos(id) NOT NULL,
  fechaInscripcion date NOT NULL,
  fechaBaja date NULL,
  calificacion tinyint NULL,
 );

  create table CursosInstructores(
  id int PRIMARY KEY IDENTITY NOT NULL,
  idCurso smallint FOREIGN KEY REFERENCES Cursos(id) NOT NULL,
  idInstructor smallint FOREIGN KEY REFERENCES Instructores(id) NOT NULL,
  fechaContratacion date NULL,
 );

  create table AlumnosBaja(
  id int PRIMARY KEY IDENTITY NOT NULL,
  nombre Varchar(60) NOT NULL,
  primerApellido varchar(50) NOT NULL,
  segundoApellido varchar(50) NULL,
  fechaBaja datetime
 );

   create table TablaISR(
  id int PRIMARY KEY IDENTITY NOT NULL,
  LimInf decimal(19,2) NOT NULL,
  LimSup decimal(19,2) NOT NULL,
  CuotaFija decimal(19,2) NOT NULL ,
  ExedLimInf decimal(19,2) NOT NULL,
  Subsidio decimal(19,2) NOT NULL
 );

 


 delete from Estados;

 select * from Cursos 



---------------------------------------------------------------------------------------------------------------------------
USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CatCursos] ON 

INSERT [dbo].[CatCursos] ([id], [Clave], [Nombre], [Descripcion], [Horas], [idPreRequisito], [Activo]) VALUES (1, N'DummNet', N'Desarrollador.Net', N'El objetivo de este curso es preparar al desarrollador con los conocimientos necesarios en .Net', 120, 01, 1)
INSERT [dbo].[CatCursos] ([id], [Clave], [Nombre], [Descripcion], [Horas], [idPreRequisito], [Activo]) VALUES (2, N'DummJava', N'Desarrollador.Net Full Stack', N'El objetivo de este curso es consolidar y expandir los conocimientos en .Net', 60, 02, 1)
INSERT [dbo].[CatCursos] ([id], [Clave], [Nombre], [Descripcion], [Horas], [idPreRequisito], [Activo]) VALUES (3, N'MastNet', N'Desarrollador Java', N'El objetivo de este curso es preparar al desarrollador con los conocimientos necesarios en Java', 120, 03, 1)
INSERT [dbo].[CatCursos] ([id], [Clave], [Nombre], [Descripcion], [Horas], [idPreRequisito], [Activo]) VALUES (4, N'MastJava', N'Desarrollador Java Full Stack', N'El objetivo de este curso es consolidar y expandir los conocimientos en Java', 60,04, 1)
SET IDENTITY_INSERT [dbo].[CatCursos] OFF
GO
----------------------------------------------------------------------------------------------------------------------------------
USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (1, 1, N'2021-01-10', N'2021-01-28', 1)
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (2, 2, N'2021-02-08', N'2021-02-17', 1)
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (3, 3, N'2021-02-22', N'2021-03-12', 1)
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (4, 4, N'2021-03-15', N'2021-03-24', 1)
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (5, 2, N'2021-03-29', N'2021-04-07', 1)
INSERT [dbo].[Cursos] ([id], [idCatCurso], [fechaInicio], [fechaTermino], [activo]) VALUES (6, 1, N'2021-04-12', N'2021-04-30', 1)

SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
---------------------------------------------------------------------------------------------------------------------------------------------
USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CursosAlumnos] ON 
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (1, 1, 1, N'2021-01-07',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (2, 1, 2, N'2021-01-04',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (3, 1, 3, N'2021-01-06',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (4, 1, 4, N'2021-01-01',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (5, 1, 5, N'2021-01-08',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (6, 2, 6, N'2021-02-01',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (7, 2, 7, N'2021-02-03',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (8, 2, 8, N'2021-02-02',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (9, 2, 9, N'2021-02-07',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (10, 3, 10, N'2021-02-10',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (11, 3, 11, N'2021-02-12',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (12, 3, 12, N'2021-02-11',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (13, 3, 13, N'2021-02-14',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (14, 3, 14, N'2021-02-18',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (15, 4, 15, N'2021-03-01',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (16, 4, 16, N'2021-03-04',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (17, 4, 17, N'2021-03-03',null ,null)
INSERT INTO [dbo].[CursosAlumnos] ([id],[idCurso] ,[idAlumno] ,[fechaInscripcion] ,[fechaBaja] ,[calificacion]) VALUES (18, 4, 18, N'2021-03-05',null ,null)
SET IDENTITY_INSERT [dbo].[CursosAlumnos] OFF
GO
---------------------------------------------------------------------------------------------------------------------------------------------------

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CursosInstructores] ON 

INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (1, 1 ,1, N'2015-05-11')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (2, 2 ,1, N'2015-05-10')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (3, 3 ,2, N'2017-03-20')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (4, 4 ,2, N'2017-03-20')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (5, 1 ,3, N'2018-08-27')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (6, 2 ,3, N'2018-08-27')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (7, 3 ,4, N'2020-01-07')
INSERT [dbo].[CursosInstructores] ([id], [idCurso] ,[idInstructor],[fechaContratacion]) VALUES (8, 4 ,4, N'2020-01-07')

SET IDENTITY_INSERT [dbo].[CursosInstructores] OFF
GO