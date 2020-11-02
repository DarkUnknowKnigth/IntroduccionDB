use classicmodels;
show tables;
desc employees;
desc products;
desc orderdetails;
desc orders;
desc offices;
desc payments;
# 1 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
select employeeNumber, lastName, firstName from employees where firstName like 'a%';
# 2 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
select employeeNumber, lastName, firstName from employees where firstName like '%on';
# 3 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
select employeeNumber, lastName, firstName from employees where firstName like '%on%';
# 4 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
select employeeNumber, lastName, firstName from employees where firstName like 'T_m' and length(firstName) = 3;
# 5 Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
select employeeNumber, lastName, firstName from employees where firstName not like 'b%';
# 6 Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
select productCode, productName from products where productCode like '%\_20%';
# 7 Dentro de la tabla orderdetails, obten el total de cada orden.
select * from orderdetails;
select orderNumber, sum(realPrice) Total from (select orderNumber, (priceEach * quantityOrdered) realPrice from orderdetails) as PriceByQuantity group by orderNumber ;
# 8 Dentro de la tabla orders obten el número de órdenes por año.
select year(orderDate) orderYear, count(*) ordersTotal from orders group by year(orderDate);
# 9 Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
select lastName, firstName from employees where officeCode = (select officeCode from offices where country = 'USA' limit 1);
# 10 Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
select customerNumber, checkNumber, amount from payments where amount = (select max(amount) from payments);
# 11 Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
select customerNumber, checkNumber, amount from payments where (select avg(amount) from payments) > amount ;
# 12 Obten el nombre de aquellos clientes que no han hecho ninguna orden.
select customerName from customers where customerNumber not in (select customerNumber from orders);
# 13 Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select orderNumber, max(quantityOrdered) maximo_prod, min(quantityOrdered) minimo_prod , round( avg(quantityOrdered),2) promedio_prod from orderdetails group by orderNumber;
# 14 Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
select status, count(*) count from orders group by status;