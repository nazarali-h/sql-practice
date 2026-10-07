--1. Показать всех клиентов и их заказы, включая тех, кто ничего не купил.
select name, product
from customers 
left join orders on customers.customer_id = orders.customer_id


--2. Показать только тех клиентов, у которых есть заказы .
select name, product
from customers 
 join orders on customers.customer_id = orders.customer_id


--3. Показать всех клиентов из Москвы и их заказы, включая тех, кто не купил.
select name, city, product
from customers 
left join orders on customers.customer_id = orders.customer_id
where city = N'Москва'

--4. Показать всех клиентов старше 25 и их заказы, включая тех, кто не купил.
select name, city,  age, product
from customers 
left join orders on customers.customer_id = orders.customer_id
where age > 25


--5. Показать все заказы и клиентов, включая заказы без клиента .
select name, product 
from customers 
right join orders on customers.customer_id = orders.customer_id

--6. Показать всех клиентов и их заказы, отсортировать по имени клиента.
select name, product
from customers 
 left join orders on customers.customer_id = orders.customer_id
 order by name asc

--7. Показать всех клиентов из Душанбе и их заказы, включая тех, кто не купил.
select name, city, product
from customers 
left join orders on customers.customer_id = orders.customer_id
where city = N'Душанбе'
