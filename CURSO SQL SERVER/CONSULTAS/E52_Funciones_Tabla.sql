/*1. Hacer una función valuada en tabla que obtenga la tabla de amortización de los Reembolsos quincenales que un participante
tiene que realizar en 6 meses*/

CREATE OR ALTER FUNCTION AmortizacionAlum(@idAlumno INT)
RETURNS @ResultTable TABLE 
(Quincena INT, 
 SaldoAnterior DECIMAL(9,2),
 Pago DECIMAL(9,2),
 SaldoNuevo DECIMAL(9,2)
 )AS

BEGIN
	DECLARE @Quincena INT,
			@SaldoAnterior DECIMAL(9,2),
			@SaldoNuevo DECIMAL(9,2),
			--@SaldoAlumno DECIMAL(9,2),
			@Pago DECIMAL(9,2);

	SET @Quincena = 1;
	SET @SaldoAnterior = (SELECT (a.sueldoMensual * 2.5)
						  FROM Alumnos a
						  WHERE a.id =@idAlumno);
	SET @SaldoNuevo = (SELECT @SaldoAnterior - dbo.ReembolsoQuincenal(a.sueldoMensual)
					   FROM Alumnos a
					   WHERE a.id =@idAlumno);
	SET @Pago = (SELECT dbo.ReembolsoQuincenal(a.sueldoMensual)
				 FROM Alumnos a
				 WHERE a.id = @idAlumno);

	WHILE @Quincena <= 12
	BEGIN
		INSERT  @ResultTable
			SELECT @Quincena,
				   @SaldoAnterior,
				   @Pago,
				   @SaldoNuevo;
			  
		SET @Quincena = @Quincena +1 ;
		SET @SaldoAnterior = @SaldoNuevo;
		SET @SaldoNuevo = @SaldoAnterior - @Pago;
	END;--WHILE;
	RETURN
END;

SELECT *
FROM dbo.AmortizacionAlum(1) ;

/*2. Hacer una función valuada en tabla que obtenga la tabla de amortización de los préstamos posibles que se le pueden hacer a un instructor.
La función recibirá como parámetro el id del instructor
El importe del préstamo será 200 veces la cuota por hora
El porcentaje de interés será el 24% anual cuando la cuota por hora sea superior a 200
Para el resto será de 18%
El pago mensual será el equivalente a 25 horas*/

CREATE OR ALTER FUNCTION AmortizacionInst
(@idInstructor INT)
RETURNS @amInstructores TABLE 
(Quincena INT, 
 SaldoAnterior DECIMAL(9,2),
 Pago DECIMAL(9,2),
 SaldoNuevo DECIMAL(9,2)
 )AS

 BEGIN
	DECLARE @Meses INT,
			@SaldoAnterior DECIMAL(9,2),
			@SaldoNuevo DECIMAL(9,2),
			@Pago DECIMAL(9,2),
			@Cuota DECIMAL(9,2);

			SET @Meses = 1;
			SET @Cuota =(SELECT i.cuotaHora
						 FROM Instructores i
						 WHERE i.id = @idInstructor);
			SET @SaldoAnterior = (SELECT (i.cuotaHora * 200)
								  FROM Instructores i
								  WHERE i.id =@idInstructor);
			SET @Pago = (SELECT (i.cuotaHora * 25)
								  FROM instructores i
								  WHERE i.id =@idInstructor);
			IF @Cuota > 200
				SET @SaldoAnterior = @SaldoAnterior + (@SaldoAnterior *0.24);
			ELSE 
				SET @SaldoAnterior = @SaldoAnterior + (@SaldoAnterior *0.18);
			SET @SaldoNuevo = @SaldoAnterior - @Pago;

			WHILE @Meses <=12
			BEGIN
				INSERT @amInstructores
					SELECT @Meses,
						   @SaldoAnterior,
						   @Pago,
						   @SaldoNuevo;

					SET @Meses = @Meses +1;
					SET @SaldoAnterior = @SaldoNuevo;
					SET @SaldoNuevo = @SaldoAnterior - @Pago;
			END--WHILE
		RETURN
 END;

 SELECT *
 FROM dbo.AmortizacionInst(2);

 