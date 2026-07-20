-- ============================================================
-- Brazilian E-Commerce Business Analysis
-- Dataset : Olist Brazilian E-Commerce
-- Author  : Sara Yeana
-- Purpose : Business KPI and dashboard supporting queries
-- ============================================================

use olist;

-- ============================================================
-- SALES ANALYSIS
-- ============================================================

-- 1. Total Revenue

select
    round(sum(price), 2) as total_revenue
from olist_order_items_dataset;

-- ------------------------------------------------------------

-- 2. Total Orders

select
    count(distinct order_id) as total_orders
from olist_orders_dataset;

-- ------------------------------------------------------------

-- 3. Total Customers

select
    count(distinct customer_unique_id) as total_customers
from olist_customers_dataset;

-- ------------------------------------------------------------

-- 4. Average Order Value

select
    round(sum(oi.price) / count(distinct oi.order_id), 2) as average_order_value
from olist_order_items_dataset oi;

-- ------------------------------------------------------------

-- 5. Monthly Revenue

select
    date_format(o.order_purchase_timestamp,'%Y-%m') as month,
    round(sum(oi.price),2) as revenue
from olist_orders_dataset o
join olist_order_items_dataset oi
on o.order_id = oi.order_id
group by month
order by month;

-- ------------------------------------------------------------

-- 6. Monthly Orders

select
    date_format(order_purchase_timestamp,'%Y-%m') as month,
    count(distinct order_id) as total_orders
from olist_orders_dataset
group by month
order by month;

-- ============================================================
-- CUSTOMER ANALYSIS
-- ============================================================

-- 7. Customers by State

select
    customer_state,
    count(distinct customer_unique_id) as customers
from olist_customers_dataset
group by customer_state
order by customers desc;

-- ------------------------------------------------------------

-- 8. Top 10 Customers by Revenue

select
    c.customer_unique_id,
    round(sum(oi.price),2) as revenue
from olist_customers_dataset c
join olist_orders_dataset o
    on c.customer_id = o.customer_id
join olist_order_items_dataset oi
    on o.order_id = oi.order_id
group by c.customer_unique_id
order by revenue desc
limit 10;

-- ------------------------------------------------------------

-- 9. Average Orders per Customer

select
    round(
        count(distinct o.order_id) /
        count(distinct c.customer_unique_id),
        2
    ) as avg_orders_per_customer
from olist_customers_dataset c
join olist_orders_dataset o
on c.customer_id = o.customer_id;

-- ============================================================
-- PRODUCT ANALYSIS
-- ============================================================

-- 10. Revenue by Product Category

select
    pct.product_category_name_english as category,
    round(sum(oi.price),2) as revenue
from olist_order_items_dataset oi
join olist_products_dataset p
    on oi.product_id = p.product_id
join product_category_name_translation pct
    on p.product_category_name = pct.product_category_name
group by category
order by revenue desc;

-- ------------------------------------------------------------

-- 11. Top 10 Products

select
    oi.product_id,
    round(sum(oi.price),2) as revenue
from olist_order_items_dataset oi
group by oi.product_id
order by revenue desc
limit 10;

-- ============================================================
-- SELLER ANALYSIS
-- ============================================================

-- 12. Top 10 Sellers

select
    seller_id,
    round(sum(price),2) as revenue
from olist_order_items_dataset
group by seller_id
order by revenue desc
limit 10;

-- ------------------------------------------------------------

-- 13. Sellers by State

select
    seller_state,
    count(*) as sellers
from olist_sellers_dataset
group by seller_state
order by sellers desc;

-- ============================================================
-- ORDER ANALYSIS
-- ============================================================

-- 14. Order Status Breakdown

select
    order_status,
    count(*) as total_orders
from olist_orders_dataset
group by order_status
order by total_orders desc;

-- ------------------------------------------------------------

-- 15. Orders by Day of Week

select
    dayname(order_purchase_timestamp) as day_name,
    count(*) as total_orders
from olist_orders_dataset
group by day_name
order by total_orders desc;

-- ------------------------------------------------------------

-- 16. Orders by Hour

select
    hour(order_purchase_timestamp) as order_hour,
    count(*) as total_orders
from olist_orders_dataset
group by order_hour
order by order_hour;

-- ============================================================
-- REVIEW ANALYSIS
-- ============================================================

-- 17. Average Review Score

select
    round(avg(review_score),2) as average_review_score
from olist_order_reviews_dataset;

-- ------------------------------------------------------------

-- 18. Review Score Distribution

select
    review_score,
    count(*) as total_reviews
from olist_order_reviews_dataset
group by review_score
order by review_score;

-- ============================================================
-- DELIVERY ANALYSIS
-- ============================================================

-- 19. Average Delivery Days

select
    round(
        avg(
            datediff(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) as average_delivery_days
from olist_orders_dataset
where order_status='delivered';

-- ------------------------------------------------------------

-- 20. Delivery Performance by State

select
    c.customer_state,
    round(
        avg(
            datediff(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) as average_delivery_days
from olist_orders_dataset o
join olist_customers_dataset c
    on o.customer_id = c.customer_id
where o.order_status='delivered'
group by c.customer_state
order by average_delivery_days desc;

-- ============================================================
-- PAYMENT ANALYSIS
-- ============================================================

-- 21. Payment Type Distribution

select
    payment_type,
    count(*) as total_payments
from olist_order_payments_dataset
group by payment_type
order by total_payments desc;

-- ------------------------------------------------------------

-- 22. Average Payment Value

select
    round(avg(payment_value),2) as average_payment_value
from olist_order_payments_dataset;

-- ============================================================
-- EXECUTIVE SUMMARY KPIs
-- ============================================================

select
    round(sum(oi.price),2) as total_revenue,
    count(distinct o.order_id) as total_orders,
    count(distinct c.customer_unique_id) as total_customers,
    round(sum(oi.price)/count(distinct o.order_id),2) as average_order_value,
    round(avg(r.review_score),2) as average_review_score
from olist_orders_dataset o
join olist_order_items_dataset oi
    on o.order_id = oi.order_id
join olist_customers_dataset c
    on o.customer_id = c.customer_id
left join olist_order_reviews_dataset r
    on o.order_id = r.order_id;
