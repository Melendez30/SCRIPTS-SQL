-- 1. Actualizar el estatus del Alumnos de los que est�n en proped�utico a capacitaci�nuse InstitutoTich2UPDATE Alumnos SET idEstatus = (SELECT id from EstatusAlumnos 									where Nombre = 'Prospecto')------------------------------------------------------------------------------------------2. Actualizar el segundo apellido del Alumno a May�sculasUPDATE Alumnos SET segundoApellido = UPPER (Alumnos.segundoApellido)  SELECt * from Alumnos----------------------------------------------------------------------------------------/*3. Actualizar el segundo Apellido para que la primera letra sea may�sculas y el resto
min�sculas*/

UPDATE Alumnos SET segundoApellido = UPPER (LEFT(segundoApellido,1)) +
									 LOWER (substring(segundoApellido,2,len(segundoApellido)))
									 


----------------------------------------------------------------------------------------
/* 4. Actualizar el n�mero telef�nico de los instructores para que los dos primeros
d�gitos sean 55, en caso de que de acuerdo al curp sean del DF
*/

UPDATE Instructores SET telefono = SUBSTRING(curp,12,2) 

from Instructores


SELECt * from Instructores