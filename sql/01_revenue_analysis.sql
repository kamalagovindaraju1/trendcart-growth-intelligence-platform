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
/*
===============================================================================
Query 4
Business Question:
What is the Average Order Value (AOV)?
===============================================================================
*/

SELECT
    SUM(oi.selling_price * oi.quantity) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.selling_price * oi.quantity) / COUNT(DISTINCT o.order_id) AS average_order_value

FROM `growth-analytics-kamala.growth_analytics.orders` o

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id;
/*
===============================================================================
Query 5
Business Question:
How many orders are in each order status?
===============================================================================
*/

SELECT
    o.order_status,
    COUNT(o.order_id) AS total_orders

FROM `growth-analytics-kamala.growth_analytics.orders` o

GROUP BY
    o.order_status

ORDER BY
    total_orders DESC;
/*
===============================================================================
Query 6
Business Question:
How many orders were placed each month?
===============================================================================
*/

SELECT
    FORMAT_DATE('%Y-%m', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders

FROM `growth-analytics-kamala.growth_analytics.orders` o

GROUP BY
    month

ORDER BY
    month;
/*
===============================================================================
Query 7
Business Question:
Which customer segment generates the highest revenue?
===============================================================================
*/

SELECT

    c.customer_segment,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY
    c.customer_segment

ORDER BY
    total_revenue DESC;
/*
===============================================================================
Query 8
Business Question:
Which are the top 10 products by revenue?
===============================================================================
*/

SELECT

    p.product_name,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.products` p

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON p.product_id = oi.product_id

GROUP BY
    p.product_name

ORDER BY
    total_revenue DESC

LIMIT 10;
/*
===============================================================================
Query 9
Business Question:
Who are the top 10 customers by revenue?
===============================================================================
*/

SELECT

    c.customer_id,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY
    c.customer_id

ORDER BY
    total_revenue DESC

LIMIT 10;
/*
===============================================================================
Query 10
Business Question:
Which brands generate the highest revenue?
===============================================================================
*/

SELECT

    p.brand,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.products` p

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON p.product_id = oi.product_id

GROUP BY
    p.brand

ORDER BY
    total_revenue DESC;
/*
===============================================================================
Query 11
Business Question:
Which states generate the highest revenue?
===============================================================================
*/

SELECT

    c.state,

    SUM(oi.selling_price * oi.quantity) AS total_revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY
    c.state

ORDER BY
    total_revenue DESC;
/*
===============================================================================
Query 12
Business Question:
Which products sold the highest quantity?
===============================================================================
*/

SELECT

    p.product_name,

    SUM(oi.quantity) AS total_quantity_sold

FROM `growth-analytics-kamala.growth_analytics.products` p

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON p.product_id = oi.product_id

GROUP BY
    p.product_name

ORDER BY
    total_quantity_sold DESC

LIMIT 10;
Complete TrendCart SQL Business Analysis
