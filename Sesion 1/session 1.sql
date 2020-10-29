# Jose Daniel Morales Ocampo - dany.0525.jmo@gmail.com
show databases;
use tienda;
show tables;
#reto 1
#investigar los tipos de datos
desc articulo;
desc empleado;
desc puesto;
desc venta;
select * from articulo;
select * from empleado limit 3;

#reto 2 
# nombre puesto 4
select nombre from empleado where id_puesto = 4; 
# salario mayor  de 10,000
select nombre from puesto where salario > 10000;
# articulos con precio mayor a 1000 y iva mayor a 100
select * from articulo where precio > 1000 and iva > 100;
# ventas con los articulos con id 135, 963 y el id de empleado sea 835,369
select * from venta where id_articulo in (135,963) and  id_empleado in (835, 369);

#reto 3
# top 5 de salarios mayores de puestos
select * from puesto order by salario desc limit 5;

#clase querys
select * from empleado;
select nombre, apellido_paterno from empleado;
select * from empleado where apellido_paterno = 'Risom';
select * from empleado where id_empleado = 10;
select * from empleado where id_puesto > 100;
select * from empleado where id_puesto >= 100 and id_puesto <= 200;
select * from empleado where id_puesto = 100 or id_puesto = 200;
select * from empleado where id_puesto in (100,200,300);


