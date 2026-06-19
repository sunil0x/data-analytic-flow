-- Creating the table name pizzas
CREATE TABLE pizza(
pizza_id text,
pizza_type_id text,
size text,
price decimal(10,2)

);

SELECT *FROM pizza
limit 5;

-- creating the table pizza_types
CREATE TABLE pizza_types(
pizza_type_id text,
name text,
category text,
ingredients text
);

SELECT *from pizza_types
limit 5;

-- creating the table name orders
CREATE TABLE orders(
order_id int primary key,
date date not null,
time time not null
);

-- 
SELECT *from orders;

-- creating the table named order_details
CREATE TABLE order_details(
order_details_id int primary key,
order_id int not null,
pizza_id text not null,
quantity int not null
);


SELECT *from order_details;

-- basic questions
-- 1. retrieve the total number of order placed

SELECT COUNT(*) as total_order
FROM orders;


--2. Calculate the total revenue generated from pizza sales.

SELECT SUM(p.price*od.quantity) as total_renenue
FROM pizza p
JOIN order_details od
ON p.pizza_id = od.pizza_id;

-- 3. Identify the highest-priced pizza.
SELECT ptypes.name, p.price as high_price
FROM pizza p
INNER JOIN pizza_types ptypes
ON p.pizza_type_id = ptypes.pizza_type_id
order by p.price desc
limit 1;


-- 4. Identify the most common pizza size ordered.
SELECT COUNT(od.order_id) as sales_count,p.size FROM pizza p
JOIN order_details od ON
p.pizza_id = od.pizza_id
GROUP BY p.size
order by sales_count desc
limit 1;


SELECT *FROM order_details;
-- 5. List the top 5 most ordered pizza 
--types along with their quantities.

SELECT ptypes.name, sum(od.quantity) as quantity
FROM pizza_types ptypes 
JOIN pizza p ON 
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
group by ptypes.name
order by quantity desc
limit 5;

-- intermediate questions solve
--1 .Join the necessary tables to 
--find the total quantity of each 
--pizza category ordered.

SELECT ptypes.category, sum(od.quantity) as quantity
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.category
;



--Determine the distribution of orders
--by hour of the day.
SELECT EXTRACT(HOUR FROM time) as hour,
COUNT(order_id) as total_count
FROM orders
GROUP BY hour
order by total_count desc;

--Join relevant tables to find the category-wise 
--distribution of pizzas.


SELECT ptypes.category ,count(od.order_id) as total_count
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.category;

SELECT *FROM order_details;

--Group the orders by date and calculate the 
--average number of pizzas ordered per day.
SELECT avg(avg_ordered) as avg_per_day FROM
(
SELECT o.date as ordered_date, SUM(od.quantity) as avg_ordered
FROM orders o
JOIN order_details as od
ON o.order_id = od.order_id
GROUP BY o.date) as order_quantity;


--Determine the top 3 most ordered pizza 
--types based on revenue.

SELECT ptypes.name as pizza_types, SUM(p.price*od.quantity) as total_revenue
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.name
Order by total_revenue desc
limit 3;