--1. Realizar la siguiente Consulta con obtenida de la tabla TablaISRLos valores corresponden a las columnas LimInf, LimSup, CuotaFija, ExedLimInf, Subsidio respectivamente

select 
concat('{',LimInf, '', LimSup,'', CuotaFija,'',ExedLimInf,'',Subsidio, '}') as 'TABLA ISR'
from TablaISR	

--------------------------------------------------------------------------------
--2 2. Realizar la siguiente Consulta con obtenida de la tabla TablaISR Los valores corresponden a las columnas LimInf, LimSup, CuotaFija, ExedLimInf, Subsidio respectivamente
select 
concat('{new',' ','ItemISR',' ','{','LimInf=',LimInf, ' ','LimSup=',LimSup,' ','CuotaFija=',CuotaFija,' ','ExedLimInf=',ExedLimInf,' ','Subsidio=',Subsidio, '}') as 'TABLA ISR'
from TablaISR

select * from TablaISR