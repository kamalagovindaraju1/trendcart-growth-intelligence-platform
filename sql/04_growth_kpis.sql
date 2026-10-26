
-- TrendCart Growth Intelligence Platform
-- Executive Growth KPI Summary
-- Tool: Google BigQuery

-- KPI 1: Overall order performance
SELECT
  COUNT(*) AS total_orders,
  COUNTIF(order_status = 'Delivered') AS delivered_orders,
  COUNTIF(order_status = 'Cancelled') AS cancelled_orders,
  COUNTIF(order_status = 'Returned') AS returned_orders,
  ROUND(SUM(total_amount), 2) AS all_order_amount,
  ROUND(
    100.0 * COUNTIF(order_status = 'Delivered') / COUNT(*),
    2
  ) AS delivery_rate_pct
FROM `growth-analytics-kamala.growth_analytics.Orders`;


-- KPI 2: Order status breakdown
SELECT
  order_status,
  COUNT(*) AS order_count,
  ROUND(SUM(total_amount), 2) AS order_amount
FROM `growth-analytics-kamala.growth_analytics.Orders`
GROUP BY order_status
ORDER BY order_count DESC;


-- KPI 3: Customer order frequency
WITH customer_orders AS (
  SELECT
    customer_id,
    COUNT(*) AS order_count
  FROM `growth-analytics-kamala.growth_analytics.Orders`
  GROUP BY customer_id
)
SELECT
  COUNT(*) AS total_customers,
  COUNTIF(order_count > 1) AS repeat_customers,
  COUNTIF(order_count = 1) AS one_time_customers,
  ROUND(
    100.0 * COUNTIF(order_count > 1) / COUNT(*),
    2
  ) AS repeat_customer_rate_pct
FROM customer_orders;
