/*TEMA: SQL SERVER
SUBTEMA: FUNCIONES ESCALARES*/

--1. Crear una función Suma que reciba dos números enteros y regrese la suma de ambos números

create or alter function dbo.SUMA 
(
@NUM1 INT, @NUM2 INT
)
  returns INT 
  AS
  begin
  DECLARE @RESULTADO INT
  SET @RESULTADO = (@NUM1 + @NUM2)
   return @RESULTADO
  end;

	SELECT dbo.SUMA(5, 2);

----------------------------------------------------------------------------------------
/*2. Crear la función GetGenero la cual reciba como parámetros el curp y regrese el género al que pertenece*/

create or alter FUNCTION dbo.GetGenero 
(
@curp CHAR (18)
)
RETURNS CHAR (18)
AS 
BEGIN 
DECLARE @GENERO CHAR (18), @SEXO CHAR (18)
SET @SEXO = SUBSTRING (@curp ,11,1);
IF @SEXO = 'M' SET @GENERO = 'MUJER'
IF @SEXO = 'H' SET @GENERO = 'HOMBRE'
RETURN  @GENERO 
END
;

SELECT dbo.GetGenero ('MADA971212HVZRMN04') AS SEXO

/*3. Crear la función GetFechaNacimiento la cual reciba como parámetros el curp 
y regrese la fecha de nacimiento. La fecha de nacimiento deberá completarse a 4 dígitos, 
debiéndose determinar si es año dos mil o año mil novecientos*/

CREATE or alter FUNCTION dbo.GetFechaNacimiento
   (
   @curp CHAR(18)
   )
	RETURNS  DATE
   AS
   BEGIN 
   DECLARE @FECHA DATE, @JEFA DATE
    SET @FECHA = SUBSTRING (@curp ,5,6)
	SET @JEFA = CONVERT(DATE, @FECHA);
      RETURN @JEFA
   END
;
SELECT dbo.GetFechaNacimiento ('MADA971212HVZRMN04') AS NACIMIENTO

--4. Crear la función GetidEstado la cual reciba como parámetros el curp y regrese el Id Estado con base en la siguiente tabla

CREATE Or ALTER FUNCTION getEstado
(
@curp char(18)
) 
returns varchar(20)
as
begin
  declare @getEstado char, @Estado varchar(20)
  set @Estado = case SUBSTRING(@curp,12,2)
  when 'AS' THEN 'Aguas Calientes'
  when 'BC' THEN 'Baja California'
  when 'BS' THEN 'Baja California Sur'
  when 'CC' THEN 'Campeche'
  when 'CH' THEN 'Chihuahua'
  when 'CS' THEN 'Chiapas'
  when 'CL' THEN 'Coahuila'
  when 'CM' THEN 'Colima'
  when 'DG' THEN 'DURANGO'
  WHEN 'GT' THEN 'Guanajuato'
  when 'GR' THEN 'Guerrero'
  when 'HG' THEN 'Hidalgo'
  WHEN 'JC' THEN 'Jalisco'
  when 'MC' THEN 'YA TE LA SABANAS'
  WHEN 'MN' THEN 'MICHOACAN'
  WHEN 'MS' THEN 'MORELOS'
  WHEN 'NT' THEN 'Nayarit, Tepic'
  when 'NL' THEN 'Nuevo Leon'
  when 'OC' THEN 'OAXACA'
  WHEN 'PL' THEN 'Puebla'
  WHEN 'QT' THEN 'Queretaro'
  when 'QR' THEN 'Quintana Roo'
  when 'SP' THEN 'San Luis Potosi'
  when 'SL' THEN 'Sinaloa'
  when 'SR' THEN 'Sonora'
  when 'TC' then 'Tabasco'
  when 'TS' THEN 'Tamaulipas'
  when 'TL' THEN 'Tlaxcala'
  when 'VZ' THEN 'Veracruz'
  when 'YN' THEN 'Yucatan'
  when 'ZS' THEN 'NO SE BAÑA QUIEN LO LEA'
  ELSE 'nO TIENE'
  end
  return @Estado
end

select dbo.getEstado(alumnos.curp) AS ESTADO from Alumnos  

/*5. Realizar una función llamada Calculadora que reciba como parámetros 
--dos enteros y un operador (+,-,*,/,%) regresando el resultado de la operación se deberá cuidar de no hacer división entre cero*/
   --- SOLO SE USA PARA CREAR LA FUNCION UNA VEZ
CREATE or ALTER FUNCTION dbo.Calculadora
   (
   @NUM1 INT,
   @NUM2 INT,
   @OPERANDO VARCHAR(5)
   )
	RETURNS  DECIMAL(9,2)
   AS
   BEGIN 

   DECLARE @RESULTADO DECIMAL(9,2)
   SET @RESULTADO = (CASE @OPERANDO
   WHEN '+' THEN (@NUM1 + @NUM2)
   WHEN '-' THEN (@NUM1 - @NUM2)
   WHEN '*' THEN (@NUM1 * @NUM2)
   WHEN '%' THEN @NUM1%NULLIF(@NUM2,0)
   WHEN '/' THEN CONVERT(FLOAT, @NUM1)/NULLIF(@NUM2,0)
END)
RETURN @RESULTADO
END;

SELECT dbo.Calculadora(50,0,'%')


/*6. Realizar una función llamada GetHonorarios que calcule el importe a pagar 
a un determinado instructor y curso, por lo que la función recibirá como parámetro 
el id del instructor y el id del curso.*/
CREATE or ALTER FUNCTION GetHonorarios
(
@id INT, @idCurso INT) RETURNS NUMERIC(9,2)
AS
BEGIN
	DECLARE @importe NUMERIC(9,2);
	SELECT @importe = (Instructores.cuotaHora * catCursos.Horas) FROM Instructores
		INNER JOIN CursosInstructores 
			ON CursosInstructores.idInstructor=Instructores.id
		INNER JOIN Cursos 
			ON CursosInstructores.idCurso=Cursos.id
		INNER JOIN catCursos 
			ON catCursos.id=Cursos.idCatCurso
WHERE CursosInstructores.id = @idInstructor;
RETURN @importe
END
GO

SELECT dbo.GetHonorarios(3, 3);

--7. CUOTAS POR HORA Y HORAS-----
select * from CursosInstructores;
SELECT instructores.cuotaHora, catCursos.horas FROM instructores
INNER JOIN CursosInstructores ON CursosInstructores.idInstructor=Instructores.id
INNER JOIN Cursos ON CursosInstructores.idCurso=Cursos.id
INNER JOIN catCursos ON catCursos.id=Cursos.idCatCurso;

----------------------------------------------------------------------------
/*7. Crear la función GetEdad la cual reciba como parámetros la fecha de nacimiento 
y la fecha a la que se requiere realizar el cálculo de la edad. Los años deberán se cumplidos, considerando mes y día*/

create or ALTER FUNCTION dbo.GetEdad
(
@FECHANACIMIENTO DATE, @FECHACALCULAR DATE  
 )
 RETURNS INT  
AS 
BEGIN
	DECLARE @EDAD INT 
	
	SET @EDAD = DATEDIFF (year, 
				IIF		 ((MONTH (@FECHANACIMIENTO) > MONTH (@FECHACALCULAR))
					OR   (DAY (@FECHANACIMIENTO) > DAY (@FECHACALCULAR)),  
						  DATEADD(YEAR,1,@FECHANACIMIENTO),@FECHANACIMIENTO), @FECHACALCULAR)
	
RETURN @EDAD
END
;

SELECT dbo.GetEdad ('1996-08-30', '2022-01-14') AS EDAD


--8. Crear la función Factorial la cual reciba como parámetros un número entero y regrese como resultado el factorial.


CREATE or alter FUNCTION dbo.factorial
( 
@numero int
)
RETURNS INT
AS
BEGIN
DECLARE @i  int

    IF @numero <= 1
        SET @i = 1
    ELSE
        SET @i = @numero * dbo.factorial( @numero - 1 )
RETURN (@i)
END

SELECT dbo.factorial (7) 


/*9. Crear la función ReembolsoQuincenal la cual reciba como parámetros un SueldoMensual y regrese
como resultado el Importe de Reembolso quincenal, considerando que el importe total 
a reembolsar es igual a dos meses y medio de sueldo, y el periodo de reembolso es de 6 meses*/

CREATE FUNCTION dbo.ReembolsoQuincenal
(
@sueldomensual DECIMAL (9,2)
)
RETURNS DECIMAL (9,2)
AS
BEGIN 
RETURN (@sueldomensual * 2.5) /12 
END
;

SELECT dbo.ReembolsoQuincenal (50000)

/*10. Realizar una función que calcule el impuesto que debe pagar un instructor para un determinado curso. 
De tal manera que la función recibirá id de un instructor y el id del curso correspondiente.
El cálculo del impuesto se realiza de la siguiente forma:

Determinar el porcentaje que aplicará dependiendo del estado de nacimiento
Chiapas = 5 %
Sonora = 10 %
Veracruz = 7 %
El resto del país 8 %
El impuesto se obtendrá aplicando el porcentaje al total de la cuota por hora por la cantidad de horas del curso
El Estado de Origen se obtendrá de la posición 12 y 13 del curp de acuerdo con la siguiente tabla*/


CREATE or ALTER FUNCTION dbo.Impuesto
(
@instructor int , @curso int 
) 
RETURNS DECIMAL 
AS
BEGIN 
DECLARE @SUELDO NUMERIC(9) ,@ESTADO CHAR (2) ,@IMPUESTO NUMERIC  ;
SELECT @SUELDO = (instructores.cuotaHora * catCursos.horas) FROM instructores
					INNER JOIN CursosInstructores ON CursosInstructores.idInstructor=Instructores.id
					INNER JOIN Cursos ON CursosInstructores.idCurso=Cursos.id
					INNER JOIN catCursos ON catCursos.id = Cursos.idCatCurso
WHERE CursosInstructores.id = @instructor;
set @IMPUESTO = case SUBSTRING((SELECT  curp from Instructores where id = @instructor) , 12,2)
		when 'CS' THEN  @SUELDO -(@SUELDO * 0.05)
		when 'SR' THEN @SUELDO -(@SUELDO * 0.10)
		when 'VZ' THEN @SUELDO -(@SUELDO * 0.07)
ELSE @SUELDO -(@SUELDO * 0.08) end 
RETURN @IMPUESTO
END

SELECT dbo.Impuesto (3,3) AS SUELDO

 select * from instructores

 /*11. Haciendo uso de la función GetEdad, obtener una relación de alumnos 
 con la edad a la fecha de inscripción, y la edad actual. De aquellos alumnos 
 que actualmente tengan más de 25 años.*/

 SELECT Alumnos.*, dbo.GetEdad(Alumnos.fechaNacimiento, CursosAlumnos.fechaInscripcion) AS edadCuandoSeInscribieron,
 dbo.GetEdad(Alumnos.fechaNacimiento, CURRENT_TIMESTAMP) AS edadActual 
 FROM Alumnos INNER JOIN CursosAlumnos 
 ON CursosAlumnos.idAlumno = Alumnos.id
 WHERE dbo.GetEdad(Alumnos.fechaNacimiento, CURRENT_TIMESTAMP)>25;

 SELECT * FROM CursosAlumnos


 /*12. Realizar una función que determine el porcentaje a descontar en los reembolsos, con base a la cantidad de meses 
 en que se realizará el reembolso y el sueldo mensual logrado, de acuerdo al siguiente procedimiento:*/

CREATE OR ALTER FUNCTION PorcentajeDescuento(
@sueldo FLOAT, @mes INT
)
 RETURNS VARCHAR(8)
 AS
 BEGIN
	DECLARE @porcentaje VARCHAR(8);
	IF @mes = 1
	SET @porcentaje = CONVERT(VARCHAR, @sueldo/1000) + '%'
	IF @mes = 2
	SET @porcentaje = CONVERT(VARCHAR, (@sueldo/1000)/2) + '%'
	IF @mes = 3
	SET @porcentaje = CONVERT(VARCHAR, (@sueldo/1000)/4) + '%'
	IF @mes = 4
	SET @porcentaje = CONVERT(VARCHAR, (@sueldo/1000)/8) + '%'
	IF @mes = 5
	SET @porcentaje = CONVERT(VARCHAR, (@sueldo/1000)/16) + '%'
	IF @mes = 6
	SET @porcentaje = '0%'
RETURN @porcentaje
END

SELECT dbo.PorcentajeDescuento(40000, 6);

 --a. El porcentaje de descuento será en función de la cantidad de mensualidades en que se realizará el reembolso.

 --b. La cantidad máximo de meses para realizar el reembolso es de 6 meses

 /*c. El porcentaje máximo de descuento a otorgar será el que resulte el sueldo mensual entre 1,000
i. Ejemplo : Si el sueldo mensual es de 20,000 pesos el descuento será del 20 %*/

/*d. El porcentaje máximo de descuento será otorgado si el reembolso total se realiza cuando 
le corresponde efectuar la primera parcialidad de dicho reembolso*/

/*e. Los porcentaje de descuento a otorgar disminuirá inversamente proporcional a la cantidad de meses en que se cubrirá totalmente 
el reembolso, de tal forma que si el reembolso se cubre en la mitad del periodo máximo (3 meses = 6 meses /2), el porcentaje 
a descontar será la mitad del porcentaje máximo ( en el ejemplo 10% = 20% / 2), y si el reembolso se realiza en el máximo del plazo, 
el descuento a otorgar será cero.*/




--13. Hacer una función que convierta a mayúsculas la primera letra de cada palabra de un cadena de caracteres recibida.

CREATE FUNCTION dbo.MAYUSCULAS
(
@CADENA VARCHAR (255)
)
RETURNS VARCHAR(255)
 AS
 BEGIN
	DECLARE @INITCAP VARCHAR(255)
	SET @INITCAP = UPPER(LEFT(@CADENA, 1)) + LOWER(SUBSTRING (@CADENA , 2, LEN(@CADENA)))
 RETURN @INITCAP
 END

 PRINT dbo.MAYUSCULAS('Melendez')

 
SELECT dbo.MAYUSCULAS('hernandeZ')
