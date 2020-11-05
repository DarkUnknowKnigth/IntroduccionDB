-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
-- subconsultas reto 1
select concat (nombre ,' ', apellido_paterno,' ', apellido_materno) as nombre
from empleado 
where id_empleado in (
	select id_empleado 
    from puesto 
    where salario < 1000
);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
 select id_empleado, min(total_v) min_ventas, max(total_v) max_ventas 
 from ( 
	select clave, id_empleado, count(*) total_v 
    from venta 
    group by clave, id_empleado
) 
as conters group by id_empleado order by id_empleado;

-- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
select distinct clave, id_articulo 
from venta 
where id_articulo in (
	select id_articulo 
    from articulo 
    where precio > 5000
) order by clave; 

-- joins reto 2
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
select concat(nombre,' ', apellido_materno,' ',apellido_paterno) nombref, id_venta, clave 
from empleado as e 
join venta as v on e.id_empleado = v.id_empleado 
order by nombref;

-- ¿Cuál es el nombre de los artículos que se han vendido?
select nombre,apellido_materno,apellido_paterno, clave, id_venta 
from venta as v 
join articulo as a on v.id_articulo = a.id_articulo 
order by nombre;
		# manera 2
select nombre, clave, id_venta 
from venta join articulo 
using(id_articulo) order by nombre;

-- ¿Cuál es el total de cada venta?
select clave, round (sum(precio), 2) total_venta 
from venta as v 
join articulo as a on v.id_articulo = a.id_articulo 
group by clave order by total_venta desc;

-- vistas reto 3
-- Obtener el puesto de un empleado.
create view report72 as 
(
	select concat(e.nombre,' ', e.apellido_materno, e.apellido_paterno) nombre_completo, p.nombre puesto 
    from empleado e join puesto p using (id_puesto)
);
select * from report72;

-- Saber qué artículos ha vendido cada empleado.
create view report_most_saled_72 as (
	select a.nombre articulo, concat(e.nombre,' ', e.apellido_materno, e.apellido_paterno) nombre_completo, id_venta, clave 
    from articulo a 
    join venta using(id_articulo) 
    join empleado e using (id_empleado)
);
select * from report_most_saled_72;

-- Saber qué puesto ha tenido más ventas.
create view report_most_stonks_72 as (
	select p.nombre articulo, count(*) ventas from venta v 
    join empleado using(id_empleado) 
    join puesto p using(id_puesto) 
    group by articulo
);
select * from report_most_stonks_72;