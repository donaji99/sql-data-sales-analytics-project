SELECT 
    y1.order_year,
    y1.product_name,
    y1.current_sales,

    -- Promedio de ventas del producto (AVG)
    (
        SELECT AVG(y2.current_sales)
        FROM (
            SELECT 
                YEAR(f.order_date) AS order_year,
                p.product_name,
                SUM(f.sales_amount) AS current_sales
            FROM gold_fact_sales f
            LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
            WHERE f.order_date IS NOT NULL
            GROUP BY YEAR(f.order_date), p.product_name
        ) AS y2
        WHERE y2.product_name = y1.product_name
    ) AS avg_sales,

    -- Diferencia con el promedio
    y1.current_sales - (
        SELECT AVG(y2.current_sales)
        FROM (
            SELECT 
                YEAR(f.order_date) AS order_year,
                p.product_name,
                SUM(f.sales_amount) AS current_sales
            FROM gold_fact_sales f
            LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
            WHERE f.order_date IS NOT NULL
            GROUP BY YEAR(f.order_date), p.product_name
        ) AS y2
        WHERE y2.product_name = y1.product_name
    ) AS diff_avg,

    -- Clasificación según promedio
    CASE 
        WHEN y1.current_sales > (
            SELECT AVG(y2.current_sales)
            FROM (
                SELECT 
                    YEAR(f.order_date) AS order_year,
                    p.product_name,
                    SUM(f.sales_amount) AS current_sales
                FROM gold_fact_sales f
                LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
                WHERE f.order_date IS NOT NULL
                GROUP BY YEAR(f.order_date), p.product_name
            ) AS y2
            WHERE y2.product_name = y1.product_name
        ) THEN 'Above Avg'
        WHEN y1.current_sales < (
            SELECT AVG(y2.current_sales)
            FROM (
                SELECT 
                    YEAR(f.order_date) AS order_year,
                    p.product_name,
                    SUM(f.sales_amount) AS current_sales
                FROM gold_fact_sales f
                LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
                WHERE f.order_date IS NOT NULL
                GROUP BY YEAR(f.order_date), p.product_name
            ) AS y2
            WHERE y2.product_name = y1.product_name
        ) THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change

FROM (
    SELECT 
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY YEAR(f.order_date), p.product_name
) AS y1
ORDER BY y1.product_name, y1.order_year;