-- ============================================================================
-- Performance Analysis (Year-over-Year, Month-over-Month) - MySQL Version
-- Purpose:
--     - To measure the performance of products over time.
--     - For benchmarking and identifying high-performing products.
--     - To track yearly trends and growth.
-- ============================================================================

WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)

SELECT
    order_year,
    product_name,
    current_sales,
    
    -- Promedio de ventas por producto
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    
    -- Diferencia con el promedio
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    
    -- Clasificación según promedio
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    
    -- Análisis interanual
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    
    -- Clasificación interanual
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change

FROM yearly_product_sales
ORDER BY product_name, order_year;
