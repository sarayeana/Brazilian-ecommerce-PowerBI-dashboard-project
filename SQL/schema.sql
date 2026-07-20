-- =====================================================
-- Brazilian E-Commerce Database Schema
-- =====================================================

create database if not exists brazilian_ecommerce;

use brazilian_ecommerce;

-- view all tables
show tables;

-- table structure
describe olist_customers_dataset;
describe olist_orders_dataset;
describe olist_order_items_dataset;
describe olist_order_payments_dataset;
describe olist_order_reviews_dataset;
describe olist_products_dataset;
describe olist_sellers_dataset;
describe product_category_name_translation;
describe olist_geolocation_dataset;

-- row count of every table

select count(*) as customers
from olist_customers_dataset;

select count(*) as orders
from olist_orders_dataset;

select count(*) as order_items
from olist_order_items_dataset;

select count(*) as payments
from olist_order_payments_dataset;

select count(*) as reviews
from olist_order_reviews_dataset;

select count(*) as products
from olist_products_dataset;

select count(*) as sellers
from olist_sellers_dataset;

select count(*) as geolocation
from olist_geolocation_dataset;
