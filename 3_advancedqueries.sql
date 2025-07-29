With MonthlySales AS(
Select 
Date_format(o.order_date, '%Y-%m-01') as sales_month,
SUM(oi.quantity * oi.price_per_item) as total_sales
from orders o
join order_items oi on o.order_id= oi.order_id 
where o.status='completed'
Group by sales_month)
Select
sales_month,
total_sales,
LAG(total_sales, 1, 0) OVER(Order by sales_month) as previous_month_sales,
(total_sales -LAG(total_sales,1,0) over (order by sales_month))/ LAG(total_sales, 1, 0) OVER (ORDER BY sales_month) * 100 AS growth_percentage
FROM MonthlySales
order by sales_month;
WITH CustomerRFM AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        DATEDIFF('2025-07-27', MAX(o.order_date)) AS recency, -- Use a fixed current date for consistency
        COUNT(DISTINCT o.order_id) AS frequency,
        SUM(oi.quantity * oi.price_per_item) AS monetary_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT
    *,
    CASE
        WHEN frequency >= 10 AND monetary_value >= 1000 THEN 'High Value Customer'
        WHEN recency > 180 THEN 'At Risk Customer'
        ELSE 'Regular Customer'
    END AS customer_segment
FROM CustomerRFM
ORDER BY monetary_value DESC;