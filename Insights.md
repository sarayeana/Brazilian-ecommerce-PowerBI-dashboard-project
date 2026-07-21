# 💡 Business Insights

## Overview

The Brazilian E-Commerce Power BI Dashboard provides an end-to-end view of sales, customers, products, sellers, delivery performance, and customer satisfaction.

The analysis combines SQL, Power Query, Data Modeling, and DAX to identify business trends and operational opportunities.

---

# 1. 📈 Sales & Revenue Insights

## Revenue Performance

The analysis of revenue over time helps identify overall business growth patterns, monthly fluctuations, and periods of stronger or weaker sales performance.

### Key Insight

Revenue should be monitored alongside order volume and Average Order Value (AOV) to understand the real driver of growth.

Revenue can increase because of:

- More customers placing orders
- More orders per customer
- Higher average order value
- A combination of these factors

Therefore, revenue alone should not be used to evaluate business performance.

---

## Monthly Revenue Trends

Monthly revenue analysis helps identify:

- Growth trends
- Seasonal patterns
- High-performing months
- Low-performing periods

### Business Recommendation

The business should investigate the reasons behind significant monthly changes and use historical patterns to improve sales planning and inventory management.

---

# 2. 🛒 Order Analysis

## Order Volume

Order trends provide an understanding of customer purchasing activity over time.

Analyzing:

- Daily orders
- Monthly orders
- Orders by day of week
- Orders by hour

helps identify when customers are most active.

### Business Recommendation

Marketing campaigns and promotional activities can be scheduled around periods of higher customer activity.

---

## Average Order Value

Average Order Value helps determine how much customers typically spend per order.

### Business Recommendation

The business can increase AOV through:

- Product bundling
- Cross-selling
- Upselling
- Free-shipping thresholds
- Personalized recommendations

---

# 3. 👥 Customer Insights

## Customer Distribution

Customers are distributed across multiple Brazilian states, creating opportunities for regional analysis.

Some states have a significantly larger customer base than others.

### Business Recommendation

The company should focus on:

- High-customer-density regions
- Regions with strong revenue potential
- Regions with limited seller availability

This can help improve product availability and delivery performance.

---

## Customer Segmentation

Customers are segmented based on revenue contribution:

- Platinum
- Gold
- Silver
- Bronze

This allows the business to identify high-value customers and understand how revenue is distributed across customer groups.

### Business Recommendation

High-value customers should receive targeted retention strategies such as:

- Personalized offers
- Loyalty programs
- Exclusive promotions
- Early access to new products

---

## Repeat Customer Analysis

Repeat customers are important for long-term business growth because retaining existing customers is generally more sustainable than relying entirely on new customer acquisition.

### Business Recommendation

The business should monitor repeat purchase behavior and develop strategies to encourage customers to place additional orders.

Potential strategies include:

- Personalized recommendations
- Loyalty rewards
- Post-purchase campaigns
- Targeted email marketing

---

# 4. 🏆 Product Insights

## Top Performing Products

A relatively small number of products may contribute a significant share of total revenue.

The Top 10 Product analysis helps identify the products that have the greatest impact on overall sales.

### Business Recommendation

High-performing products should receive greater attention in:

- Inventory planning
- Marketing campaigns
- Promotional activities
- Product placement

---

## Product Category Performance

Revenue varies significantly across product categories.

This allows management to identify:

- High-performing categories
- Low-performing categories
- Growth opportunities

### Business Recommendation

High-performing categories can receive additional investment, while low-performing categories should be investigated to understand whether the issue is related to:

- Product demand
- Pricing
- Availability
- Marketing
- Customer satisfaction

---

# 5. 🏪 Seller Insights

## Seller Performance

Seller revenue analysis identifies the sellers contributing most significantly to marketplace sales.

### Business Recommendation

High-performing sellers can be studied to identify successful practices related to:

- Product selection
- Pricing
- Delivery performance
- Customer satisfaction

---

## Seller Distribution

Seller availability varies across Brazilian states.

Some regions may have strong customer demand but comparatively fewer sellers.

### Business Recommendation

The business should consider increasing seller acquisition in regions where:

- Customer demand is high
- Seller availability is low
- Delivery performance can be improved through local fulfillment

This could help reduce delivery times and improve customer satisfaction.

---

# 6. 🚚 Delivery Insights

## Delivery Performance

Delivery performance is an important operational metric because delays can negatively affect customer satisfaction.

The analysis compares:

- Purchase date
- Estimated delivery date
- Actual delivery date

This allows the business to identify late deliveries.

---

## Late Deliveries

Orders delivered after the estimated delivery date are classified as late.

### Business Recommendation

Late deliveries should be investigated by:

- Customer state
- Seller state
- Product category
- Seller
- Time period

This can help identify specific regions or sellers responsible for delivery problems.

---

## Delivery Performance by State

Delivery times vary across different regions.

Geographic analysis can identify states with:

- Faster deliveries
- Slower deliveries
- Higher operational challenges

### Business Recommendation

The business should consider:

- Regional fulfillment centers
- Local seller expansion
- Improved logistics partnerships
- Better delivery estimation

---

# 7. ⭐ Customer Review Insights

## Review Score Distribution

Customer reviews provide a direct indication of customer satisfaction.

Review scores can be analyzed alongside:

- Delivery time
- Order status
- Product category
- Seller performance

---

## Delivery Time vs Review Score

The relationship between delivery speed and review score helps determine whether slower deliveries are associated with lower customer satisfaction.

### Business Recommendation

If delayed orders consistently receive lower reviews, improving delivery performance should become a key priority.

---

# 8. 📦 Order Status Insights

Order status analysis provides visibility into the overall order lifecycle.

The dashboard monitors statuses such as:

- Delivered
- Shipped
- Processing
- Canceled
- Unavailable

### Business Recommendation

The business should monitor non-delivered orders closely.

A high number of canceled or unavailable orders may indicate issues with:

- Inventory
- Seller reliability
- Order processing
- Logistics

---

# 9. 📊 Pareto Analysis

The Pareto Analysis evaluates whether a small percentage of products contributes a large percentage of total revenue.

This helps answer:

> Does the business follow the 80/20 principle?

### Business Recommendation

If a small group of products generates most of the revenue, these products should receive priority in:

- Inventory management
- Marketing
- Pricing strategies
- Supply planning

At the same time, the business should identify opportunities to improve the performance of lower-contributing products.

---

# 10. 🌎 Geographic Insights

The analysis of customer and seller states provides a geographic view of the marketplace.

Comparing:

- Customer distribution
- Seller distribution
- Revenue
- Delivery performance

can reveal geographic mismatches.

### Key Business Opportunity

Regions with:

- High customer demand
- Strong revenue
- Low seller availability

may represent opportunities for seller acquisition and regional expansion.

---

# 11. 🎯 Key Business Recommendations

Based on the overall analysis, the business should focus on:

### 1. Improve Delivery Performance

Identify states and sellers with high delivery times and late deliveries.

### 2. Increase Seller Coverage

Recruit more sellers in regions where customer demand is high but seller availability is relatively low.

### 3. Retain High-Value Customers

Create targeted loyalty and retention programs for Platinum and Gold customer segments.

### 4. Focus on High-Performing Products

Prioritize top products and categories for inventory and marketing investment.

### 5. Reduce Late Deliveries

Investigate logistics and seller-level causes of late orders.

### 6. Improve Customer Satisfaction

Analyze the relationship between delivery performance and review scores.

### 7. Monitor Revenue Drivers

Track revenue together with:

- Order volume
- Customer growth
- Average Order Value

to understand what is actually driving business growth.

---

# 12. ⚠️ Data Quality Considerations

The dataset contains some incomplete information.

Examples include:

- Missing delivery dates
- Missing product categories
- Orders that were not delivered
- Date inconsistencies

Therefore, delivery and order-status metrics should be interpreted carefully.

For example, the delivered order percentage should not be treated as perfectly accurate without considering missing or inconsistent date information.

---

# 13. 📌 Overall Conclusion

The analysis demonstrates that business performance should not be evaluated using revenue alone.

A complete view requires analyzing:

```text
Revenue
   │
   ├── Orders
   │
   ├── Customers
   │
   ├── Products
   │
   ├── Sellers
   │
   ├── Delivery
   │
   └── Customer Satisfaction
```

The Power BI dashboard brings these areas together into a single interactive Business Intelligence solution.

The main opportunities identified are:

- Improving delivery performance
- Increasing seller coverage in high-demand regions
- Retaining high-value customers
- Focusing on high-performing products
- Reducing late deliveries
- Improving customer satisfaction

These insights can help stakeholders make more informed decisions about sales, customer retention, marketplace growth, and operational efficiency.

---

# 📚 Related Documentation

For more information about the project, see:

- `Business_Objective.md`
- `Data_Model.md`
- `Dashboard_Guide.md`
- `DAX_Measures.md`
