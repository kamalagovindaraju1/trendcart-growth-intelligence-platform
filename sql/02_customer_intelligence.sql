/*
===============================================================================
Customer Intelligence Platform

Author: Kamala Govindaraju

Tool:
Google BigQuery

Objective:
Understand customer behaviour using SQL.

Focus Areas:
• Customer Segmentation
• Customer Lifetime Value
• Customer Ranking
• Revenue Analysis
• RFM Analysis

===============================================================================
*/
/*
===============================================================================
Query 1
Business Question:
Which customers generate the highest lifetime revenue?
===============================================================================
*/

SELECT

    c.customer_id,

    SUM(oi.selling_price * oi.quantity) AS customer_lifetime_value

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY
    c.customer_id

ORDER BY
    customer_lifetime_value DESC;
