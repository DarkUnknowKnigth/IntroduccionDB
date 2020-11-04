# reto 1
use tienda;
# 1 ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select nombre, apellido_paterno, apellido_materno from empleado where id_empleado in (select id_empleado from puesto where salario < 1000);
# 2 ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
select empleado.id_empleado, nombre,min_ventas, max_ventas from empleado 
	join ( select id_empleado, min(total_v) min_ventas,max(total_v) max_ventas from 
		( select clave, id_empleado, count(*) total_v from venta group by clave, id_empleado) as Ventas group by id_empleado) as total_mm 
	on total_mm.id_empleado = empleado.id_empleado order by max_ventas desc;
# 3 ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
select clave, id_articulo from venta where id_articulo in (select id_articulo from articulo where precio > 5000) order by clave; 

# reto 2
# 1 ¿Cuál es el nombre de los empleados que realizaron cada venta?
select nombre, apellido_paterno, apellido_materno, clave, id_venta from venta join empleado on empleado.id_empleado = venta.id_empleado;
# 2 ¿Cuál es el nombre de los artículos que se han vendido?
select nombre, clave, id_venta from venta join articulo on venta.id_articulo = articulo.id_articulo order by nombre;
# 3 ¿Cuál es el total de cada venta?
select clave, round (sum(precio), 2) total_venta from venta join articulo on venta.id_articulo = articulo.id_articulo group by clave order by total_venta desc;

#reto 3
# 1 Obtener el puesto de un empleado.
# create view puesto_empleados as 
select puesto.nombre, empleado.nombre, apellido_paterno, apellido_materno from empleado join puesto on empleado.id_puesto = puesto.id_puesto;
# 2 Saber qué artículos ha vendido cada empleado.
# create view empleado_articuol as 
select empleado.nombre, apellido_paterno, apellido_materno, articulo.nombre articulo, id_venta, clave from venta join articulo on venta.id_articulo = articulo.id_articulo join empleado on venta.id_empleado = empleado.id_empleado order by articulo;
# 3 Saber qué puesto ha tenido más ventas.
# create view puesto_mayor_venta as
select puesto.nombre, count(*) ventas from venta join empleado on venta.id_empleado = empleado.id_empleado join puesto on puesto.id_puesto = empleado.id_puesto group by puesto.nombre;
select * from puesto_mayor_venta order by ventas desc limit 1;
SHOW KEYS FROM venta;