--1. Realizar la siguiente Consulta con el nombre y apellidos en Mayúsculas
select Alumnos.id AS 'ID',
UPPER(Alumnos.nombre) as 'Nombre',
UPPER (Alumnos.primerApellido) as 'Primer Apellido',
UPPER (Alumnos.segundoApellido) as 'Segundo Apellido', 
Alumnos.fechaNacimiento, 
CURRENT_TIMESTAMP as Hoy,
DATEDIFF(YEAR, fechaNacimiento, getdate())  as Edad,
DATEDIFF(YEAR, fechaNacimiento, dateadd(month, 5, getdate())) as 'Fecha en 5 meses'
from Alumnos

---------------------------------------------------------------------------------------
--2. Realizar la consulta Anterior agregando columna con la fecha de nacimiento extraída del CURP

select Alumnos.id AS 'ID',
UPPER(Alumnos.nombre) as 'Nombre',
UPPER (Alumnos.primerApellido) as 'Primer Apellido',
UPPER (Alumnos.segundoApellido) as 'Segundo Apellido', 
Alumnos.fechaNacimiento,
Alumnos.curp,
substring(curp,5,6) as 'Fecha Curp'
from Alumnos

---------------------------------------------------------------------------------------
--3 Realizar una consulta con los datos del alumnos y una columna adicional indicando el género con la palabra ‘Hombre’ o ‘Mujer’ según corresponda de acuerdo con lo indicado en la columna 11 del curp 

select Alumnos.id AS 'ID',
UPPER(Alumnos.nombre) as 'Nombre',
UPPER (Alumnos.primerApellido) as 'Primer Apellido',
UPPER (Alumnos.segundoApellido) as 'Segundo Apellido', 
Alumnos.fechaNacimiento,
Alumnos.curp,
substring(curp,5,6) as 'Fecha Curp',
substring(curp,11,1) as 'Sexo'
from Alumnos

-------------------------------------------------------------------------------------------
--4. Realizar la siguiente consulta de Alumnos, cambiando el correo de Gmail por hotmail


select Alumnos.id AS 'ID',
UPPER(Alumnos.nombre) as 'Nombre',
UPPER (Alumnos.primerApellido) as 'Primer Apellido',
UPPER (Alumnos.segundoApellido) as 'Segundo Apellido', 
Alumnos.fechaNacimiento,
Alumnos.correo,
REPLACE(correo, 'gmail', 'hotmail') as 'correo hotmail'
from Alumnos

-------------------------------------------------------------------------------------------
