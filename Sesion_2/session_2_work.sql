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
# suma de los ultimos 5 salarios
	# obsevacion cual es mejor?
select sum(salario) as "Suma ultimos 5 salarios" from (select salario from puesto order by id_puesto desc limit 5) as last5Salario;
select sum(salario) as "Suma_last_5" from puesto where id_puesto > ((select max(id_puesto) from puesto ) - 5);

#reto 3
# repeticiones de puesto
select nombre, count(*) as "Repeticiones" from puesto group by nombre order by Repeticiones desc;
# suma de salarios por puesto
select nombre, sum(salario) as "Total_de_pagos" from puesto group by nombre order by Total_de_pagos desc ;
desc venta;
# total de ventas por empleado (id)
select id_empleado, count(id_venta) "Total_Ventas" from venta group by id_empleado order by Total_Ventas desc;
# total de articulos por venta
select id_articulo, count(*) "Total_Articulos" from venta group by id_articulo order by Total_Articulos desc;

# Desafios Plus ++ en 10 min
# los puestos mas ocupados 
select nombre, count(*) as repeticiones from puesto group by nombre order by repeticiones desc;
# los puestos peor pagados
select nombre, avg(salario) as salario_promedio from puesto group by nombre order by salario_promedio asc;
# 10 mejores vendedores
select nombre, id as id_empleado, ventas from empleado inner join (select id_empleado as id, count(id_empleado) as ventas from venta group by id order by ventas desc limit 10) as X on id = id_empleado;
# 20 articulos peor vendidos
select nombre, ventas from articulo inner join (select id_articulo as id, count(id_articulo) as ventas from venta group by id order by ventas desc limit 10) as X on id = id_articulo;

