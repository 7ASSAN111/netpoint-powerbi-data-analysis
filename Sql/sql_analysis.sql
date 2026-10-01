select
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    sum(quantity) as total_quantity,
    count(distinct order_id) as total_orders
from order_details;

----sales and profit by category

select
    products.category,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join products
    on order_details.products_key = products.products_key
group by products.category
order by total_sales desc



---sales and profit by sub-category



select
    products.sub_category,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join products
    on order_details.products_key = products.products_key
group by products.sub_category
order by total_sales desc



---sales and profit by segment


select
    customers.segment,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
join customers
    on orders.customer_id = customers.customer_id
group by customers.segment
order by total_sales desc


---sales and profit by region

select
    locations.region,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
join locations
    on orders.location_key = locations.location_key
group by locations.region
order by total_sales desc




---top 10 customers by sales



select top 10
    customers.customer_id,
    customers.customer_name,
    sum(order_details.sales) as total_sales
from order_details
join orders
    on order_details.order_id = orders.order_id
join customers
    on orders.customer_id = customers.customer_id
group by
    customers.customer_id,
    customers.customer_name
order by total_sales desc




---top 10 products by sales

select top 10
    products.product_id,
    products.product_name,
    sum(order_details.sales) as total_sales
from order_details
join products
    on order_details.products_key = products.products_key
group by
    products.product_id,
    products.product_name
order by total_sales desc


--sales and profit by ship mode


select
    orders.ship_mode,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
group by orders.ship_mode
order by total_sales desc



 --sales and profit by year

 select
    year(orders.order_date) as order_year,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
group by year(orders.order_date)
order by order_year




---sales and profit by month


select
    month(orders.order_date) as order_month,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
group by month(orders.order_date)
order by order_month

--sales and profit by year and month

select
    year(orders.order_date) as order_year,
    month(orders.order_date) as order_month,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
group by
    year(orders.order_date),
    month(orders.order_date)
order by
    order_year,
    order_month


   -- loss-making sub-categories


   select
    products.sub_category,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join products
    on order_details.products_key = products.products_key
group by products.sub_category
having sum(order_details.profit) < 0
order by total_profit




--top 10 loss-making products
select top 10
    products.product_id,
    products.product_name,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join products
    on order_details.products_key = products.products_key
group by
    products.product_id,
    products.product_name
having sum(order_details.profit) < 0
order by total_profit

--profit margin by category


select
    products.category,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit,
    sum(order_details.profit) / sum(order_details.sales) * 100 as profit_margin
from order_details
join products
    on order_details.products_key = products.products_key
group by products.category
order by profit_margin desc;


 --average discount by category
 select
    products.category,
    avg(order_details.discount) * 100 as average_discount
from order_details
join products
    on order_details.products_key = products.products_key
group by products.category
order by average_discount desc


--top 10 customers by profit

select top 10
    customers.customer_id,
    customers.customer_name,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
join customers
    on orders.customer_id = customers.customer_id
group by
    customers.customer_id,
    customers.customer_name
order by total_profit desc


--sales and profit by state
select top 10
    locations.state,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
join locations
    on orders.location_key = locations.location_key
group by locations.state
order by total_sales desc

--top 10 cities by sales
select top 10
    locations.city,
    sum(order_details.sales) as total_sales,
    sum(order_details.profit) as total_profit
from order_details
join orders
    on order_details.order_id = orders.order_id
join locations
    on orders.location_key = locations.location_key
group by locations.city
order by total_sales desc


---average order value by segment
select
    customers.segment,
    sum(order_details.sales) / count(distinct orders.order_id) as average_order_value
from order_details
join orders
    on order_details.order_id = orders.order_id
join customers
    on orders.customer_id = customers.customer_id
group by customers.segment
order by average_order_value desc



----profit by discount level
select
    discount,
    sum(sales) as total_sales,
    sum(profit) as total_profit
from order_details
group by discount
order by discount;