-- purchase date range

select
min(order_purchase_timestamp) as first_order,
max(order_purchase_timestamp) as last_order
from olist_orders_dataset;

--------------------------------------------------

-- total customers

select count(distinct customer_unique_id)
from olist_customers_dataset;

--------------------------------------------------

-- total sellers

select count(distinct seller_id)
from olist_sellers_dataset;

--------------------------------------------------

-- total products

select count(distinct product_id)
from olist_products_dataset;

--------------------------------------------------

-- order status distribution

select
order_status,
count(*) as total_orders
from olist_orders_dataset
group by order_status
order by total_orders desc;

--------------------------------------------------

-- payment types

select
payment_type,
count(*) as total
from olist_order_payments_dataset
group by payment_type;
