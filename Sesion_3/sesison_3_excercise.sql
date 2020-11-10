use classicmodels;
-- Para estas consultas usa RIGHT JOIN
-- -- Obten el código de producto, nombre de producto y descripción de todos los productos.
select p.productCode, productName, productDescription from orderdetails o right join products p on o.productCode = p.productCode;
-- -- Obten el número de orden, estado y costo total de cada orden.
select od.orderNumber, status, sum((priceEach * quantityOrdered)) as costTotal from orders o right join orderdetails od using(orderNumber) group by orderNumber order by od.orderNumber;
-- -- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.
select orderdetails.orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach, requiredDate from orders right join (products right join orderdetails using(productCode)) using(orderNumber) order by orderDate;
-- -- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
select orderNumber, productName, MSRP, priceEach from products right join orderdetails using (productCode);
-- Para estas consultas usa LEFT JOIN
-- -- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
select customerNumber, customerName, orderNumber, status from customers left join orders using(customerNumber);
-- -- Obtén los clientes que no tienen una orden asociada.
select customerName, orderNumber from customers left join orders using(customerNumber) where orders.customerNumber is null;
-- -- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
select concat(lastName,' ',firstName) employeerName, customerName, checkNumber, amount from customers left join payments using(customerNumber) left join employees on salesRepEmployeeNumber = employeeNumber where firstName is not null;
-- Para estas consultas usa RIGHT JOIN
-- -- Repite los ejercicios 5 a 7 usando RIGHT JOIN.
select customerNumber, customerName, orderNumber, status from orders right join customers using(customerNumber);
-- -- Obtén los clientes que no tienen una orden asociada.
select customerName, orderNumber from orders right join customers using(customerNumber) where orders.customerNumber is null;
-- -- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
select concat(lastName,' ',firstName) employeeName, customerName, checkNumber, amount from payments right join (employees right join customers on salesRepEmployeeNumber = employeeNumber) using (customerNumber) where firstName is not null;
-- -- Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
create view salesReport_72 as  
select concat(lastName,' ',firstName) employeerName, customerName, checkNumber, amount from customers left join payments using(customerNumber) left join employees on salesRepEmployeeNumber = employeeNumber where firstName is not null;
select employerName, customerName, amount from salesReport_72 where (amount = (select min(amount) from salesReport_72)) or (amount = (select max(amount) from salesReport_72));