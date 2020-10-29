#Jose Daniel Morales Ocampo - dany.0525.jmo@gmail.com
#1
use classicmodels;
show tables;
desc employees;
#2
select lastName from employees; 
#3
select lastName, firstName, jobTitle from employees;
#4
select * from employees;
#5
select lastName, firstName, jobTitle from employees where jobTitle = 'Sales Rep';
#6
select lastName, firstName, jobTitle, officeCode from employees where jobTitle = 'Sales Rep' and officeCode = 1;
#7
select lastName, firstName, jobTitle, officeCode from employees where jobTitle = 'Sales Rep' and officeCode = 1;
#8
select lastName, firstName, officeCode from employees where officeCode in (1,2,3);
#9
select lastName, firstName, jobTitle from employees where jobTitle != 'Sales Rep';
#10
select lastName, firstName, officeCode from employees where officeCode > 5;
#11
select lastName, firstName, officeCode from employees where officeCode <= 4;
#12
desc customers;
select customerName, country, state from customers where country = 'USA' and state = 'CA';
#13
select customerName, country, state creditLimit from customers where country in ('USA', 'France') and creditLimit > 100000;
#14
select customerName, country from customers where country = 'USA' or country = 'France';
#15
select customerName, country, creditLimit from customers where country in ('USA', 'France') and creditLimit > 100000;
#16
desc offices;
select officeCode, city, phone, country from offices where country in ('USA', 'France');
#17
select officeCode, city, phone, country from offices where country not in ('USA', 'France');
#18
desc orders;
select orderNumber, customerNumber, orders.status, orderDate from orders where orderNumber in (10165, 10287,10310);
#19
select contactLastName, contactFirstName from customers order by contactFirstName asc;
#20
select contactFirstName, contactFirstName from customers order by contactLastName desc;
#21
select contactFirstName, contactFirstName from customers order by contactLastName desc, contactFirstName asc;
#22
select customerNumber, contactFirstName, creditLimit from customers order by creditLimit desc limit 5;
#23
select customerNumber, contactFirstName, creditLimit from customers order by creditLimit asc limit 5;



