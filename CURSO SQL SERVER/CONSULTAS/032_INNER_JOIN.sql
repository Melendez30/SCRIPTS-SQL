--1 CONSULTA DE INSTRUCTORES

select * from Instructores

--2 CONSULTA DE CURSOS

select * from Cursos

--3 CONSULTA DE ALUMNOS

select * from Alumnos

--4 consulta de Instructores, en que cursos ha participado

select concat(Ins.nombre,'', primerApellido,'',segundoApellido)
instructor, cuotaHora, CC.nombre, fechaInicio, fechaTermino
from Instructores as Ins
inner join CursosInstructores as CI
on Ins.id = CI.idInstructor
inner join Cursos as C
on C.id = CI.idCurso
inner join CatCursos as CC
on C.idCatCurso = CC.id

--------------------------------------------------------------------------

------------------------------------------------------------------------
--5 Realizar la siguiente consulta de Alumnos, mostrando los cursos ha tomado

select A.nombre, primerApellido, segundoApellido, E.nombre,
CC.nombre, CA.fechaInscripcion, C.fechaInicio, C.fechaTermino, CA.calificacion
from alumnos as A
inner join Estados as E
on A.idEstadoOrigen = E.id
inner join CursosAlumnos as CA
on CA.idCurso = A.id
inner join Cursos as C
on C.id = C.idCatCurso
inner join CatCursos as CC
on CC.id = C.idCatCurso

------------------------------------------------------------------------
--6 Consulta de alumnos: Nombre y apellidos, curso, fecha inicial, fecha final, calificación. Ordenado de la calificación más alta a la más baja

select concat(A.nombre,'', primerApellido,'',segundoApellido),
CC.nombre, C.fechaInicio, C.fechaTermino, CA.calificacion
from alumnos as A
inner join Estados as E
on A.idEstadoOrigen = E.id
inner join CursosAlumnos as CA
on CA.idCurso = A.id
inner join Cursos as C
on C.id = C.idCatCurso
inner join CatCursos as CC
on CC.id = C.idCatCurso
ORDER BY calificacion DESC;


----------------------------------------------------------------------------------------------
--7 Realizar la siguiente consulta de los Cursos con su correspondiente curso de prerrequisito

select CC.Clave, CC.Nombre, CC.Horas, isnull(P.Nombre,'sin prerequisito') as Prerequsito 
from CatCursos AS CC
left join CatCursos AS P
on CC.idPreRequisito = P.id;

----------------------------------------------------------------------------------------------

-- 8. Realizar una consulta con los datos del alumno y curso, dentro de ellos la calificación, obteniendo el nivel alcanzado de acuerdo con lo siguiente 

select  Alumnos.nombre, Alumnos.primerApellido, Alumnos.segundoApellido segundoApellido, CatCursos.Nombre,  CursosAlumnos.fechaBaja, Cursos.fechaTermino, CursosAlumnos.calificacion,
Nivel = case 
when CursosAlumnos.calificacion between 9 and 10 then 'Excelente'
when CursosAlumnos.calificacion between 7 and 8 then 'Bien'
when CursosAlumnos.calificacion = 6 then 'Suficiente'
when CursosAlumnos.calificacion <6 then 'N/A'
end
from Alumnos  
inner join CursosAlumnos 
on Alumnos.id = CursosAlumnos.idAlumno
inner join Cursos 
on Cursos.id = CursosAlumnos.idCurso
inner join CatCursos
on CatCursos.id = Cursos.idCatCurso
------------------------------------------------------------------------------------
select * from CatCursos