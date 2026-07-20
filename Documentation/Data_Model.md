# 📐 Data Model

## Overview

A well-designed data model is the foundation of every Power BI project. This project follows the **Star Schema**, the industry-standard modeling approach for Business Intelligence solutions.

The model separates **transactional data (Fact Tables)** from **descriptive data (Dimension Tables)**, improving report performance, simplifying DAX calculations, and making the model easier to understand and maintain.

---

# Data Modeling Objectives

- Build a scalable Star Schema
- Improve query performance
- Enable efficient DAX calculations
- Reduce model complexity
- Eliminate unnecessary many-to-many relationships
- Create a single source of truth for business metrics

---

# Dataset Overview

The project uses the Brazilian E-Commerce (Olist) dataset, consisting of nine CSV files.

| Table | Type | Description |
|---------|------|-------------|
| dim_customer | Dimension | Customer information |
| dim_product | Dimension | Product information |
| dim_seller | Dimension | Seller information |
| dim_date | Dimension | Calendar table created in Power BI |
| fact_orders | Fact | Order-level information |
| fact_order_items | Fact | Product-level transaction details |
| fact_payments | Fact | Payment information |
| fact_reviews | Fact | Customer review information |
| dim_category_translation | Helper Table | Used only during Power Query transformation |

> **Note:** `dim_category_translation` is merged into `dim_product` during Power Query and is not loaded into the final data model.

---

# Star Schema

```
                         dim_date
                             │
                             │
                     fact_orders
                    /           \
                   /             \
          fact_payments     fact_reviews
                   │
                   │
            fact_order_items
             /            \
            /              \
     dim_product      dim_seller
            │
            │
      dim_customer
```

---

# Fact Tables

Fact tables contain measurable business transactions.

---

## fact_order_items

### Description

This is the central transactional table in the model.

Each row represents a product sold within an order.

### Why It Is the Main Fact Table

- Contains sales transactions
- Includes product-level revenue
- Links customers, sellers, and products
- Supports nearly every business analysis

### Important Columns

- order_id
- product_id
- seller_id
- price
- freight_value

---

## fact_orders

### Description

Contains order-level information.

### Important Columns

- order_id
- customer_id
- order_status
- purchase_timestamp
- estimated_delivery_date
- delivered_customer_date

### Business Uses

- Delivery analysis
- Order tracking
- Time intelligence
- Customer purchase history

---

## fact_payments

### Description

Stores payment information for each order.

### Important Columns

- order_id
- payment_type
- payment_installments
- payment_value

### Business Uses

- Payment analysis
- Installment trends
- Payment method distribution

---

## fact_reviews

### Description

Contains customer review information.

### Important Columns

- order_id
- review_score
- review_creation_date

### Business Uses

- Customer satisfaction
- Review analysis
- Service quality measurement

---

# Dimension Tables

Dimension tables describe business entities.

---

## dim_customer

Contains customer information.

### Important Columns

- customer_id
- customer_unique_id
- customer_city
- customer_state

### Why customer_unique_id?

The dataset generates a new **customer_id** every time a customer places an order.

Therefore:

- customer_id identifies an order-specific customer record.
- customer_unique_id identifies the actual customer across multiple orders.

For customer-level analysis, **customer_unique_id** is used.

---

## dim_product

Contains product information.

### Important Columns

- product_id
- product_category
- weight
- length
- height
- width

The product category is translated into English during Power Query.

---

## dim_seller

Contains seller information.

### Important Columns

- seller_id
- seller_city
- seller_state

---

## dim_date

A custom calendar table created using DAX.

### Purpose

Power BI Time Intelligence functions require a dedicated Date table.

Examples include:

- Year-to-Date Revenue
- Previous Month Revenue
- Running Revenue
- Month-over-Month Growth

### Columns

- Date
- Year
- Month
- Month Number
- Quarter
- Year-Month

---

# Relationship Diagram

| From Table | Column | To Table | Column | Cardinality |
|------------|--------|----------|--------|-------------|
| dim_customer | customer_id | fact_orders | customer_id | One-to-Many |
| fact_orders | order_id | fact_order_items | order_id | One-to-Many |
| dim_product | product_id | fact_order_items | product_id | One-to-Many |
| dim_seller | seller_id | fact_order_items | seller_id | One-to-Many |
| fact_orders | order_id | fact_payments | order_id | One-to-Many |
| fact_orders | order_id | fact_reviews | order_id | One-to-One / One-to-Many |
| dim_date | Date | fact_orders | Order Date | One-to-Many |

---

# Cardinality

The project primarily uses:

**One-to-Many (1:*)**

This is the recommended relationship type for Star Schema models.

Examples:

- One customer can place many orders.
- One product can appear in many order items.
- One seller can sell many products.

---

# Cross Filter Direction

All relationships use:

**Single Direction Filtering**

### Why?

- Better performance
- Avoids ambiguous filtering
- Simplifies DAX calculations
- Follows Microsoft best practices

Bidirectional filtering should only be used when absolutely necessary.

---

# Primary Keys

| Table | Primary Key |
|---------|-------------|
| dim_customer | customer_id |
| dim_product | product_id |
| dim_seller | seller_id |
| dim_date | Date |
| fact_orders | order_id |
| fact_order_items | order_id + order_item_id |
| fact_payments | order_id |
| fact_reviews | order_id |

---

# Hidden Columns

The following technical columns are hidden from report users:

- customer_id
- seller_id
- product_id
- order_id
- order_item_id

Keeping technical columns hidden makes the Fields pane cleaner and easier to use.

---

# Design Decisions

## Why Star Schema?

Compared to a flat table, Star Schema provides:

- Faster performance
- Lower memory usage
- Easier maintenance
- Simpler DAX
- Better scalability

---

## Why fact_order_items Is the Central Fact Table

`fact_order_items` contains the most detailed transactional data.

It connects directly to:

- Products
- Sellers
- Orders

Most sales metrics such as Revenue, Average Order Value, Category Sales, Seller Performance, and Product Analysis are derived from this table.

---

## Why Not Use customer_id?

The dataset generates a new `customer_id` for every order.

This means:

```
Customer A
├── customer_id = A123
├── customer_id = B456
├── customer_id = C789
```

These represent the same person.

Using `customer_unique_id` prevents double-counting customers.

---

## Why Create a Date Table?

Using a dedicated Date table enables:

- Time Intelligence functions
- Proper chronological sorting
- Running totals
- Year-to-Date calculations
- Previous Month comparisons
- Month-over-Month growth

---

## Why Disable dim_geolocation?

The geolocation table contains latitude and longitude data.

It was excluded from the model because:

- City and State information already exists in other tables.
- Geographic coordinates were not required for this project's business objectives.
- Removing unnecessary tables improves model performance.

---

# Data Model Validation Checklist

- ✅ Star Schema implemented
- ✅ Correct table relationships
- ✅ One-to-Many relationships used
- ✅ Single filter direction applied
- ✅ Date table created
- ✅ Date table marked correctly
- ✅ Technical columns hidden
- ✅ Dimension and Fact tables separated
- ✅ No unnecessary many-to-many relationships
- ✅ Optimized for DAX calculations

---

# Business Benefits

This data model enables stakeholders to:

- Analyze sales performance
- Track customer behavior
- Evaluate seller performance
- Monitor delivery efficiency
- Measure customer satisfaction
- Build scalable reports
- Support advanced DAX calculations

---

# Technologies Used

- Microsoft Power BI
- Power Query
- DAX
- Star Schema Modeling
- Relational Data Modeling
- Business Intelligence

---

# Summary

The data model follows industry best practices by implementing a clean Star Schema with optimized relationships, dedicated dimension tables, and a centralized transactional fact table. This structure provides excellent performance, simplifies report development, and serves as the foundation for all dashboards and business insights presented in this project.
