/*
===============================================================================
TrendCart Growth Intelligence Platform
Author: Kamala Govindaraju
Tool: Google BigQuery
Dataset: TrendCart Sales Dataset

Project Objective:
Analyze sales performance, customer behavior, product performance,
and business KPIs using SQL.

===============================================================================
*/
/*
===============================================================================
Query 1
Business Question:
How has monthly revenue changed over time?
===============================================================================
*/

SELECT
    FORMAT_DATE('%Y-%m', o.order_date) AS month,
    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.orders` o

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY month

ORDER BY month;
/*
===============================================================================
Query 2
Business Question:
Which product categories generate the highest revenue?
===============================================================================
*/

SELECT

    p.category,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.products` p

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON p.product_id = oi.product_id

GROUP BY
    p.category

ORDER BY
    total_revenue DESC;
/*
===============================================================================
Query 3
Business Question:
Which payment method generates the highest revenue?
===============================================================================
*/

SELECT

    o.payment_method,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.orders` o

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY
    o.payment_method

ORDER BY
    total_revenue DESC;
