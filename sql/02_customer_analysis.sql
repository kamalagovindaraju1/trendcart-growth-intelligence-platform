
-- TrendCart Growth Intelligence Platform
-- Customer retention and repeat-purchase analysis
-- Tool: Google BigQuery

-- Query 1: Customer order frequency
WITH customer_orders AS (
  SELECT
    customer_id,
    COUNT(*) AS order_count
  FROM `growth-analytics-kamala.growth_analytics.Orders`
  GROUP BY customer_id
)

SELECT
  CASE
    WHEN order_count = 1 THEN 'One-time customer'
    ELSE 'Repeat customer'
  END AS customer_type,
  COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_type
ORDER BY customer_count DESC;

-- Query 2: Repeat-customer rate
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
