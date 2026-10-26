
/*
===============================================================================
TrendCart Growth Intelligence Platform
Author: Kamala Govindaraju
Tool: Google BigQuery
Dataset: TrendCart Sales Dataset

IMPORTANT:
Revenue metrics below use Delivered orders only unless stated otherwise.
Order-status analysis includes all statuses.
This dataset is simulated; results should not be presented as real market data.
===============================================================================
*/

-- Query 1: Monthly delivered revenue
SELECT
    FORMAT_DATE('%Y-%m', o.order_date) AS month,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.orders` o
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;


-- Query 2: Revenue by product category (delivered orders)
SELECT
    p.category,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.products` p
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON p.product_id = oi.product_id
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY delivered_revenue DESC;


-- Query 3: Revenue by payment method (delivered orders)
SELECT
    o.payment_method,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.orders` o
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.payment_method
ORDER BY delivered_revenue DESC;


-- Query 4: Average order value (delivered orders)
SELECT
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    SAFE_DIVIDE(
        SUM(oi.selling_price * oi.quantity),
        COUNT(DISTINCT o.order_id)
    ) AS delivered_average_order_value
FROM `growth-analytics-kamala.growth_analytics.orders` o
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';


-- Query 5: Order counts by status (all statuses)
SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM `growth-analytics-kamala.growth_analytics.orders` o
GROUP BY o.order_status
ORDER BY total_orders DESC;


-- Query 6: Monthly delivered order counts
SELECT
    FORMAT_DATE('%Y-%m', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS delivered_orders
FROM `growth-analytics-kamala.growth_analytics.orders` o
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;


-- Query 7: Revenue by customer segment (delivered orders)
SELECT
    c.customer_segment,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.customers` c
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON c.customer_id = o.customer_id
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_segment
ORDER BY delivered_revenue DESC;


-- Query 8: Top 10 products by delivered revenue
SELECT
    p.product_name,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.products` p
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON p.product_id = oi.product_id
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY delivered_revenue DESC
LIMIT 10;


-- Query 9: Top 10 customers by delivered revenue
SELECT
    c.customer_id,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.customers` c
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON c.customer_id = o.customer_id
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id
ORDER BY delivered_revenue DESC
LIMIT 10;


-- Query 10: Revenue by brand (delivered orders)
SELECT
    p.brand,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.products` p
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON p.product_id = oi.product_id
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.brand
ORDER BY delivered_revenue DESC;


-- Query 11: Revenue by state (delivered orders)
SELECT
    c.state,
    SUM(oi.selling_price * oi.quantity) AS delivered_revenue
FROM `growth-analytics-kamala.growth_analytics.customers` c
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON c.customer_id = o.customer_id
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.state
ORDER BY delivered_revenue DESC;


-- Query 12: Top 10 products by quantity sold (delivered orders)
SELECT
    p.product_name,
    SUM(oi.quantity) AS delivered_quantity_sold
FROM `growth-analytics-kamala.growth_analytics.products` p
JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
    ON p.product_id = oi.product_id
JOIN `growth-analytics-kamala.growth_analytics.orders` o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY delivered_quantity_sold DESC
LIMIT 10;
