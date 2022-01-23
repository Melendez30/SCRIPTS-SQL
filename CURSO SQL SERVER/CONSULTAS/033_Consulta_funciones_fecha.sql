--1. Realizar la siguiente consulta de Alumnos, con edad actual y edad en 5 Meses


select Alumnos.id, Alumnos.nombre, Alumnos.primerApellido, Alumnos.segundoApellido, Alumnos.fechaNacimiento, 
CURRENT_TIMESTAMP as Hoy,
DATEDIFF(YEAR, fechaNacimiento, getdate())  as Edad,
DATEDIFF(YEAR, fechaNacimiento, dateadd(month, 5, getdate())) as 'Fecha en 5 meses'
from Alumnos




