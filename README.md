# 📊 Customer & Product Analytics Report

## Overview
This project explores and analyzes key customer and product behaviors using SQL queries. The results aim to help business decision-making through segmentation, performance evaluation, and KPI development.

---

## 🔍 Roadmap

![alt text](<images/Project Roadmap.png>)



### 🧭 Exploratory Data Analysis (EDA)
1. **Database Exploration** – Overview of tables and structure.
[Script](scripts/1_database_exploration.sql)
2. **Dimensions Exploration** – Review of dimensions like customer, product, and date.
3. **Date Exploration** – Understanding the range and granularity of dates.
4. **Measures Exploration** – Review of core metrics such as sales, quantity, and orders.
5. **Magnitude** – Evaluating the total size and impact of sales.
6. **Ranking** – Identifying top customers and top products.

### 📈 Advanced Analytics
7. **Change Over Time** – Analyze sales trends across months/years.
8. **Cumulative Analysis** – Cumulative sales and orders per segment.
9. **Performance Analysis** – Identify high and low performers among customers and products.
10. **Part to Whole** – Understand customer/product contributions to overall performance.
11. **Data Segmentation** – Grouping by revenue, frequency, recency, and more.
12. **Reporting** – Consolidated views with metrics and KPIs.

---

## 📋 Customer Report

**Purpose**:  
Consolidates key customer metrics and behaviors for business insight.

**Highlights**:
1. Gathers essential fields such as names, ages, and transaction details.
2. Segments customers into categories (VIP, Regular, New) and age groups.
3. Aggregates customer-level metrics:
   - Total orders  
   - Total sales  
   - Total quantity purchased  
   - Total products  
   - Lifespan (in months)
4. Calculates valuable KPIs:
   - Recency (months since last order)  
   - Average Order Value (AOV)  
   - Average Monthly Spend

🖼️ *[Optional]*: Includes screenshots of key result tables for reference.

---

## 📦 Product Report

**Purpose**:  
Consolidates key product metrics and performance indicators.

**Highlights**:
1. Gathers essential fields such as product name, category, subcategory, and cost.
2. Segments products by revenue to identify:
   - High-Performers  
   - Mid-Range  
   - Low-Performers
3. Aggregates product-level metrics:
   - Total orders  
   - Total sales  
   - Total quantity sold  
   - Total unique customers  
   - Lifespan (in months)
4. Calculates valuable KPIs:
   - Recency (months since last sale)  
   - Average Order Revenue (AOR)  
   - Average Monthly Revenue

🖼️ *[Optional]*: Includes screenshots of aggregated product metrics and performance segments.

---

## ✅ Technologies Used
- phpMyAdmin – For database exploration and SQL execution
- MySQL – As the relational database system
- Markdown – To document and present the project
- Excel (for tabular exports)



---

## ✍️ Author
Donají Ramos Nuñez  
donajiramosn@gmail.com

