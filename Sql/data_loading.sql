insert into customers
    (customer_id, customer_name, segment)
select
    customer_id,
    customer_name,
    segment
from customers_import




insert into locations
    (location_key, postal_code, city, state, country, region)
select
    location_key,
    postal_code,
    city,
    state,
    country,
    region
from locations_import






insert into products
    (products_key, product_id, product_name, category, sub_category)
select
    products_key,
    product_id,
    product_name,
    category,
    sub_category
from products_import







insert into orders
    (order_id, order_date, ship_date, ship_mode, customer_id, location_key)
select
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    location_key
from orders_import






insert into order_details
    (order_detail_id, order_id, products_key, sales, quantity, discount, profit)
select
    orderdetails_id,
    order_id,
    products_key,
    sales,
    quantity,
    discount,
    profit
from orderdetails_import