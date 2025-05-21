/*
===============================================================================
Change Over Time Analysis (MySQL-compatible)
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: YEAR(), MONTH(), DATE_FORMAT()
    - Aggregate Functions: SUM(), COUNT()
===============================================================================
*/

-- Analyse sales performance over time (by year and month)
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);


-- Truncating date to month (no DATETRUNC in MySQL, we simulate it with DATE_FORMAT or LAST_DAY)
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

-- Using FORMAT-like logic for 'yyyy-MMM'
SELECT
    DATE_FORMAT(order_date, '%Y-%b') AS order_period,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_period
ORDER BY STR_TO_DATE(order_period, '%Y-%b');

