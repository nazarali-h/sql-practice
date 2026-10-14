--1. Вставь нового клиента: id = 15, имя = 'Анна', город = 'Чебоксары', возраст = 22.
--insert into customers
--values(15, N'Анна',  N'Чебоксары',  22)

--2. Вставь нового клиента: id = 16, имя = 'София', город = 'Краснодар', возраст = 28.
--insert into customers
--values(16, N'София',  N'Краснодар',  28)

--3. Вставь три заказа одним запросом:

--(118, 15, 'Монитор', 450.00, '2026-10-01')

--(119, 15, 'Мышь', 130.00, '2026-10-02')

--(120, 16, 'Ноутбук', 4000.00, '2026-10-03')

--insert into orders
--values(118, 15, N'Монитор', 450.00, '2026-10-01'),

--(119, 15, N'Мышь', 130.00, '2026-10-02'),

--(120, 16, N'Ноутбук', 4000.00, '2026-10-03');


--4. Проверь: покажи всех клиентов, у которых customer_id > 9.

select customers.name, customers.customer_id
from customers 
where customers.customer_id > 9

--5. Покажи всех клиентов из Худжанда и их заказы (включая тех, кто не купил).
select customers.name , customers.city, orders.product, orders.price, orders.order_date
from customers
left join orders on customers.customer_id = orders.customer_id 
where customers.city = N'Худжанд'


--6. Посчитай количество заказов по каждому клиенту (включая тех, у кого 0).
select customers.name, count(orders.order_id) as order_id
from customers 
left join orders on customers.customer_id = orders.customer_id 
group by customers.name 
order by order_id asc


--7. Покажи клиентов, у которых больше 2 заказов.
select customers.name, count(orders.order_id) as more_than_2_orders
from customers 
 join orders on customers.customer_id = orders.customer_id 
group by customers.name 
having count(orders.order_id) > 2

--8. Покажи клиентов, у которых средняя цена заказа > 300.
select customers.name, customers.customer_id, avg(orders.price) as avg_price_greater_than_300
from customers 
 join orders on customers.customer_id = orders.customer_id 
group by customers.name , customers.customer_id
having avg(orders.price) > 300
order by avg_price_greater_than_300 asc


--9. Покажи города, где сумма всех заказов > 1000.
select customers.city, sum(orders.price) as city_sum_more_than_1000
from customers 
join orders on customers.customer_id = orders.customer_id
group by customers.city
having sum(orders.price) > 1000
order by city_sum_more_than_1000 asc

--10. Покажи клиентов, у которых нет заказов (LEFT JOIN + IS NULL).
select customers.customer_id, customers.name, orders.order_id
from customers
left join orders on customers.customer_id = orders.customer_id
where orders.order_id is Null



--11. Покажи клиентов, у которых есть хотя бы один заказ дороже 500.
select customers.name , orders.order_id , orders.price
from customers
left join orders on customers.customer_id = orders.customer_id
where orders.price > 500
order by orders.price asc

--12. Покажи топ-3 клиентов по общей сумме заказов (по убыванию).
select top 3 customers.name, customers.customer_id, sum(orders.price) as total_price_for_desc
from customers 
left join orders on customers.customer_id = orders.customer_id
group by customers.name,  customers.customer_id
order by total_price_for_desc desc

--13. Покажи клиентов, у которых больше 1 заказа и средняя цена > 200.
select  customers.name, customers.customer_id, count(orders.order_id) as ordeer_count, avg(orders.price) as avg_order_price
from customers 
 join orders on customers.customer_id = orders.customer_id
group by customers.name,  customers.customer_id
having Count(orders.order_id) > 1
and avg(orders.price) > 200



--14. Покажи города, где средний возраст клиентов > 25 и количество заказов > 1.
select  customers.city, avg(customers.age) as avg_age , count(orders.order_id) as total_orders
from customers 
join orders on customers.customer_id = orders.customer_id
group by customers.city
having avg(customers.age) > 25 
and count(orders.order_id) > 1


--15. Покажи клиентов, у которых максимальная цена заказа > 500, отсортировать по имени.
select customers.name, customers.customer_id , max(orders.price) as max_price
from customers 
join orders on customers.customer_id = orders.customer_id
group by customers.name, customers.customer_id 
having max(orders.price) > 500
order by  customers.name asc
