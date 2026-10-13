--1. Посчитать общее количество заказов.
select count(*) as total_orders
from orders 

--2. Посчитать количество клиентов.
select count(customers.name) as total_customers
from customers

--3. Посчитать среднюю цену заказа.
select avg(orders.price) as avg_order_price
from orders

--4. Посчитать сумму всех заказов.
select  sum(orders.price) as total_orders_price
from orders

--5. Посчитать минимальную и максимальную цену заказа.
select min(orders.price)as minimum_price, max(orders.price) as maximum_price
from orders

--6. Посчитать количество заказов по каждому клиенту.
select  customers.name, count(orders.order_id) as total_amount_orders_per_customer
from customers 
left join orders on customers.customer_id = orders.customer_id
group by customers.name

--7. Посчитать общую сумму заказов по каждому клиенту.
select customers.name, sum(orders.price) as total_orders_price
from customers 
left join orders on customers.customer_id = orders.customer_id
group by customers.name

--8. Показать клиентов, у которых больше 1 заказа.
select customers.name , count(orders.order_id) as one_more_orders
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.name
having count(orders.order_id) > 1
order by name asc

--9. Показать клиентов, у которых сумма заказов > 500.
select customers.name , sum(orders.price) as price_more_than_500
from customers
left join orders on customers.customer_id = orders.customer_id
group by customers.name
having sum(orders.price) > 500

--10. Показать среднюю цену заказа по каждому клиенту, отсортировать по убыванию.
select customers.name , avg(orders.price) as avg_orders_price_per_customers_desc
from customers 
left join orders  on customers.customer_id = orders.customer_id
group by customers.name
order by avg_orders_price_per_customers_desc desc

--11. Показать количество заказов по городам.
select customers.city, count(orders.order_id) as  total_amount_of_orders_for_per_city
from customers
left join orders on customers.customer_id = orders.customer_id
group by customers.city
order by customers.city asc

--12. Показать города, где больше 1 заказа.
select customers.city, count(orders.order_id) as city_has_one_more_orders
from customers 
left join orders on customers.customer_id = orders.customer_id
group by customers.city
having count(orders.order_id) > 1

--13. Показать клиентов, у которых средняя цена заказа > 200.
select customers.name, avg(orders.price) as avg_orders_amount_more_than_200
from customers 
left join orders on customers.customer_id = orders.customer_id
group by customers.name
having avg(orders.price) > 200

--14. Показать количество клиентов по городам.
select  customers.city, count(customer_id) as amount_of_customers_per_city
from customers
group by  customers.city

--15. Показать города, где средний возраст клиентов > 25.
select customers.city , avg(customers.age) as avg_customers_age_more_than_25
from customers
group by customers.city
having avg(customers.age) > 25