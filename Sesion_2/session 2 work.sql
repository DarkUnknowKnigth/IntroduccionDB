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
select round(avg(salario),2) as "Promedio_salario" from puesto;
# contenga pasta
select count(*) as "Numero_de¨_Pasta" from articulo where nombre like '%Pasta%';
# salarios maximo y minimo
select min(salario) as "Salario_minimo", max(salario) as "Salario_maximo" from puesto;
# suma de los ultimos 3 salarios
	# obsevacion cual es mejor?
select sum(salario) as "Suma ultimos 5 salarios" from (select salario from puesto order by id_puesto desc limit 5) as last5Salario;
select sum(salario) as "Suma_last_5" from puesto where id_puesto > ((select max(id_puesto) from puesto ) - 5);

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
select min(precio) from articulo;
select precio from articulo order by precio limit 1;