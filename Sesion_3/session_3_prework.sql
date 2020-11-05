use tienda;
-- subconsultas
#where in
select * from empleado where id_puesto in (select id_puesto from puesto where nombre = 'Junior Executive');

# from
# saber cual es la menor y mayor cantidad de ventas de un articulo
# las claves de la venta se repiten
select * from venta;
# contar articulos y ventas
select clave, id_articulo, count(*) cantidad 
from venta 
group by clave, id_articulo 
order by cantidad desc;
# hacer conteo de maximos y minimos
select id_articulo, min(cantidad) min_c, max(cantidad) max_c 
from (
select clave, id_articulo, count(*) cantidad 
from venta 
group by clave, id_articulo 
order by cantidad desc
) as counters
group by id_articulo order by max_c desc;
-- ver llaves
show keys from venta;
-- joins
# inner join
select * from empleado;
select * from puesto;
select * from puesto as p join empleado as e on e.id_puesto = p.id_puesto;
# left outer join
select * from puesto as p left join empleado as e on e.id_puesto = p.id_puesto;
# right outer join
select * from puesto as p right join empleado as e on e.id_puesto = p.id_puesto;

-- vistas 
-- create view as
create view tickets072 as ( 
	select clave, fecha, articulo.nombre articulo, articulo.precio, concat(empleado.nombre, ' ', empleado.apellido_paterno) empleado from venta join empleado using(id_empleado) join articulo using (id_articulo)
);
select clave,round(sum(precio),2) from tickets072 group by clave;
