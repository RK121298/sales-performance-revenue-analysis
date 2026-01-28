# Sales Performance & Revenue Optimization Analysis

## 📌 Project Overview

This project analyzes transactional sales data to identify revenue drivers, underperforming areas, and business risks, and to support management-level decision making for sales strategy and resource allocation.

---

## 🎯 Business Objectives

The primary objectives of this project are:

- Evaluate overall revenue and order performance
- Identify top and underperforming products, regions, and customer segments
- Understand seasonal and monthly revenue trends
- Analyze the impact of discounts on profitability
- Assess revenue concentration risk from key customers

---

## ❓ Key Business Questions

1. How is total revenue and order volume trending over time?
2. Which products contribute most to revenue and sales volume?
3. Which regions are high-performing and which are underperforming?
4. Which customer segments are most profitable?
5. Are there clear seasonal patterns in monthly revenue?
6. How do different discount levels impact profit?
7. How concentrated is revenue among the top customers?

---

## 🗂️ Dataset

Source: Superstore transactional sales dataset (cleaned and standardized)

Final analytical table schema:

- order_id
- order_date
- ship_date
- customer_name
- segment
- region
- product_name
- category
- sub_category
- quantity
- revenue
- discount
- profit

The raw dataset was first ingested into a staging table and then transformed into a clean analytical table for querying.

---

## 🔧 Tools & Technologies

- **SQL:** MySQL Workbench (data ingestion, transformation, KPI queries)
- **Python:** Pandas, NumPy, Matplotlib (EDA and visualization)
- **Jupyter Notebook:** Exploratory analysis and insights
- **Power BI** — interactive dashboard

---

## 🏗️ Project Architecture

The project follows a simple and professional ETL design:

1. **Staging Layer (`sales_raw`)**
   - Raw CSV ingested as-is
   - Preserves original schema and data types

2. **Analytical Layer (`sales`)**
   - Clean schema created for analysis
   - Required columns only

3. **Transformation Step**
   - Data inserted from `sales_raw` into `sales`
   - Column mapping and schema alignment

4. **Analysis Layer**
   - KPI computation
   - Aggregations by time, product, region, and segment

---

## 📊 Core KPIs

The following KPIs are computed in SQL:

- Total Revenue
- Total Orders
- Average Order Value (AOV)
- Monthly Revenue Trend
- Revenue by Product
- Revenue and Profit by Region
- Revenue and Profit by Segment

---

## 📈 Key Analyses

### 1. Monthly Revenue Trend

- Aggregated revenue by Year-Month
- Identifies seasonality and growth/decline periods

### 2. Product Performance

- Top 10 products by revenue
- Highlights key revenue drivers and high-volume products

### 3. Regional Performance

- Revenue and profit by region
- Identifies underperforming geographies

### 4. Customer Segment Analysis

- Revenue and profit by segment
- Profit margin comparison across segments

### 5. Discount Impact Analysis

- Discount buckets:
  - No Discount
  - Low Discount (0–10%)
  - Medium Discount (10–30%)
  - High Discount (>30%)

- Measures impact of discounting on profit and revenue

### 6. Revenue Concentration Risk

- Top 10 customers by revenue
- Share of top 10 customers in total revenue

---

## 💡 Key Business Insights

- Sales revenue is highly concentrated among a small subset of top-performing products, indicating dependency on a limited product portfolio.
- Regional performance is uneven, with some regions generating lower revenue and profitability compared to others, highlighting potential territory-level inefficiencies.
- Higher discount bands are associated with a sharp decline in average profit, suggesting that aggressive discounting negatively impacts margin.
- Monthly revenue trends exhibit clear seasonality, with identifiable peaks and troughs that can inform demand planning and forecasting.
- Customer segments differ meaningfully in profitability, indicating opportunities to prioritize higher-margin segments in sales and pricing strategies.

---

## 📊 Dashboard

An interactive sales performance dashboard will be built to provide an executive overview and drill-down analysis.

**Planned Dashboard Components**

- KPI Cards:
  - Total Revenue
  - Total Orders
  - Average Order Value
  - Total Profit
  - Profit Margin

- Core Visuals:
  - Monthly Revenue Trend
  - Revenue by Region
  - Revenue by Product
  - Profit by Segment

- Filters (Slicers):
  - Region
  - Segment
  - Category
  - Time (Year-Month)

The dashboard will enable quick performance monitoring and identification of underperforming areas.

---

## 📦 Project Deliverables

- 📄 `Sales_Performance_Analysis.sql` — End-to-end SQL pipeline (ingestion, ETL, analysis)
- 📓 Jupyter Notebook — Python-based EDA and visual analysis
- 📊 SQL Outputs — KPI and aggregation queries
- 📄 This README — Project documentation

---

## 👩‍💻 Author

**Rachita Kadam**  
Data Analytics Portfolio Project

---

> _This project demonstrates an end-to-end analytics workflow — from raw data ingestion and transformation to business-focused SQL analysis and executive-ready insights._
