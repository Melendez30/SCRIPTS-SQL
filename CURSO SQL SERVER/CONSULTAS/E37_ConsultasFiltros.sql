-- 1. Alumnos cuyo apellido sea “Mendoza”

select * from Alumnos 
	where primerApellido = 'Mendoza'

-------------------------------------------------
--2. Alumnos cuyo estatus sea “En Capacitación”

SELECT Alumnos.nombre as Alumno, Alumnos.primerApellido as 'Primer Apellido',EA.Nombre as Estatus
	FROM Alumnos
     INNER JOIN EstatusAlumnos as EA 
    ON EA.id = Alumnos.idEstatus
   where EA.Nombre = 'En capacitación'
--------------------------------------------------------------------------------------------------
--3. Instructores que sean mayores de 30 años
-- DATEDIFF(YEAR, fechaNacimiento, dateadd(month, 5, getdate())) as 'Fecha en 5 meses'

select Instructores.nombre, Instructores.primerApellido, Instructores.segundoApellido,
--CURRENT_TIMESTAMP as Hoy,
DATEDIFF(YEAR, fechaNacimiento, getdate())  as Edad
from Instructores
WHERE DATEDIFF(YEAR, fechaNacimiento, getdate()) >= 40
--------------------------------------------------------------------------------------------------
--4. Alumnos que estén entre 20 y 25 años

SELECT Alumnos.nombre as Alumno, Alumnos.primerApellido as 'Primer Apellido',
DATEDIFF(YEAR, fechaNacimiento, getdate())  as Edad
from Alumnos
where DATEDIFF(YEAR, fechaNacimiento, getdate()) between 20 and 25
---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Alumnos que sea del Estado de “Oaxaca” y su estatus sea “En Capacitación”, o que sean de “Campeche” y que estén en estatus “Prospecto”

select Alumnos.nombre as Alumno, Alumnos.primerApellido as 'Primer Apellido', E.nombre as Estado, EA.Nombre as Estatus
    from Alumnos
     inner join Estados as E
    on E.id = Alumnos.idEstadoOrigen
     inner join EstatusAlumnos as EA
    on EA.id = Alumnos.idEstatus
    WHERE EA.Nombre LIKE 'En Capacitación'
                    and E.nombre = 'Jalisco' 
   order by Alumnos.nombre, Alumnos.primerApellido, E.nombre, EA.Nombre
--------------------------------------------------------------------------------------------------
--6. Alumnos cuyo correo sea de gmail

SELECT Alumnos.nombre as Nombre, Alumnos.correo as 'Correo Gmail'
from Alumnos 
where Alumnos.correo like '%gmail.%'

--------------------------------------------------------------------------------------------------
--7. Alumnos que cumplen años en el mes de marzo

select * from Alumnos
where month(Alumnos.fechaNacimiento ) = 3
--------------------------------------------------------------------------------------------------
-- 8. Alumnos que cumplen 30 años dentro de 5 años en relación con la fecha actual

SELECT Alumnos.nombre as Alumno, Alumnos.primerApellido as 'Primer Apellido',
CURRENT_TIMESTAMP as Hoy,
DATEDIFF(YEAR, fechaNacimiento, getdate())  as Edad,
DATEDIFF(YEAR, fechaNacimiento, dateadd(year, 5, getdate())) as 'Fecha en 5 años'
from Alumnos 
where DATEDIFF(YEAR, fechaNacimiento, dateadd(year, 5, getdate())) = 30
--------------------------------------------------------------------------------------------------
--9. Alumnos cuyo nombre exceda de 10 caracteres

SELECT (Alumnos.nombre) as nombre, len( Alumnos.nombre) as Caracteres
from Alumnos 
where len( Alumnos.nombre) > 10
--------------------------------------------------------------------------------------------------
--10. Alumnos cuyo último carácter del curp sea numérico

select * from Alumnos where ISNUMERIC (substring(curp,18,1))<>0
--------------------------------------------------------------------------------------------------

--11. Alumnos cuya calificación sea mayor que 8 

select * from Alumnos as A
inner join CursosAlumnos as CA
on CA.idAlumno = A.id
where calificacion > 8

--------------------------------------------------------------------------------------------------

--12. Alumnos que se encuentren en estatus laborando o liberado con un sueldo superior a 15,000

select * from Alumnos as A
     inner join EstatusAlumnos as EA
     on EA.id = A.idEstatus
        WHERE (EA.Nombre = 'laborando'or
              EA.Nombre = 'liberado')
              and A.sueldoMensual > 15000

--------------------------------------------------------------------------------------------------

--13. Alumnos cuyo año de nacimiento esté entre 1990 y 1995 y que su primer apellido empiece con B, C ó Z

SELECT Alumnos.nombre as Nombre, Alumnos.primerApellido as Apellido
from Alumnos
WHERE Alumnos.fechaNacimiento BETWEEN '1990' and '1995'
and Alumnos.primerApellido like 'M%'

--------------------------------------------------------------------------------------------------

/*14. Alumnos cuyo fecha de Nacimiento no coincide con la fecha de nacimiento del curp
• Nombre del alumno
• Curp
• Fecha de Nacimiento
*/

SELECT Alumnos.nombre as Nombre, Alumnos.primerApellido as Apellido, Alumnos.curp as CURP, Alumnos.fechaNacimiento as 'Fecha de Nacimiento'
from Alumnos
where Alumnos.fechaNacimiento <> SUBSTRING(curp, 5,6)

--------------------------------------------------------------------------------------------------

--15. Alumnos cuyo primer apellido inicie con ‘A’ y el mes de nacimiento sea abril y que tengan entre 21 y 30 años

SELECT Alumnos.nombre as Nombre, Alumnos.primerApellido as Apellido,
DATEDIFF(YEAR, fechaNacimiento, getdate()) as edad
from Alumnos
WHERE  Alumnos.primerApellido like 'A%' 
and  month(Alumnos.fechaNacimiento ) = 6
 and DATEDIFF(YEAR, fechaNacimiento, getdate()) between 21 and 30

 
--------------------------------------------------------------------------------------------------
-- 16. Obtener una lista de alumnos que se llaman Luis aunque sea compuesto
SELECT Alumnos.nombre as Nombre, Alumnos.primerApellido as Apellido
from Alumnos
WHERE  Alumnos.nombre like 'Luis%'

SELECT Alumnos.primerApellido, Alumnos.fechaNacimiento FROM Alumnos

--------------------------------------------------------------------------------------------------
/*
17. Obtener una consulta de los cursos que se han impartido en el año de 2021,
o nombre del curso
o fecha de inicio
o fecha final
o cantidad de alumnos
o promedio de calificaciones.
*/


select CatCursos.Nombre, C.fechaInicio, C.fechaTermino, count(A.id) as 'Cantidad de alumnos', avg(CursosAlumnos.calificacion) as 'promedio de calificaciones'
from CatCursos
inner join Cursos as C 
ON C.idCatCurso = CatCursos.id
inner join CursosAlumnos 
ON CursosAlumnos.idCurso = C.id
inner join Alumnos as A
on A.id = CursosAlumnos.idAlumno
where DATEPART(YEAR, C.fechaInicio) = 2021
group by  CatCursos.Nombre, C.fechaInicio, C.fechaTermino




--------------------------------------------------------------------------------------------------
/*
18. Realizar la siguiente consulta Resumen de Calificaciones por Estado, considerando únicamente a los alumnos que tienen calificación mayor a 6 mostrando únicamente a los estados cuyo total de alumnos (con promedio mayor a 6) sea mayor a 1
*/

select Estados.nombre, count(Alumnos.id) as Total, avg(CursosAlumnos.calificacion) as 'Promedio Calificación', avg(Alumnos.sueldoMensual) as 'Promedio Sueldo'
from Estados
inner join Alumnos
on Alumnos.idEstadoOrigen = Estados.id
inner join CursosAlumnos
on CursosAlumnos.idAlumno = Alumnos.id
where CursosAlumnos.calificacion > 6
 
group by Estados.nombre
having count(Alumnos.id) > 1

--------------------------------------------------------------------------------------------------

