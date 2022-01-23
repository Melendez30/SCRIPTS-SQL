--1. Realizar la siguiente consulta Alumnos por Estado

select * from Alumnos 


-- 1. Realizar la siguiente consulta Alumnos por Estado

select Est.nombre as Estado,count(Alu.nombre) as 'Total de Alumnos'
from Alumnos as Alu 
inner join Estados as Est
on Alu.idEstadoOrigen=Est.id
group by Est.nombre

--------------------------------------------------------------

--2. Realizar la siguiente consulta Alumnos por Estatusselect est.nombre as Estatus,count(est.id) as 'Total'
from Alumnos as A 
inner join EstatusAlumnos as est
on A.idEstatus=est.id
group by est.nombre

--------------------------------------------------------------

--3 Realizar la siguiente consulta Resumen de Calificaciones

select 'Calificaciones Alumnos' as Calificaciones, 
COUNT(A.id) as 'Total', 
max(CA.calificacion) as 'Maximo',
min(CA.calificacion) as 'Minimo',
avg(CA.calificacion) as 'Promedio'
from Alumnos A
inner join CursosAlumnos as CA
on CA.idAlumno = A.id

--------------------------------------------------------------

--4. Realizar la siguiente consulta Resumen de Calificaciones por Curso

select CC.Nombre, C.fechaInicio, C.fechaTermino,  
count(CA.calificacion) as 'Total',
max(CA.calificacion) as 'Maximo',
min(CA.calificacion) as 'Minimo',
avg(CA.calificacion) as 'Promedio'
from CatCursos CC 
	  inner join Cursos C 
	   on C.idCatCurso = CC.id
	  inner join CursosAlumnos CA
	   on C.id = CA.idCurso
	   group by CC.Nombre, C.fechaInicio, C.fechaTermino
	  
--------------------------------------------------------------
--5 

select E.nombre as Estado,
	count(CA.calificacion) as 'Total',
	max(CA.calificacion) as 'Maximo',
	min(CA.calificacion) as 'Minimo',
	avg(CA.calificacion) as 'Promedio'
	from Estados E
	inner join Alumnos A
	on A.idEstadoOrigen = E.id
	inner join CursosAlumnos CA
	on A.id = CA.calificacion
	
	group by E.nombre HAVING avg(CA.calificacion) > 6