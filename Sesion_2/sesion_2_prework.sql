# Jose Daniel Morales Ocampo - dany.0525.jmo@gmail.com
use tienda;
# calcular totales
select sum(precio) as "Precio Total" from articulo where precio > 5000;
# conteos
select count(*) as "Total de Articulos" from articulo;
# saber cual es el mayor 
select nombre, precio from articulo order by precio desc limit 1;
select max(precio) as "Mas Caro" from articulo;
# saber cual es el menor
select nombre, precio from articulo order by precio asc limit 1;
select min(precio) as "Mas Caro" from articulo;
# promedio
select avg(precio) "promedio" from articulo;
# buscar la inicial
select mid(nombre,1,1) as "Inicial", nombre as "mid" from articulo;
# agrupar y join
select venta.id_articulo, count(*) as "ventas", nombre from venta inner join articulo
on venta.id_articulo = articulo.id_articulo
group by venta.id_articulo order by ventas desc limit 5;
# subconsulta
select nombre, total from articulo inner join (select count(*) as "total", id_articulo from venta group by id_articulo) as ventas on ventas.id_articulo = articulo.id_articulo order by total desc limit 10;