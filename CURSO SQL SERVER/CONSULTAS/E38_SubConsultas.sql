--1. Obtener el nombre del alumno cuya longitud es la más grande

 select Alumnos.nombre 
 from Alumnos 
 where len (Alumnos.nombre) = (select max(len (Alumnos.nombre))
 from Alumnos)
 
 
 --------------------------------------------------------------------------------

 -- 2. Mostrar el o los alumnos menos jóvenes select 
 a.nombre, DATEDIFF (YEAR, a.fechaNacimiento, CURRENT_TIMESTAMP)
 from Alumnos a
 WHERE  DATEDIFF (YEAR, a.fechaNacimiento, CURRENT_TIMESTAMP) > (select AVG(DATEDIFF (YEAR, alu.fechaNacimiento, CURRENT_TIMESTAMP))
 from Alumnos alu)

 ----------------------------------------------------------------------------------3. Obtener una lista de los alumnos que tuvieron la máxima calificación

SELECT a.nombre,
	   a.primerApellido,
	   a.segundoApellido,
	   cat.Nombre Curso,
	   c.fechaInicio fechaInicio,
	   c.fechaTermino fechaTermino,
	   ca.calificacion
FROM alumnos a
INNER JOIN CursosAlumnos ca ON ca.idAlumno = a.id
INNER JOIN cursos c ON c.id= ca.idCurso
INNER JOIN catCursos cat ON cat.id = c.idCatCurso
WHERE ca.calificacion = (SELECT MAX(calum.calificacion) Cal
						 FROM CursosAlumnos calum);

--------------------------------------------------------------------------------
--4. Obtener la siguiente consulta con los datos de cada uno de los cursos

SELECT cat.Nombre,
	   CU.fechaInicio,
	   CU.fechaTermino,
	   COUNT(a.id) Total,
	   MAX(ca.calificacion) MaxCal,
	   MIN(ca.calificacion) MinCal,
	   AVG(ca.calificacion) PromCal
FROM catCursos cat,
	 (SELECT c.idCatCurso,
				   c.id,
				   c.fechaInicio,
				   c.fechaTermino
			FROM cursos c) AS CU,
	 alumnos a,
	 (SELECT calum.idCurso,
				   calum.id,
				   calum.calificacion
			FROM CursosAlumnos calum) AS ca
WHERE 1=1
AND cat.id = CU.idCatCurso
AND CU.id = ca.idCurso
AND ca.id = a.id
GROUP BY cat.Nombre,
	   CU.fechaInicio,
	   CU.fechaTermino


--------------------------------------------------------------------------------
--5. Obtener una consulta de los alumnos que tienen una calificación igual o menor que el promedio de calificaciones.SELECT *
FROM alumnos a
INNER JOIN	CursosAlumnos ca 
ON a.id = ca.idAlumno
WHERE ca.calificacion <= (SELECT AVG(calificacion)
						  FROM CursosAlumnos)
--------------------------------------------------------------------------------
--6. Obtener una lista de los alumnos que tuvieron la máxima calificación en cada uno de los cursos.

SELECT  A.nombre, 
		A.primerApellido, 
		A.segundoApellido, 
		A.fechaNacimiento, 
		cat.Nombre, 
		C.fechaInicio, 
		C.fechaTermino, 
		calificacionMaxima.calificacion
            FROM alumnos AS A
            INNER JOIN (SELECT ca.idCurso,
				   ca.idAlumno,
				   ca.calificacion
			FROM CursosAlumnos ca
			INNER JOIN (SELECT calum.idCurso,
							  MAX(calum.calificacion) AS calMax
						FROM CursosAlumnos calum
						GROUP BY calum.idCurso) AS maxCal ON ca.idCurso = maxCal.idCurso AND ca.calificacion = maxCal.calMax) AS calificacionMaxima
			ON A.id = calificacionMaxima.idAlumno
INNER JOIN cursos c ON calificacionMaxima.idCurso = c.id
INNER JOIN catCursos cat ON c.idCatCurso = cat.id