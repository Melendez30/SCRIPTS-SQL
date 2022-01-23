/* 1. Obtener una consulta que contenga el Nombre y apellidos, mes y día
de nacimiento de todos los alumnos y profesores, ordenado por tipo
mes y día de nacimiento
*/


SELECT 'ALUMNO' [TIPO DE PERSONA],
nombre, primerApellido, segundoApellido, substring(curp,7,2) as 'MES', substring(curp,9,2) as 'DIA' 
FROM Alumnos
UNION
SELECT 'INSTRUCTOR' [TIPO DE PERSONA],
nombre, primerApellido, segundoApellido, substring(curp,7,2) as 'MES', substring(curp,9,2) as 'DIA' 
FROM Instructores
ORDER BY substring(curp,7,2), substring(curp,9,2),  [TIPO DE PERSONA]
