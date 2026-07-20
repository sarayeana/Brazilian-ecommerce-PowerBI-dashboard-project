-- duplicate order ids

select
order_id,
count(*)
from olist_orders_dataset
group by order_id
having count(*) > 1;

--------------------------------------------------

-- null values

select *
from olist_products_dataset
where product_category_name is null;

--------------------------------------------------

-- missing delivery dates

select *
from olist_orders_dataset
where order_delivered_customer_date is null;

--------------------------------------------------

-- invalid review scores

select *
from olist_order_reviews_dataset
where review_score not between 1 and 5;

--------------------------------------------------

-- duplicate customers

select
customer_unique_id,
count(*)
from olist_customers_dataset
group by customer_unique_id
having count(*) > 1;
