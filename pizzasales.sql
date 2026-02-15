
-- A. KPI’s
-- 1. Total Revenue:
select sum(total_price)as tottal_revenue
from pizza.pizza_sales;

-- 2. Average Order Value
select (sum(total_price)/count(distinct order_id) )as average_order_value
from pizza.pizza_sales;

-- 3. Total orders 
select count(distinct  order_id)as total_pizza_sold
from pizza.pizza_sales;

-- 4. Total Pizzas Sold
select sum(quantity)as total_pizza_sold
from pizza.pizza_sales;

-- 5. Average Pizzas Per Order
select (sum(quantity)/count( distinct order_id))as average_pizza_per_order
from pizza.pizza_sales;

-- B. Daily Trend for Total Orders
select dayname(order_date_new)as day,count(distinct order_id)
as total_order
from pizza.pizza_sales
group by day;


-- C. Monthly Trend for Orders
select monthname(order_date_new)as month,
count(distinct order_id)as orders
from pizza_sales
group by month;

-- D. % of Sales by Pizza Category
select pizza_category,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2)as percentage
from pizza_sales
group by pizza_category
order by percentage;

-- E. % of Sales by Pizza Size
select pizza_size,round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2)as percentage
from pizza_sales
group by pizza_size
order by percentage;

-- F. Total Pizzas Sold by Pizza Category
select pizza_category,sum(quantity)as total_pizza_sold
from pizza_sales
group by pizza_category
order by total_pizza_sold desc;

-- G. Top 5 Pizzas by Revenue
select pizza_name ,sum(total_price)as revenue
from pizza_sales
group by pizza_name 
order by revenue desc
limit 5;

-- H. Bottom 5 Pizzas by Revenue
select pizza_name ,sum(total_price)as revenue
from pizza_sales
group by pizza_name 
order by revenue 
limit 5;

-- I. Top 5 Pizzas by Quantity
select pizza_name ,sum(quantity)as quantity
from pizza_sales
group by pizza_name 
order by quantity desc
limit 5;

-- J. Bottom 5 Pizzas by Quantity
select pizza_name ,sum(quantity)as quantity
from pizza_sales
group by pizza_name 
order by quantity 
limit 5;

-- K. Top 5 Pizzas by Total Orders
select pizza_name ,count(distinct order_id)as total_orders
from pizza_sales
group by pizza_name 
order by total_orders desc 
limit 5;

-- L. Borrom 5 Pizzas by Total Orders
select pizza_name ,count(distinct order_id)as total_orders
from pizza_sales
group by pizza_name 
order by total_orders  
limit 5;











