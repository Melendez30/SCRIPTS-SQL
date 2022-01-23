/*1. Crear un store procedureCodigoAscii que imprima los caracteres con su respectivo 
código ascii en decimal. Solo para los caracteres cuyo código sea mayor a 32*/


create or alter procedure dbo.procedureCodigoAscii 
AS 
BEGIN 
DECLARE @A INT,
	    @Mensaje NVARCHAR(50),
		@ASCII CHAR(2),
		@CARACTERES INT;
	SET @A = 32;
	WHILE @A <=255
	BEGIN 
	SET @ASCII = CHAR(@A);
	SET @CARACTERES = ASCII(@ASCII);
	SET @Mensaje = @ASCII +
	N'  ' +
	N'ASCII =>' +
	N' ';
	PRINT @Mensaje +  CAST (@CARACTERES AS nvarchar(10));
	set @A = @A + 1;
  END;
END
;
EXECUTE procedureCodigoAscii;


/*2. Crear el store procedure Factorial que reciba como parámetro un número entero y
que devuelve el factorial calculado en un parámetro de salida */


CREATE or alter PROCEDURE FactorialNum @NUM INT,
@FACTOR INT OUT 
AS

BEGIN 
	DECLARE @i INT = 1;
	SET @FACTOR = 1
	WHILE @i <= @NUM
	BEGIN 
		IF @NUM <= 1
			PRINT @FACTOR;
		ELSE 
			   SET @FACTOR = @FACTOR * @i;
			   SET @i += 1;
		END;
			PRINT @FACTOR;
        END;

		DECLARE @RESULT INT;

		EXECUTE FactorialNum
							@NUM = 6,
							@FACTOR = @RESULT;

--------------------------------------------------------------------------------------------------

--3. . Crear las siguientes Tablas


CREATE TABLE Saldos(
id INT  IDENTITY(1,1) NOT NULL PRIMARY KEY,
Nombre VARCHAR (50),
saldo DECIMAL(9,2)
);

CREATE TABLE Transacciones (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
idOrigen INT NOT NULL FOREIGN KEY REFERENCES saldos (id),
idDestino INT NOT NULL FOREIGN KEY REFERENCES saldos(id),
monto DECIMAL(9,2) NOT NULL
);

SET IDENTITY_INSERT [dbo].Saldos ON 
INSERT INTO saldos (id, Nombre, saldo) VALUES (1, 'Ivan Melendez', 50000.50);

INSERT INTO saldos (id, Nombre, saldo) VALUES (2, 'Giovani Perez Ibarra', 84000.50);

SET IDENTITY_INSERT [dbo].Saldos OFF

SELECT * FROM Saldos;


/* 4. Crear un store procedure “Transacciones” que recibirá como parámetros el id de la
cuenta de origen, el id de la cuenta destino y el monto de la transacción. Se
deberá crear dentro de una transacción a fin de que los saldos de las cuentas
involucradas y la tabla de transacciones quede perfectamente consistente.*/

USE InstitutoTich2

CREATE OR ALTER PROCEDURE Transactions @idOrigen INT,
@idDestino INT,
@Monto DECIMAL(9,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		 UPDATE saldos
			SET saldo = saldo - @Monto
			WHERE id = @idOrigen;
		 UPDATE Saldos
			SET saldo = saldo + @Monto
			WHERE id = @idDestino;
			INSERT INTO Transacciones VALUES (@idOrigen, @idDestino, @Monto);			
			COMMIT TRANSACTION
		PRINT 'Transaccion Exitosa';
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		PRINT 'Transaccion Incorrecta';
	END CATCH
END;


EXECUTE dbo.Transactions 
					@idOrigen = 2,
					@idDestino = 1,
					@monto = 300000.00;

SELECT * FROM Saldos
SELECT * FROM Transacciones;
DELETE FROM Transacciones

USE InstitutoTich2;

ALTER TABLE saldos
add CONSTRAINT CK_saldoPositivo
check (saldo >=0);

alter table libros
 add constraint CK_libros_precio_positivo
 check (preciomin>=0 and preciomay>=0);

   