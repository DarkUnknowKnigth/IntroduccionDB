# Jose Daniel Morales Ocampo - dany.0525.jmo@gmail.com
# reto 1
use tienda;
desc articulo;
# incluyan pasta
select * from articulo where nombre like '%Pasta%';
# incluyasn cannelloni
select * from articulo where nombre like '%Cannelloni%';
# tengan separador -
select * from articulo where nombre like '%-%';
# incluya la palabra Designer
select * from puesto where nombre like "%Designer%";
# puestos incluya developer
select * from puesto where nombre like "%Developer%";

#reto 2
desc puesto;
# salario promedio
select avg(salario) from puesto;
# contenga pasta
select count(*) from articulo where nombre like '%Pasta%';
# salarios maximo y minimo
select min(salario) as "Salario minimo", max(salario) as "Salario maximo" from puesto;
# suma de los ultimos 3 salarios
	# obsevacion en el ejemplo toma en cuenta 6
select sum(salario) as "Suma ultimos 5 salarios" from (select salario from puesto order by id_puesto desc limit 5) as last5Salario;

#reto 3
# repeticiones de puesto
select nombre, count(*) as "Repeticiones" from puesto group by nombre;
# suma de salarios por puesto
select nombre, sum(salario) as "Total de pagos" from puesto group by nombre;
desc venta;
# total de ventas por empleado (id)
select id_empleado, count(clave) "Total Ventas" from venta group by id_empleado;
# total de articulos por venta
select id_articulo, count(*) "Total Articulos" from venta group by id_articulo;