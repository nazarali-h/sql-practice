--1. Показать всех клиентов, у которых city = NULL.
select customers.name , customers.city 
from customers 
where customers.city is Null

--2. Показать всех клиентов, у которых city НЕ NULL.
select customers.name , customers.city 
from customers 
where customers.city is not Null

--3. Показать всех клиентов, у которых age = NULL.
select customers.name , customers.age 
from customers 
where customers.age is Null

--4. Показать всех клиентов, у которых city = NULL, и отсортировать по имени.
select customers.name, customers.city
from customers 
where customers.city is Null 
order by name asc

--5. Показать всех клиентов, у которых city = NULL ИЛИ age > 25.
select customers.name, customers.city, customers.age
from customers 
where customers.city is Null 
or age > 25
order by name asc


--7. Показать имя, цену и price * 2 AS double_price (из orders).
select customers.name, orders.price , (orders.price ) * 2 as double_price
from customers 
join orders on customers.customer_id = orders.customer_id

--8. Показать имя, цену и price * 0.9 AS discounted_price (скидка 10%).
select customers.name, orders.price , (orders.price ) * 0.9 as discounted_price 
from customers 
join orders on customers.customer_id = orders.customer_id

--9. Показать имя клиента, товар и цену с налогом (price * 1.12) AS price_with_tax.
select customers.name, orders.product, orders.price , (orders.price ) * 1.12 as price_with_tax
from customers 
join orders on customers.customer_id = orders.customer_id

--10. Показать всех клиентов, у которых city = NULL, и добавить столбец age + 1 AS next_age.
select customers.name, customers.city , customers.age, (customers.age) + 1 as next_age
from customers
where customers.city is Null 


--11. Показать всех клиентов с NULL в city или product, отсортировать по имени.
select customers.name, customers.city, orders.product 
from customers 
left join orders on customers.customer_id = orders.customer_id
order by customers.name asc