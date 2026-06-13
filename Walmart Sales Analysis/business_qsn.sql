-- viewing the table

SELECT count(*)
FROM walmart;


-- how many distinct payment type we have
SELECT DISTINCT payment_method
FROM walmart;


--how many transactions we have in each of the payment method
SELECT payment_method,COUNT(*)
FROM walmart
GROUP BY payment_method;





-- total number of stores we have for walmart sales 
-- If you just want the count (cleaner)

SELECT COUNT(DISTINCT "Branch")
FROM walmart
LIMIT 3;

-- max quantity from the sales of walmart
SELECT MAX(quantity)
FROM walmart;


SELECT MIN(quantity)
FROM walmart;


-- Business Problems
-- 1. find the different payment method and 
-- no of transaction and number of quantity sold

SELECT payment_method, 
COUNT(invoice_id),
SUM(quantity)
FROM walmart
GROUP BY payment_method;


--2. Identify the highest rated category in each branch
--and display branch ,category and the average rating

SELECT branch, category, AVG(rating)
SELECT *FROM 
(
SELECT 
"Branch", category, AVG(rating) as avg_rating,
RANK() OVER(PARTITION BY "Branch" ORDER BY AVG(rating) DESC) as rank
FROM walmart
GROUP BY 1,2
) WHERE rank =1;

--3. Identify the busiest day for each branch based 
-- on the number of transactions 

SELECT *FROM
(
SELECT 
"Branch", 
TO_CHAR(TO_DATE(date,'DD/MM/YY'),'Day') as day_name,
COUNT(*) as total_transactions,
RANK() OVER(PARTITION BY 'Branch' ORDER BY COUNT(*) DESC) as rank
FROM walmart
GROUP BY 1,2)
WHERE rank =1;


--4. calculate the total quantity of items sold per payment_method
SELECT payment_method, SUM(quantity) as total_quantity
FROM walmart
GROUP BY payment_method;

--5. determine avg, min, max rating of the category 
-- for each city: list the city, avg_rating, min_rating, max_rating

SELECT "City",category,
AVG(rating),MIN(rating),MAX(rating)
FROM walmart
GROUP BY 1,2;

--6. calculate the total profit for each category by considering
-- the total profit as (unit_price * quantity *profit_margin)
--list category and total profit, order from high to low

SELECT category, 
SUM(total) as total_revenue,
SUM(total *profit_margin) as profit
FROM walmart
GROUP BY category
ORDER BY profit DESC;



--7. determine the most common payment method for each branch
SELECT DISTINCT "Branch",payment_method, COUNT(*) as total_used
FROM walmart
GROUP BY 1,2
ORDER BY total_used desc;

--8: categorize the transactions into morning, afternoon and the evening
--find out each of then shift and number of invoices
SELECT *,
CASE 
    WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS day_time
FROM walmart;

