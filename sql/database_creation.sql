create table customers
(
    customer_id varchar(20) primary key,
    customer_name varchar(100),
    segment varchar(50)
)


create table locations
(
    location_key int primary key,
    postal_code varchar(20),
    city varchar(100),
    state varchar(100),
    country varchar(100),
    region varchar(50)
)


create table products
(
    products_key int primary key,
    product_id varchar(30),
    product_name varchar(255),
    category varchar(50),
    sub_category varchar(50)
)


create table orders
(
    order_id varchar(30) primary key,
    order_date date,
    ship_date date,
    ship_mode varchar(50),
    customer_id varchar(20),
    location_key int,

    foreign key (customer_id) references customers(customer_id),
    foreign key (location_key) references locations(location_key)
)


create table order_details
(
    order_detail_id int primary key,
    order_id varchar(30),
    products_key int,
    sales decimal(18,2),
    quantity int,
    discount decimal(5,2),
    profit decimal(18,2),

    foreign key (order_id) references orders(order_id),
    foreign key (products_key) references products(products_key)
)
