--1) Показать имя клиента и товар, который он купил.
 select name, product
from customers
join orders on customers.customer_id = orders.customer_id

--2) Показать имя клиента, товар и цену.
select name, product, price
from customers 
join orders on customers.customer_id = orders.customer_id

--3) Показать имя клиента, товар и город, где живёт клиент.
select name, product, city
from customers 
join orders on customers.customer_id = orders.customer_id

--4) Показать всех клиентов из Москвы и их заказы.
select name, product, city, order_date, price
from customers
join orders on customers.customer_id = orders.customer_id
where city = N'Москва'
order by name asc


--5) Показать имя клиента и товар, отсортировать по цене (по убыванию).
select top 5 name , product, price
from customers 
join orders on  customers.customer_id = orders.customer_id
order by price desc


--6) Показать имя клиента, товар и цену — только для товара 'Ноутбук'.
select name, product, price
from customers 
join orders on customers.customer_id = orders.customer_id
where product = N'Ноутбук'
order by name asc



--7) Показать имя клиента и цену — где цена > 100.
select name, price 
from customers 
join orders on customers.customer_id = orders.customer_id
where price > 100
order by price asc 


--8) Показать имя клиента, товар и дату заказа, отсортировать по дате.
select name, product, order_date
from customers 
join orders on customers.customer_id = orders.customer_id
order by order_date asc


--9) Показать имя клиента, товар и цену — только для клиентов из Казани.
select name, product, price, city 
from customers 
join orders on customers.customer_id = orders.customer_id
where city = N'Казань'




--10) Показать имя клиента, товар и цену — топ-3 по цене (по убыванию).
select top 3 name, product, price 
from customers 
join orders on customers.customer_id = orders.customer_id
order by price desc

