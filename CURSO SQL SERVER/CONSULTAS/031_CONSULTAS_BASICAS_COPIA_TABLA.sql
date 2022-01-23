--1 CONSULTA DE ALUMNOS

select * from Alumnos;

--2 CONSULTA DE INSTRUCTORES

select * from Instructores;

--3 CONSULTA DE CATCURSOS

select * from CatCursos;

select * from CursosInstructores;

--4 CONSULTA DE LOS 5 MAS JOVENES 
select top (5) *
from Alumnos
order by fechaNacimiento desc
 

--6 COPIA DE TABLA
--select * into Ejercicios.dbo.Alumnos_Copia from Alumnos