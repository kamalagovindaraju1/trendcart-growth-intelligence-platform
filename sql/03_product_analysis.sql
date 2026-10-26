
-- TrendCart Growth Intelligence Platform
-- Product performance analysis
-- Tool: Google BigQuery

-- Query 1: Product quantity and sales amount
SELECT
  product_id,
  SUM(quantity) AS units_sold,
  ROUND(SUM(quantity * selling_price), 2) AS product_sales_amount
FROM `growth-analytics-kamala.growth_analytics.order_items`
GROUP BY product_id
ORDER BY product_sales_amount DESC;


-- Query 2: Top 10 products by sales amount
SELECT
  product_id,
  SUM(quantity) AS units_sold,
  ROUND(SUM(quantity * selling_price), 2) AS product_sales_amount
FROM `growth-analytics-kamala.growth_analytics.order_items`
GROUP BY product_id
ORDER BY product_sales_amount DESC
LIMIT 10;


-- Query 3: Overall product sales summary
SELECT
  COUNT(DISTINCT product_id) AS unique_products,
  SUM(quantity) AS total_units_sold,
  ROUND(SUM(quantity * selling_price), 2) AS total_product_sales_amount
FROM `growth-analytics-kamala.growth_analytics.order_items`;
