# 📊 Brazilian E-Commerce Power BI Dashboard Project

![Power BI](https://img.shields.io/badge/Power%20BI-Data%20Visualization-F2C811?logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![DAX](https://img.shields.io/badge/DAX-Power%20BI-orange)
![Power Query](https://img.shields.io/badge/Power%20Query-ETL-green)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)

---

# 📖 Project Overview

This project is an end-to-end Business Intelligence solution built using the **Brazilian E-Commerce (Olist) Dataset**.

The objective is to transform raw transactional data into meaningful business insights through data preparation, data modeling, DAX calculations, and interactive Power BI dashboards.

The project follows the complete Business Intelligence workflow used in real-world organizations:

- Business Understanding
- Data Preparation
- Power Query Transformation
- Star Schema Data Modeling
- DAX Development
- Dashboard Design
- Business Analysis
- Documentation
- Version Control with Git & GitHub

---

# 🎯 Business Objective

The goal of this project is to help stakeholders answer important business questions such as:

- How much revenue has the business generated?
- Which products generate the highest sales?
- Which customers contribute the most revenue?
- Which sellers perform the best?
- How efficient is the delivery process?
- How satisfied are customers?
- Which business areas require improvement?

---

# 📂 Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

The dataset contains historical information about:

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments
- Reviews
- Geolocation
- Product Category Translation

---

# 🛠️ Technologies Used

- Microsoft Power BI
- Power Query
- DAX
- SQL (MySQL)
- Star Schema Data Modeling
- Data Visualization
- Git
- GitHub

---

# 📁 Repository Structure

```text
Brazilian-Ecommerce-PowerBI-Dashboard-Project
│
├── Dashboard
├── Dataset
├── DAX
├── Documentation
├── Images
├── SQL
├── README.md
├── LICENSE
└── .gitignore
```

---

# 📐 Data Model

The project follows a **Star Schema**, separating transactional data from descriptive data to improve report performance and simplify DAX calculations.

### Fact Tables

- fact_orders
- fact_order_items
- fact_payments
- fact_reviews

### Dimension Tables

- dim_customer
- dim_product
- dim_seller
- dim_date

For a detailed explanation, see:

**Documentation/Data_Model.md**

---

# 📊 Dashboard Pages

The report contains five interactive dashboard pages.

---

## 1️⃣ Executive Overview

### Purpose

Provides a high-level overview of overall business performance.

### KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Average Review Score

### Visuals

- Revenue Trend
- Revenue by Product Category
- Revenue by Customer State
- Monthly Orders
- Top 10 Products

---

## 2️⃣ Sales Analysis

Provides detailed revenue analysis.

### Includes

- Revenue Trend
- Running Revenue
- Month-over-Month Growth
- Top Products
- Top Sellers

---

## 3️⃣ Customer Analysis

Analyzes customer purchasing behavior.

### Includes

- Customer Growth
- Customer Segmentation
- Repeat Customers
- Customer Distribution
- Top Customers

---

## 4️⃣ Product & Seller Analysis

Evaluates product and seller performance.

### Includes

- Revenue by Category
- Revenue by Seller
- Pareto Analysis (80/20)
- Dynamic Top N
- Product Details
- Seller Performance

---

## 5️⃣ Delivery & Customer Review Analysis

Measures operational performance.

### Includes

- Delivery Trend
- Review Distribution
- Delivery Performance by State
- Delivery vs Review Score
- Order Status Breakdown

---

# 📈 Key Performance Indicators (KPIs)

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Average Review Score
- Average Delivery Days
- Repeat Customers
- Average Customer Value
- Running Revenue
- Month-over-Month Growth
- Delivered Orders
- Late Deliveries

---

# 📊 Dashboard Features

- Interactive Slicers
- Dynamic Titles
- Report Tooltips
- Drill-through Pages
- Conditional Formatting
- Dynamic Top N Analysis
- Pareto Analysis
- Running Totals
- Time Intelligence
- Cross-filtering

---

# 🧮 SQL Analysis

Before building the Power BI dashboard, SQL was used to:

- Explore the dataset
- Validate data quality
- Analyze business performance
- Generate KPIs
- Perform advanced business analysis

SQL includes:

- Schema Creation
- Exploratory Analysis
- Data Quality Checks
- Business Analysis
- Advanced SQL Analysis

---

# 📊 DAX Measures

Custom DAX measures were created for:

### Sales

- Total Revenue
- Average Order Value
- Running Revenue
- Previous Month Revenue
- Month-over-Month Growth

### Customer

- Total Customers
- Repeat Customers
- Average Customer Value

### Product

- Total Products
- Product Ranking

### Seller

- Total Sellers
- Seller Ranking

### Review

- Average Review Score

### Delivery

- Average Delivery Days
- Delivered Orders
- Late Deliveries

---

# 💡 Business Insights

The dashboard helps identify:

- Revenue trends
- Customer purchasing behavior
- Product performance
- Seller contribution
- Regional sales distribution
- Delivery efficiency
- Customer satisfaction

---

## Dashboard Preview

### Executive Overview

<img src="Images/Dashboard/Executive%20Overview/Executive%20overview%201.png" width="900">

### Sales Analysis

<p align="center">
    <img src="Images/Dashboard/Sales%20Analysis/Sales%20Analysis%20Dashboard.png" width="900">
</p>

### Customer Analysis

<p align="center">
    <img src="Images/Dashboard/Customer%20Analysis/Customer%20Analysis.png" width="900">
</p>

<p align="center">
    <img src="Images/Dashboard/Customer%20Analysis/Customer%20Detail.png" width="900">
</p>
## Product & Seller Analysis

<p align="center">
    <img src="Images/Dashboard/Product&20Seller%20Analysis/Product&20Seller%20Analysis%Dashboard.png" width="900">
</p>

### Delivery & Customer Review Analysis

<p align="center">
    <img src="Images/Dashboard/Delivery%20&%20Customer%20Review%20Analysis/Delivery%20&%20Customer%20Review.png" width="900">
</p>

<p align="center">
    <img src="Images/Dashboard/Delivery%20&%20Customer%20Review%20Analysis/Order%20Details%20Drill%20Through.png" width="900">
</p>
```

---

# 📚 Documentation

Detailed project documentation is available in the **Documentation** folder.

- Business_Objective.md
- Data_Model.md
- Dashboard_Guide.md
- DAX_Measures.md
- Insights.md

---

# 🚀 Skills Demonstrated

### Business Intelligence

- KPI Design
- Dashboard Development
- Data Storytelling

### Data Modeling

- Star Schema
- Relationships
- Cardinality
- Filter Direction

### Power Query

- Data Cleaning
- Data Transformation
- Merging Queries
- Column Profiling

### DAX

- Measures
- Time Intelligence
- CALCULATE()
- FILTER()
- DIVIDE()
- RANKX()
- SWITCH()
- Variables

### SQL

- Joins
- Window Functions
- CTEs
- Aggregations
- Ranking Functions
- Date Functions

### Git

- Repository Management
- Documentation
- Version Control

---

# 🔮 Future Improvements

Potential enhancements include:

- Sales Forecasting
- Customer Lifetime Value (CLV)
- RFM Analysis
- Cohort Analysis
- Mobile Report Layout
- AI Visuals
- What-if Parameters
- Incremental Refresh
- Performance Optimization

---

# 📌 Learning Outcomes

Through this project, I gained practical experience in:

- Power BI Dashboard Development
- Power Query Transformations
- DAX Programming
- Data Modeling
- SQL Business Analysis
- Interactive Data Visualization
- GitHub Documentation
- Business Intelligence Best Practices

---

# 📜 License

This project is licensed under the MIT License.

---

# 👤 Author

**Sara Yeana**

Aspiring Data Analyst | SQL | Power BI | Data Visualization | Business Intelligence

---

⭐ If you found this project helpful, consider giving it a **Star** on GitHub!
