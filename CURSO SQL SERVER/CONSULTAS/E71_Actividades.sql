
--1. Realizar una vista vAlumnos que obtenga el siguiente resultado.
CREATE VIEW vAlumnos
AS
SELECT A.id Nombre,
		   A.primerApellido primerApellido,
		   A.segundoApellido segundoApellido,
		   A.correo correo,
		   A.telefono telefono,
		   A.curp curp,
		   E.nombre Estado,
		   EA.Nombre EstatusAlumnos
	FROM Alumnos A,
		 estados e,
		 EstatusAlumnos EA
	WHERE 1 = 1
	AND A.idEstadoOrigen = E.id
	AND A.idEstatus = EA.id

SELECT * FROM vAlumnos

/*2. Realizar el procedimiento almacenado consultarEstados el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Estados.
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/

CREATE PROCEDURE consultarEstados @idEstado INT 
AS
BEGIN
	IF @idEstado = -1
		SELECT *
		FROM Estados;
	ELSE IF @idEstado >= 1
		SELECT * 
		FROM Estados
		WHERE id = @idEstado
END

EXECUTE consultarEstados @idEstado = 19

/*3. Realizar el procedimiento almacenado consultarEstatusAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla estatusAlumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/
CREATE PROCEDURE consultarEstatusAlumnos @idEstatus INT 
AS
BEGIN
	IF @idEstatus = -1
		SELECT *
		FROM EstatusAlumnos
	ELSE IF @idEstatus >= 1
		SELECT * 
		FROM EstatusAlumnos
		WHERE id = @idEstatus
END

EXECUTE consultarEstatusAlumnos @idEstatus = 5

/*4. Realizar el procedimiento almacenado consultarAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/

CREATE PROCEDURE consultarAlumnos @idAlumno INT 
AS
BEGIN
	IF @idAlumno = -1
		SELECT A.id id,
			   A.nombre nombre,
			   A.primerApellido primerApellido,
			   A.segundoApellido segundoApelllido,
			   A.correo correo,
			   A.fechaNacimiento fechaNaci,
			   A.telefono Telefono,
			   A.curp curp,
			   E.nombre Estado,
			   EA.nombre Estatus
		FROM Alumnos A,
			 Estados E,
			 EstatusAlumnos EA
	   WHERE 1 = 1
	   AND A.id = E.id
	   AND A.idEstatus = EA.id
	ELSE IF @idAlumno >= 1
		SELECT A.id id,
			   A.nombre nombre,
			   A.primerApellido primerApellido,
			   A.segundoApellido segundoApelllido,
			   A.correo correo,
			   A.fechaNacimiento fechaNaci,
			   A.telefono telefono,
			   A.curp curp,
			   E.nombre Estado,
			   EA.nombre Estatus
		FROM Alumnos A,
			 Estados E,
			 EstatusAlumnos EA
		WHERE 1 = 1
		AND A.idEstadoOrigen = E.id
	    AND A.idEstatus = EA.id
END

EXECUTE consultarAlumnos @idAlumno = 5

/*5. Realizar el procedimiento almacenado consultarEAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.*/

CREATE PROCEDURE consultarEAlumnos @idAlumno INT 
AS
BEGIN
	IF @idAlumno = -1
		SELECT A.id id,
			   A.nombre nombre,
			   A.primerApellido primerApellido,
			   A.segundoApellido segundoApelllido,
			   A.fechaNacimiento fechaNaci,
			   A.correo correo,
			   A.telefono telefono,
			   A.curp curp,
			   A.idEstadoOrigen idEstadoOrigen,
			   A.idEstatus idEstatus
		FROM Alumnos A
	ELSE IF @idAlumno >= 1
		SELECT A.id id,
			   A.nombre nombre,
			   A.primerApellido primerApellido,
			   A.segundoApellido segundoApelllido,
			   A.fechaNacimiento fechaNaci,
			   A.correo correo,
		       A.telefono telefono,
			   A.curp curp,
			   A.idEstadoOrigen idEstadoOrigen,
			   A.idEstatus idEstatus
		FROM Alumnos A
		WHERE id = @idAlumno
END

EXECUTE consultarEAlumnos @idAlumno = 5

/*6. Realizar el procedimiento almacenado actualizarEstatusAlumnos 
el cual recibirá como parámetros el id del Alumno al cual se le requiere cambiar el estatus y el valor del nuevo estatus.*/
CREATE PROCEDURE actualizarEstatusAlumnos @idAlumno INT,
@idEstatusNuevo INT
AS
BEGIN
	UPDATE Alumnos
	SET idEstatus = @idEstatusNuevo
	WHERE id  = @idAlumno
END;

EXECUTE actualizarEstatusAlumnos @idAlumno = 5,
						  @idEstatusNuevo = 1

/*7. Realizar el procedimiento almacenado agregarAlumnos el cual recibirá como parámetros los valores de cada una de las columnas 
de la tabla de Alumnos con los cuales se insertará el registro a la tabla Alumnos. 
El procedimiento deberá regresar el id con el que se creo el registro en formato de entero.*/

CREATE OR ALTER PROCEDURE agregarAlumnos
@NOMBRE VARCHAR (60),
@primerApellido VARCHAR (50),
@segundoApellido VARCHAR (50),
@correo VARCHAR (80),
@telefono NCHAR(10),
@fechaNacimiento DATE,
@curp char(18),
@sueldo DECIMAL(9,2),
@id_estado INT,
@id_estatus INT

AS
BEGIN
	INSERT INTO Alumnos(nombre,
						 primerApellido,
						 segundoApellido,
						 correo,
						 telefono,
						 fechaNacimiento,
						 curp,
						 sueldoMensual,
						 idEstadoOrigen,
						 idEstatus)
				VALUES (@NOMBRE,
						@primerApellido,
						@segundoApellido,
						@correo,
						@telefono,
						@fechaNacimiento,
						@curp,
						@sueldo,
						@id_estado,
						@id_estatus);

	SELECT MAX(id)
	FROM Alumnos;
END

EXECUTE agregarAlumnos @NOMBRE = 'Asael',
						@primerApellido = 'Espinoza',
						@segundoApellido = 'Hernandez',
						@correo = 'dezzpickH@gmail.com',
						@telefono = '9711240654',
						@fechaNacimiento = '1993-06-12',
						@curp = 'EIHA930612HOCSRS05',
						@sueldo = 15000.00,
						@id_estado = 19,
						@id_estatus = 3

/*8. Realizar el procedimiento almacenado actualizarAlumnos el cual recibirá como parámetros los valores de cada una de las columnas 
de la tabla de Alumnos con los cuales se actualizarán los valores que existen en la tabla Alumnos del registro que corresponda 
al id enviado como parámetro. El procedimiento deberá regresar la cantidad de registros actualizados.*/
CREATE PROCEDURE actualizarAlumnos 
@idAlumno INT,
@NOMBRE VARCHAR (60),
@primerApellido VARCHAR (50),
@segundoApellido VARCHAR (50),
@correo VARCHAR (80),
@telefono NCHAR(10),
@fechaNacimiento DATE,
@curp char(18),
@sueldo DECIMAL(9,2),
@id_estado INT,
@id_estatus INT
AS
BEGIN
	UPDATE Alumnos
	SET nombre =@NOMBRE,
		primerApellido = @primerApellido,
		segundoApellido =@segundoApellido,
		correo = @correo,
		telefono = @telefono,
		fechaNacimiento = @fechaNacimiento,
		curp = @curp,
		sueldoMensual = @sueldo,
		idEstadoOrigen = @id_estado,
		idEstatus = @id_estatus
	WHERE id = @idAlumno;

	SELECT @@ROWCOUNT  

	IF @@ROWCOUNT = 0
		PRINT 'No se actualizo ningun registro'
END

EXECUTE actualizarAlumnos @idAlumno = 31,
						@NOMBRE = 'Julio Cesar',
						@primerApellido = 'Bartolo',
						@segundoApellido = 'Terán',
						@correo = 'bartolo@gmail.com',
						@telefono = '9711052755',
						@fechaNacimiento = '1994-02-28',
						@curp = 'BATJ940228HOCRRL07',
						@sueldo = 17000.00,
						@id_estado = 1,
						@id_estatus = 4

/*9. Realizar el procedimiento almacenado eliminarAlumnos el cual recibirá como parámetros el valor del id del registro del alumno
del que se requiere eliminar.
Primeramente se deberán eliminar todos los registros de la Tabla de CursosAlumnos los cuales tengan el id del alumno a eliminar 
y posteriormente el eliminar al alumno de la Tabla de Alumnos.
Esto deberá considerarse como una transacción ya que se trate de actualizar dos tablas relacionadas.
En caso de que no se haya eliminado el registro de la tabla de Alumnos deberá levantar una excepción.*/

CREATE OR ALTER PROCEDURE eliminarAlumnos @idAlumno INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM CursosAlumnos WHERE idAlumno = @idAlumno;

			DELETE FROM Alumnos WHERE id = @idAlumno;
		COMMIT TRANSACTION
		PRINT 'La Transaccion fue Exitosa';
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		Throw;
		PRINT 'La Transaccion No se puedo realizar';
	END CATCH
END

EXECUTE eliminarAlumnos @idAlumno= 1;

SELECT * FROM CursosAlumnos
SELECT * FROM alumnos

/*10. Crear el trigger Trigger_EliminarAlumnos el cual se debe ejecutar cuando se elimina un registro de la tabla de Alumnos. 
Este trigger deberá insertar un registro en la Tabla AlumnosBaja del alumno eliminado.*/

 CREATE TRIGGER Trigger_EliminarAlumnos
ON Alumnos
AFTER DELETE
AS
BEGIN
	INSERT INTO alumnosBaja (nombre,
							 primerApellido,
							 segundoApellido,
							 fechaBaja)
	SELECT d.nombre,
		   d.primerApellido,
		   d.segundoApellido,
		   GETDATE()
	FROM deleted d;
END
GO

DELETE FROM alumnos WHERE id = 1;

select * from alumnosBaja

--11. Obtener un respaldo de su base de datos InstitutoTich

BACKUP DATABASE instituto_tich
  TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\instituto_tich.bak',  
  DISK = N'C:\Users\Tichs\Documents\curso_SQL_Server\instituto_tich.bak' 
  WITH NOFORMAT, NOINIT,  NAME = N'SQLShackDemo-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  
  STATS = 10
  GO

  USE InstitutoTich2;
GO
BACKUP DATABASE instituto_tich
TO DISK = 'C:\Users\Tichs\Documents\instituto_tich.bak'
   WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of instituto_tich';
GO

/*13. Sobre la base de datos PruebasTich crear el store Procedure spEliminaAlumnosCurso el cual deberá eliminar los alumnos 
que se encuentren en un determinado curso por lo que recibirá como parámetro el nombre del curso.*/
use PruebasTich;

CREATE PROCEDURE spEliminaAlumnosCurso @nombreCurso VARCHAR (50)
AS
BEGIN
	/*DELETE FROM cursoAlumnos
	WHERE id_curso IN (SELECT c.id_curso
					  FROM cursos c,
							cat_cursos cat
					   WHERE cat.id_catCurso = c.id_catCurso
					   AND cat.nombre_catCurso = 'Bases de datos SQL Server');*/

	DELETE FROM Alumnos
	WHERE id IN (SELECT a.id
						FROM Alumnos A,
							CursosAlumnos CA,
							Cursos C,
							CatCursos CAT
						WHERE 1 =1
						AND CAT.id = C.idCatCurso
						AND c.id = ca.idCurso
						AND CA.idAlumno = a.id
						AND CAT.Nombre = @nombreCurso)
END;


EXECUTE spEliminaAlumnosCurso @nombreCurso = 'Bases de datos SQL Server';
