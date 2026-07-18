# DAX Measures

This document contains all DAX measures and calculated columns used in the **Olist Brazilian E-Commerce Sales Dashboard**.

---

# Sales Metrics

## Total Revenue

**Description**

Calculates the total sales revenue.

```DAX
Total Revenue =
SUM(fact_order_items[price])
```

---

## Total Orders

**Description**

Counts the total number of unique orders.

```DAX
Total Orders =
DISTINCTCOUNT(fact_orders[order_id])
```

---

## Total Products Sold

**Description**

Calculates the total quantity of products sold.

```DAX
Total Products Sold =
COUNT(fact_order_items[order_item_id])
```

---

## Total Products

**Description**

Counts the total number of unique products.

```DAX
Total Products =
DISTINCTCOUNT(dim_product[product_id])
```

---

## Total Freight

**Description**

Calculates the total freight cost.

```DAX
Total Freight =
SUM(fact_order_items[freight_value])
```

---

## Average Order Value

**Description**

Calculates the average revenue generated per order.

```DAX
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders]
)
```

---

## Average Items per Order

**Description**

Calculates the average number of products purchased in each order.

```DAX
Average Items per Order =
DIVIDE(
    [Total Products Sold],
    [Total Orders]
)
```

---

## Previous Month Revenue

**Description**

Calculates revenue generated in the previous month.

```DAX
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSMONTH(dim_date[Date])
)
```

---

## MoM Growth %

**Description**

Calculates Month-over-Month revenue growth.

```DAX
MoM Growth % =
DIVIDE(
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue]
)
```

---

## Running Revenue

**Description**

Calculates cumulative revenue over time.

```DAX
Running Revenue =
CALCULATE(
    [Total Revenue],
    FILTER(
        ALL(dim_date),
        dim_date[Date] <= MAX(dim_date[Date])
    )
)
```

---

## YTD Revenue

**Description**

Calculates Year-to-Date revenue.

```DAX
YTD Revenue =
TOTALYTD(
    [Total Revenue],
    dim_date[Date]
)
```

---

## Moving Average

**Description**

Calculates the 3-month moving average of revenue.

```DAX
Moving Average =
AVERAGEX(
    DATESINPERIOD(
        dim_date[Date],
        MAX(dim_date[Date]),
        -3,
        MONTH
    ),
    [Total Revenue]
)
```

---

# Customer Metrics

## Total Customers

**Description**

Counts the total number of unique customers.

```DAX
Total Customers =
DISTINCTCOUNT(dim_customer[customer_unique_id])
```

---

## Average Revenue per Customer

**Description**

Calculates the average revenue generated per customer.

```DAX
Average Revenue per Customer =
DIVIDE(
    [Total Revenue],
    [Total Customers]
)
```

---

## Customer Rank

**Description**

Ranks customers based on total revenue.

```DAX
Customer Rank =
RANKX(
    ALL(dim_customer),
    [Total Revenue],
    ,
    DESC,
    DENSE
)
```

---

## Repeated Customers

**Description**

Counts customers who placed more than one order.

```DAX
Repeated Customers =
CALCULATE(
    DISTINCTCOUNT(dim_customer[customer_unique_id]),
    FILTER(
        VALUES(dim_customer[customer_unique_id]),
        CALCULATE(DISTINCTCOUNT(fact_orders[order_id])) > 1
    )
)
```

---

## One Time Customers

**Description**

Counts customers who placed exactly one order.

```DAX
One Time Customers =
CALCULATE(
    DISTINCTCOUNT(dim_customer[customer_unique_id]),
    FILTER(
        VALUES(dim_customer[customer_unique_id]),
        CALCULATE(DISTINCTCOUNT(fact_orders[order_id])) = 1
    )
)
```

---

## Repeated Customer Rate %

**Description**

Percentage of repeat customers.

```DAX
Repeated Customer Rate % =
DIVIDE(
    [Repeated Customers],
    [Total Customers]
)
```

---

## One Time Customer Rate %

**Description**

Percentage of one-time customers.

```DAX
One Time Customer Rate % =
DIVIDE(
    [One Time Customers],
    [Total Customers]
)
```

---

## Customer Type Count

**Description**

Counts customers by the selected customer type.

```DAX
Customer Type Count =
SWITCH(
    SELECTEDVALUE('Customer Type'[Type]),
    "Repeat", [Repeated Customers],
    "One-Time", [One Time Customers]
)
```

---

# Product & Category Metrics

## Category Rank

**Description**

Ranks product categories based on total revenue.

```DAX
Category Rank =
RANKX(
    ALL(dim_product[product_category_name_english]),
    [Total Revenue],
    ,
    DESC,
    DENSE
)
```

---

## Cumulative Revenue

**Description**

Calculates cumulative revenue for Pareto Analysis.

```DAX
Cumulative Revenue =
VAR CurrentRevenue = [Total Revenue]
RETURN
CALCULATE(
    [Total Revenue],
    FILTER(
        ALL(dim_product[product_category_name_english]),
        [Total Revenue] >= CurrentRevenue
    )
)
```

---

## Pareto Revenue %

**Description**

Calculates cumulative revenue as a percentage of total revenue.

```DAX
Pareto Revenue % =
DIVIDE(
    [Cumulative Revenue],
    CALCULATE(
        [Total Revenue],
        ALL(dim_product[product_category_name_english])
    )
)
```

---

# Seller Metrics

## Total Sellers

**Description**

Counts the total number of sellers.

```DAX
Total Sellers =
DISTINCTCOUNT(dim_seller[seller_id])
```

---

## Average Seller Revenue

**Description**

Calculates the average revenue generated per seller.

```DAX
Average Seller Revenue =
DIVIDE(
    [Total Revenue],
    [Total Sellers]
)
```

---

## Seller Rank

**Description**

Ranks sellers based on total revenue.

```DAX
Seller Rank =
RANKX(
    ALL(dim_seller),
    [Total Revenue],
    ,
    DESC,
    DENSE
)
```

---

# Review & Delivery Metrics

## Total Review

**Description**

Counts the total number of reviews.

```DAX:
Total Review =
COUNT(fact_reviews[review_id])
```

---

## Average Review Score

**Description**

Calculates the average review score.

```DAX:
Average Review Score =
AVERAGE(fact_reviews[review_score])
```

---

## Average Delivery Days

**Description**

Calculates the average delivery duration.

```DAX:
Average Delivery Days =
AVERAGE(fact_orders[Delivery Days])
```

---

# Calculated Columns

## Delivery Days

**Table**

`fact_orders`

**Description**

Calculates the number of days between purchase and customer delivery.

```DAX:
Delivery Days =
DATEDIFF(
    fact_orders[order_purchase_timestamp],
    fact_orders[order_delivered_customer_date],
    DAY
)
```

---

## Processing Days

**Table**

`fact_orders`

**Description**

Calculates the number of days between purchase and delivery.

```DAX:
Processing Days =
DATEDIFF(
    fact_orders[order_purchase_timestamp],
    fact_orders[order_delivered_customer_date],
    DAY
)
```

---

# Calculated Tables

## Customer Type

**Description**

Creates a disconnected table used for the Repeat vs One-Time Customer donut chart.

```DAX:
Customer Type =
DATATABLE(
    "Type", STRING,
    {
        {"Repeat"},
        {"One-Time"}
    }
)
```
