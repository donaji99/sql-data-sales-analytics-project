-- ============================================================================
-- Análisis de Segmentación de Datos - Versión MySQL
-- Objetivos:
--     1. Agrupar productos por rangos de costo.
--     2. Segmentar clientes según su historial de compra y gasto total.
-- ============================================================================


-- ============================================================================
-- 1. Segmentación de productos por rangos de costo
-- ============================================================================

WITH product_segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 501 AND 1000 THEN '501-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold_dim_products
)

SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;


-- ============================================================================
-- 2. Segmentación de clientes por historial y gasto
-- ============================================================================

WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(f.order_date) AS first_order,
        MAX(f.order_date) AS last_order,
        TIMESTAMPDIFF(MONTH, MIN(f.order_date), MAX(f.order_date)) AS lifespan_months
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_customers c
        ON f.customer_key = c.customer_key
    WHERE f.order_date IS NOT NULL
    GROUP BY c.customer_key
)

SELECT 
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN lifespan_months >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan_months >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;
