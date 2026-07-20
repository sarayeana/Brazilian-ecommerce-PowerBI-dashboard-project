-- ============================================================
-- Brazilian E-Commerce Advanced SQL Analysis
-- Dataset : Olist Brazilian E-Commerce
-- Author  : Sara Yeana
-- Purpose : Advanced Business Analytics using SQL
-- ============================================================

use olist;

-- ============================================================
-- 1. Monthly Revenue
-- ============================================================

with monthly_revenue as
(
    select
        date_format(o.order_purchase_timestamp,'%Y-%m') as month,
        round(sum(oi.price),2) as revenue
    from olist_orders_dataset o
    join olist_order_items_dataset oi
        on o.order_id = oi.order_id
    group by month
)

select *
from monthly_revenue
order by month;

-- ============================================================
-- 2. Running Revenue
-- ============================================================

with monthly_revenue as
(
    select
        date_format(o.order_purchase_timestamp,'%Y-%m') as month,
        round(sum(oi.price),2) as revenue
    from olist_orders_dataset o
    join olist_order_items_dataset oi
        on o.order_id = oi.order_id
    group by month
)

select
    month,
    revenue,
    sum(revenue) over(order by month) as running_revenue
from monthly_revenue;

-- ============================================================
-- 3. Month-over-Month Revenue Growth
-- ============================================================

with monthly_revenue as
(
    select
        date_format(o.order_purchase_timestamp,'%Y-%m') as month,
        round(sum(oi.price),2) as revenue
    from olist_orders_dataset o
    join olist_order_items_dataset oi
        on o.order_id = oi.order_id
    group by month
)

select
    month,
    revenue,
    lag(revenue) over(order by month) as previous_month,
    round(
        (
            revenue -
            lag(revenue) over(order by month)
        )
        /
        lag(revenue) over(order by month)
        *100,
        2
    ) as mom_growth_percentage
from monthly_revenue;

-- ============================================================
-- 4. Three-Month Moving Average
-- ============================================================

with monthly_revenue as
(
    select
        date_format(o.order_purchase_timestamp,'%Y-%m') as month,
        round(sum(oi.price),2) as revenue
    from olist_orders_dataset o
    join olist_order_items_dataset oi
        on o.order_id = oi.order_id
    group by month
)

select
    month,
    revenue,
    round(
        avg(revenue)
        over(
            order by month
            rows between 2 preceding and current row
        ),
        2
    ) as moving_average
from monthly_revenue;

-- ============================================================
-- 5. Product Ranking
-- ============================================================

select
    product_id,
    round(sum(price),2) as revenue,
    rank() over(order by sum(price) desc) as product_rank
from olist_order_items_dataset
group by product_id;

-- ============================================================
-- 6. Seller Ranking
-- ============================================================

select
    seller_id,
    round(sum(price),2) as revenue,
    rank() over(order by sum(price) desc) as seller_rank
from olist_order_items_dataset
group by seller_id;

-- ============================================================
-- 7. Customer Ranking
-- ============================================================

select
    c.customer_unique_id,
    round(sum(oi.price),2) as revenue,
    rank() over(order by sum(oi.price) desc) as customer_rank
from olist_customers_dataset c
join olist_orders_dataset o
    on c.customer_id = o.customer_id
join olist_order_items_dataset oi
    on o.order_id = oi.order_id
group by c.customer_unique_id;

-- ============================================================
-- 8. Revenue Contribution by Category
-- ============================================================

select
    pct.product_category_name_english as category,
    round(sum(oi.price),2) as revenue,
    round(
        sum(oi.price)
        /
        (
            select sum(price)
            from olist_order_items_dataset
        )*100,
        2
    ) as revenue_percentage
from olist_order_items_dataset oi
join olist_products_dataset p
    on oi.product_id = p.product_id
join product_category_name_translation pct
    on p.product_category_name = pct.product_category_name
group by category
order by revenue desc;

-- ============================================================
-- 9. Repeat Customers
-- ============================================================

select
    customer_unique_id,
    count(distinct order_id) as total_orders
from
(
    select
        c.customer_unique_id,
        o.order_id
    from olist_customers_dataset c
    join olist_orders_dataset o
        on c.customer_id = o.customer_id
)t
group by customer_unique_id
having total_orders > 1;

-- ============================================================
-- 10. Customer Segmentation
-- ============================================================

select
    customer_unique_id,
    revenue,
    case
        when revenue >=10000 then 'Platinum'
        when revenue >=5000 then 'Gold'
        when revenue >=1000 then 'Silver'
        else 'Bronze'
    end as customer_segment
from
(
    select
        c.customer_unique_id,
        sum(oi.price) as revenue
    from olist_customers_dataset c
    join olist_orders_dataset o
        on c.customer_id = o.customer_id
    join olist_order_items_dataset oi
        on o.order_id = oi.order_id
    group by c.customer_unique_id
)t;

-- ============================================================
-- 11. Top 10 Products within Each Category
-- ============================================================

select *
from
(
    select
        pct.product_category_name_english,
        oi.product_id,
        sum(oi.price) as revenue,
        dense_rank() over(
            partition by pct.product_category_name_english
            order by sum(oi.price) desc
        ) as ranking
    from olist_order_items_dataset oi
    join olist_products_dataset p
        on oi.product_id=p.product_id
    join product_category_name_translation pct
        on p.product_category_name=pct.product_category_name
    group by
        pct.product_category_name_english,
        oi.product_id
)t
where ranking<=10;

-- ============================================================
-- 12. Average Delivery Days by State
-- ============================================================

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
    on o.customer_id=c.customer_id
where o.order_status='delivered'
group by c.customer_state
order by average_delivery_days desc;

-- ============================================================
-- 13. Monthly Active Customers
-- ============================================================

select
    date_format(order_purchase_timestamp,'%Y-%m') as month,
    count(distinct customer_id) as active_customers
from olist_orders_dataset
group by month
order by month;

-- ============================================================
-- 14. Revenue by Seller State
-- ============================================================

select
    s.seller_state,
    round(sum(oi.price),2) as revenue
from olist_order_items_dataset oi
join olist_sellers_dataset s
    on oi.seller_id=s.seller_id
group by s.seller_state
order by revenue desc;

-- ============================================================
-- End of Advanced Analysis
-- ============================================================
