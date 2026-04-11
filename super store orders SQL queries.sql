create database Superstore;
use Superstore;
select * from superstoreorders;
-- Total Sales
select sum(sales) as Total_sales from superstoreorders;

-- Total Orders
select count(order_id) as Total_order from superstoreorders;

-- Total Profit
select sum(profit) as total_profit from superstoreorders;

-- Most sales based on country
select country, sum(sales) as Total_sales
from superstoreorders
group by country
order by Total_sales desc ;

-- most orderd based on country
select country, count(order_id) as Total_orders
from superstoreorders
group by country 
order by Total_orders desc limit 5;

-- Top revenue product
select product_name ,sum(sales) as total_sales
from superstoreorders
group by product_name
order by total_sales desc limit 5;

-- Top Profittable Product
select product_name, sum(profit) as total_profit
from superstoreorders
group by product_name
order by total_profit desc limit 1;

-- top selling product
select product_name, sum(quantity) as total_quantity
from superstoreorders
group by product_name
order by total_quantity desc limit 5;

-- region wise 
select region, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by region
order by total_sales desc ;

-- year wise 
select year, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by year
order by total_sales desc ;

-- State wise 
select state, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by state
order by total_sales desc ;

-- month wise
select month, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by month
order by total_sales desc ;

-- day wise
select day, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by day
order by total_sales desc ;

-- category
select category, sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
group by category
order by total_sales desc ;

-- sub categrory
select sub_category,sum(sales) as total_sales, count(order_id) as total_order, sum(profit) as Total_profit
from superstoreorders
where category ="Technology"
group by sub_category
order by total_sales desc;

-- most ordered and total_spent which customer
select customer_name, count(order_id) as total_orders, sum(sales) as total_spent
from superstoreorders
group by customer_name
order by total_spent desc ;

-- which ordered  have discount
select count(order_id) from superstoreorders
where discount = 0;

-- customer_name with toatl order quantity
select customer_name , sum(quantity)as total_quantity
from superstoreorders
group by customer_name
order by total_quantity desc;

-- profit margin based on category
select category, sum(profit)/sum(sales) *100 as profit_margin
from superstoreorders 
group by category
order by profit_margin desc ;

-- Loss making product
select product_name , sum(profit) as total_loss
from superstoreorders
group by product_name
having total_loss <0
order by total_loss ;

-- average order value
select sum(sales)/ count(distinct order_id)
as average_order_value from superstoreorders;

-- top product in eacah category
select * from (select category, product_name, sum(sales) as total_sales, 
RANK() over (partition by category order by sum(sales) desc) as rnk
from superstoreorders
group by category,product_name ) t
where rnk=1; 

-- year over year growth
select year ,sum(sales) as total_sales, 
lag(sum(sales)) over( order by year) as prev_year,
(sum(sales) - lag(sum(sales)) over (order by year)) 
/ lag(sum(sales)) over (order by year) *100 as growth_pecentage 
from superstoreorders
group by year;

-- use full insight
-- 1 total sales= 11849510
-- 2 total orders= 50764
-- 3 total_profit= 1356049.0599999926
-- 4 most sales in United States
-- 5 most sales in 2014 year
-- 6 most orderd in sunday
-- 7 most orders in december
-- 8 year wise growth
-- top catagory is Technology
-- top revenue product is Apple smart phone full size
-- top profitable product is  Cisco Smart phone full size
-- top selling product is Staples
-- most spent a customer is Greg Tran


