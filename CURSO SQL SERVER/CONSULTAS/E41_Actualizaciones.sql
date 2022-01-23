-- 1. Actualizar el estatus del Alumnos de los que están en propedéutico a capacitaciónuse InstitutoTich2UPDATE Alumnos SET idEstatus = (SELECT id from EstatusAlumnos 									where Nombre = 'Prospecto')------------------------------------------------------------------------------------------2. Actualizar el segundo apellido del Alumno a MayúsculasUPDATE Alumnos SET segundoApellido = UPPER (Alumnos.segundoApellido)  SELECt * from Alumnos----------------------------------------------------------------------------------------/*3. Actualizar el segundo Apellido para que la primera letra sea mayúsculas y el resto
minúsculas*/

UPDATE Alumnos SET segundoApellido = UPPER (LEFT(segundoApellido,1)) +
									 LOWER (substring(segundoApellido,2,len(segundoApellido)))
									 


----------------------------------------------------------------------------------------
/* 4. Actualizar el número telefónico de los instructores para que los dos primeros
dígitos sean 55, en caso de que de acuerdo al curp sean del DF
*/

SELECT * FROM Instructores

UPDATE Instructores
SET telefono ='55' + SUBSTRING(telefono, 3, LEN(telefono))
WHERE SUBSTRING(curp, 12, 2) = 'DF'

/*5. Subirles un punto en la calificación a los alumnos de Hidalgo y Oaxaca, y del
Curso impartido en junio de 2021. Se deberá considerar que al incrementar el
punto no exceda del máximo de la calificación permitida.*/

SELECT A.id, A.nombre, E.id, E.nombre, C.id, C.fechaInicio, CA.fechaInscripcion
FROM CursosAlumnos CA, Alumnos A, Cursos C, Estados E
WHERE 1 =  1
AND E.id = A.idEstadoOrigen
AND A.id = CA.idAlumno
AND CA.idCurso = C.id
AND (E.id = 19 OR E.id = 12)
--AND ca.calificacion <10

UPDATE CursosAlumnos
SET calificacion = calificacion + 1
WHERE calificacion <10;

--6. Subirle el 10% de la cuota por hora a los profesores que han impartido el curso de Desarrollador .Net
SELECT I.id, I.nombre, C.id, CAT.id, CAT.Nombre
FROM Instructores I,
	 CursosInstructores CI,
	 Cursos C,
	 CatCursos CAT
WHERE 1=1
AND	CAT.id = C.idCatCurso
AND C.id = CI.idCurso
AND CI.idInstructor = I.id
AND CAT.id = 5

SELECT * FROM Instructores;

UPDATE Instructores
SET cuotaHora = (cuotaHora * 0.1) + cuotaHora
WHERE id IN (2, 4);

--7 En la Base de Datos Ejercicios realice lo siguiente:

 --A Copiar la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla AlumnosTodos
SELECT * INTO Ejercicios.dbo.AlumnosTodos 
FROM Alumnos;

--B Copiar a los alumnos de Hidalgo de la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla AlumnosHgo
SELECT *
INTO Ejercicios.dbo.AlumnosHgo
FROM Alumnos
WHERE 1 = 1
AND idEstadoOrigen = 12;

SELECT * FROM Instructores;

--C En la Tabla AlumnosHgo cambiarles el número telefónico inicie con 77, mediante la instrucción update
USE Ejercicios;

--SELECT * FROM AlumnosHgo

UPDATE AlumnosHgo
SET telefono = '77' + SUBSTRING(telefono, 3, LEN(telefono))

--D Actualizar el teléfono de la tabla AlumnosTodos obtenidos desde la taba AlumnosHgo

select * from AlumnosTodos

UPDATE AlumnosTodos 
SET telefono = (SELECT AHDGO.telefono
				FROM AlumnosHgo AHDGO
				WHERE AHDGO.id = 6) 
WHERE id = 6

UPDATE AlumnosTodos 
SET telefono = (SELECT AHDGO.telefono
				FROM AlumnosHgo AHDGO
				WHERE AHDGO.id = 16) 
WHERE id = 16