# E-commerce Platform Analytics in SQL

## Objective
This project involves designing and building an e-commerce database from scratch using MySQL. The goal is to analyze sales, customer, and product data to answer critical business questions with advanced SQL, including window functions, CTEs, and stored procedures.

---

## Database Schema (ERD)
The database is structured to capture key e-commerce entities, including customers, products, categories (with sub-categories), and orders.
---

## Technologies Used
* **Database:** MySQL
* **SQL Client:** MySQL Workbench

---

## Key Questions Answered
This analysis answers several key business questions:
* What is the month-over-month sales growth?
* How can we segment customers based on their purchasing behavior (RFM Analysis)?
---

## Code Highlights

### RFM Customer Segmentation
This query uses Common Table Expressions (CTEs) to segment customers into 'High Value', 'At Risk', and 'Regular' based on their Recency, Frequency, and Monetary value.

```sql
WITH CustomerRFM AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        DATEDIFF('2025-07-27', MAX(o.order_date)) AS recency,
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
