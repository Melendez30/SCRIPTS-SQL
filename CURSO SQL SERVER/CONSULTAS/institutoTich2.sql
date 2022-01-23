-- 1. Actualizar el estatus del Alumnos de los que están en propedéutico a capacitaciónuse InstitutoTich2UPDATE Alumnos SET idEstatus = (SELECT id from EstatusAlumnos 									where Nombre = 'Prospecto')------------------------------------------------------------------------------------------2. Actualizar el segundo apellido del Alumno a MayúsculasUPDATE Alumnos SET segundoApellido = UPPER (Alumnos.segundoApellido)  SELECt * from Alumnos----------------------------------------------------------------------------------------/*3. Actualizar el segundo Apellido para que la primera letra sea mayúsculas y el resto
minúsculas*/

UPDATE Alumnos SET segundoApellido = UPPER (LEFT(segundoApellido,1)) +
									 LOWER (substring(segundoApellido,2,len(segundoApellido)))
									 


----------------------------------------------------------------------------------------
/* 4. Actualizar el número telefónico de los instructores para que los dos primeros
dígitos sean 55, en caso de que de acuerdo al curp sean del DF
*/

UPDATE Instructores SET telefono = SUBSTRING(curp,12,2) 

from Instructores


SELECt * from Instructores