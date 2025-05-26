# 📊 Customer & Product Analytics Report

## Overview
This project explores and analyzes key customer and product behaviors using SQL queries. The results aim to help business decision-making through segmentation, performance evaluation, and KPI development.

---

## 🔍 Roadmap

![alt text](<images/Project Roadmap.png>)



### 🧭 Exploratory Data Analysis (EDA)
1. **Database Exploration** – Overview of tables and structure.  
[Script](scripts/1_database_exploration.sql)
![Dimensions](images/1..png)

2. **Dimensions Exploration** – Review of dimensions like customer, product, and date.  
[Script](scripts/2_dimensions_exploration.sql)  
![Country](images/2.Country.png)

3. **Date Exploration** – Understanding the range and granularity of dates.  
[Script](scripts/3_date_range_exploration.sql)  

![Oldest](images/3.oldest.png)  
![Youngest](images/3.youngest.png)

4. **Measures Exploration** – Review of core metrics such as sales, quantity, and orders.  
[Script](scripts/4_measures_exploration.sql)
![Measures](images/4.Measures.png)  

5. **Magnitude** – Evaluating the total size and impact of sales.  
[Script](scripts/5_magnitude_analysis.sql)
![Country](images/5..png)  
![Gender](images/5.gender.png)  
![category](images/5.3.png)    
![Revenue](images/5.Revenue.png)  
![Revenue by customer](<images/5.Revenue by customer.png>)  
![Sales by country](<images/5.sales by country.png>)  
6. **Ranking** – Identifying top customers and top products.  
[Script](scripts/6_ranking_analysis.sql)
- top_5_products_by_revenue  
![top_5_products_by_revenue](<images/6.2 Revenue by product ranking.png>)  
- Worst performing sales  
![Worst_performing_sales](<images/6.3 worst performing sales.png>)  
- Top revenue by customes  
![Top revenue by customers](<images/6.4 top revenue for customers.png>) 
- The 3 customers with the fewest orders placed   
![The 3 customers with the fewest orders placed](<images/6.5 fewest.png>)  


### 📈 Advanced Analytics
7. **Change Over Time** – Analyze sales trends across months/years.  
[Script](scripts/7_change_over_time_analysis.sql)  
![Change over time](images/7..png)

8. **Cumulative Analysis** – Cumulative sales and orders per segment.  
[Script](scripts/8_cumulative_analysis.sql)  
![alt text](images/8..png)

9. **Performance Analysis** – Identify high and low performers among customers and products.  
[Script](scripts/9_performance_analysis.sql)  
![  ](<images/9.Performance Analysis.png>)  

10. **Part to Whole** – Understand customer/product contributions to overall performance.  
[Script](scripts/10_data_segmentation.sql)
![alt text](images/10.1.png)   
![alt text](images/10.2.png)

11. **Data Segmentation** – Grouping by revenue, frequency, recency, and more.  
[Script](scripts/11_part_to_whole_analysis.sql)  
![alt text](<images/11.Part to whole Analysis.png>)

12. **Reporting** – Consolidated views with metrics and KPIs.  
[Script](scripts/12_report_customers.sql)
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

[Script](scripts/12_report_customers.sql)  
🖼️ *[![Optional](<images/12.Customers Report.png>)]*: Includes screenshots of key result tables for reference.
[Report](gold_report_customers.csv)
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
[Script](scripts/13_report_products.sql)  
  
🖼️ ![Product Report](images/product_report.png)
[Report](gold_report_products.csv)

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

