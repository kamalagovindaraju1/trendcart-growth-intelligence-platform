
-- TrendCart Growth Intelligence Platform
-- Product performance analysis
-- Tool: Google BigQuery

-- Query 1: Sales by product, brand, and category
SELECT
  p.product_id,
  p.product_name,
  p.brand,
  p.category,
  p.subcategory,
  SUM(oi.quantity) AS units_sold,
  ROUND(SUM(oi.quantity * oi.selling_price), 2)
    AS product_sales_amount
FROM `growth-analytics-kamala.growth_analytics.order_items` AS oi
JOIN `growth-analytics-kamala.growth_analytics.products` AS p
  ON oi.product_id = p.product_id
GROUP BY
  p.product_id,
  p.product_name,
  p.brand,
  p.category,
  p.subcategory
ORDER BY product_sales_amount DESC;


-- Query 2: Top 10 products by sales amount
SELECT
  p.product_name,
  p.brand,
  p.category,
  SUM(oi.quantity) AS units_sold,
  ROUND(SUM(oi.quantity * oi.selling_price), 2)
    AS product_sales_amount
FROM `growth-analytics-kamala.growth_analytics.order_items` AS oi
JOIN `growth-analytics-kamala.growth_analytics.products` AS p
  ON oi.product_id = p.product_id
GROUP BY
  p.product_id,
  p.product_name,
  p.brand,
  p.category
ORDER BY product_sales_amount DESC
LIMIT 10;


-- Query 3: Sales summary by category
SELECT
  p.category,
  SUM(oi.quantity) AS units_sold,
  ROUND(SUM(oi.quantity * oi.selling_price), 2)
    AS category_sales_amount,
  COUNT(DISTINCT oi.product_id) AS unique_products_sold
FROM `growth-analytics-kamala.growth_analytics.order_items` AS oi
JOIN `growth-analytics-kamala.growth_analytics.products` AS p
  ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_sales_amount DESC;
