-- 1. Actualizar el estatus del Alumnos de los que est�n en proped�utico a capacitaci�n
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