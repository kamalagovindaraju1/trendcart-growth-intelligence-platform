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
/*
===============================================================================
Query 2
Business Question:
Rank customers based on lifetime revenue.
===============================================================================
*/

WITH customer_revenue AS (

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

)

SELECT

    customer_id,

    total_revenue,

    RANK() OVER (ORDER BY total_revenue DESC) AS customer_rank

FROM customer_revenue

ORDER BY customer_rank

LIMIT 10;
/*
===============================================================================
Query 3
Business Question:
Which customers placed the highest number of orders?
===============================================================================
*/

SELECT

    c.customer_id,

    COUNT(DISTINCT o.order_id) AS total_orders

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id

ORDER BY
    total_orders DESC;
    /*
===============================================================================
Query 4
Business Question:
Show the Top 3 customers in each state based on lifetime revenue.
===============================================================================
*/

WITH customer_revenue AS (

SELECT

    c.customer_id,

    c.state,

    SUM(oi.selling_price * oi.quantity) AS revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id,

    c.state

),

ranked_customers AS (

SELECT

    customer_id,

    state,

    revenue,

    ROW_NUMBER() OVER(

        PARTITION BY state

        ORDER BY revenue DESC

    ) AS customer_rank

FROM customer_revenue

)

SELECT *

FROM ranked_customers

WHERE customer_rank <= 3

ORDER BY state, customer_rank;
/*
===============================================================================
Query 5
Business Question:
Show the Top 5 customers in each state based on revenue.
Customers with the same revenue should receive the same rank.
===============================================================================
*/

WITH customer_revenue AS (

SELECT

    c.customer_id,

    c.state,

    SUM(oi.selling_price * oi.quantity) AS revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id,

    c.state

),

ranked_customers AS (

SELECT

    customer_id,

    state,

    revenue,

    RANK() OVER (

        PARTITION BY state

        ORDER BY revenue DESC

    ) AS customer_rank

FROM customer_revenue

)

SELECT *

FROM ranked_customers

WHERE customer_rank <= 5

ORDER BY state, customer_rank;
/*
===============================================================================
Query 6
Business Question:
Show the Top 5 customers in each state based on lifetime revenue.
Customers with the same revenue should receive the same rank,
without skipping rank numbers.
===============================================================================
*/

WITH customer_revenue AS (

SELECT

    c.customer_id,

    c.state,

    SUM(oi.selling_price * oi.quantity) AS revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id,

    c.state

),

ranked_customers AS (

SELECT

    customer_id,

    state,

    revenue,

    DENSE_RANK() OVER (

        PARTITION BY state

        ORDER BY revenue DESC

    ) AS customer_rank

FROM customer_revenue

)

SELECT *

FROM ranked_customers

WHERE customer_rank <= 5

ORDER BY state, customer_rank;
/*
===============================================================================
Query 7
Business Question:
Compare each customer's current order value with their previous order value.
===============================================================================
*/

WITH order_values AS (

SELECT

    c.customer_id,

    o.order_id,

    o.order_date,

    SUM(oi.selling_price * oi.quantity) AS order_value

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id,

    o.order_id,

    o.order_date

)

SELECT

    customer_id,

    order_id,

    order_date,

    order_value,

    LAG(order_value) OVER (

        PARTITION BY customer_id

        ORDER BY order_date

    ) AS previous_order_value

FROM order_values

ORDER BY customer_id, order_date;
/*
===============================================================================
Query 8
Business Question:
Compare each customer's current order value with their next order value.
===============================================================================
*/

WITH order_values AS (

SELECT

    c.customer_id,

    o.order_id,

    o.order_date,

    SUM(oi.selling_price * oi.quantity) AS order_value

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id,

    o.order_id,

    o.order_date

)

SELECT

    customer_id,

    order_id,

    order_date,

    order_value,

    LEAD(order_value) OVER (

        PARTITION BY customer_id

        ORDER BY order_date

    ) AS next_order_value

FROM order_values

ORDER BY customer_id, order_date;
/*
===============================================================================
Query 9
Business Question:
Segment customers into VIP, High Value, Medium Value,
and Low Value based on lifetime revenue.
===============================================================================
*/

WITH customer_revenue AS (

SELECT

    c.customer_id,

    SUM(oi.selling_price * oi.quantity) AS lifetime_revenue

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id

GROUP BY

    c.customer_id

)

SELECT

    customer_id,

    lifetime_revenue,

    CASE

        WHEN lifetime_revenue >= 100000 THEN 'VIP'

        WHEN lifetime_revenue >= 75000 THEN 'High Value'

        WHEN lifetime_revenue >= 30000 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS customer_segment

FROM customer_revenue

ORDER BY lifetime_revenue DESC;
/*
===============================================================================
Query 10
Business Question:
Generate an executive KPI summary for the Customer Intelligence Dashboard.
===============================================================================
*/

SELECT

    COUNT(DISTINCT c.customer_id) AS total_customers,

    COUNT(DISTINCT o.order_id) AS total_orders,

    SUM(oi.selling_price * oi.quantity) AS total_revenue,

    ROUND(
        SUM(oi.selling_price * oi.quantity)
        / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value

FROM `growth-analytics-kamala.growth_analytics.customers` c

JOIN `growth-analytics-kamala.growth_analytics.orders` o
ON c.customer_id = o.customer_id

JOIN `growth-analytics-kamala.growth_analytics.order_items` oi
ON o.order_id = oi.order_id;
