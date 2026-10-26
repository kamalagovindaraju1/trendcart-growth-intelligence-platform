# TrendCart Growth Intelligence Platform

## Project Summary

The TrendCart Growth Intelligence Platform is an e-commerce analytics portfolio project developed using **Google BigQuery, SQL, Tableau Public, and GitHub**. It analyzes a simulated dataset containing over **55,000 transaction records** to explore revenue trends, customer purchasing behaviour, product performance, and order outcomes.

The project combines SQL-based business analysis with an executive dashboard to demonstrate how data can be used to monitor key performance indicators (KPIs) and support business decision-making.

**Important:** The dataset is simulated. Findings are illustrative and should not be interpreted as verified real-world retail behaviour.

---

## Business Problem

The project explores how an e-commerce business can use analytics to:

- Monitor revenue and order performance.
- Understand customer purchasing behaviour.
- Identify high-performing product categories and products.
- Examine order statuses, including returns and cancellations.
- Support data-informed business recommendations.

TrendCart is a simulated business scenario created for analytical practice, not a verified real retailer.

---

## Objectives

- Analyze monthly revenue trends.
- Calculate revenue, order counts, and average order value (AOV).
- Identify high-performing product categories and brands.
- Analyze revenue by payment method.
- Identify the top 10 products and customers by revenue.
- Examine order statuses and delivered-order performance.
- Build an executive Tableau dashboard.

---

## Dataset

The project uses a simulated e-commerce dataset organized into the following tables:

| Table | Description |
|---|---|
| Customers | Customer information, segments, and state |
| Orders | Order dates, order status, payment method, and customer identifiers |
| Order Items | Product-level selling prices and quantities |
| Products | Product names, categories, and brands |

**Dataset size:** 55,219+ transaction records, as documented for the project.

**Data status:** Simulated data used for portfolio and analytical practice. The original data-generation method has not been independently verified.

### Metric Definitions

- **Gross sales:** Sales calculated across the included order statuses, before excluding returns and cancellations.
- **Delivered-order revenue:** Revenue calculated from orders with `order_status = 'Delivered'`.
- **Delivered orders:** Distinct orders marked as `Delivered`.
- **Delivered average order value (AOV):** Delivered-order revenue divided by the number of distinct delivered orders.

Revenue is calculated using selling price multiplied by quantity. Refunds and partial returns are not deducted unless corresponding refund data and calculation logic are available.

---

## Tools & Technologies

- Google BigQuery
- SQL
- Tableau Public
- GitHub

---

## SQL Analysis

The file `sql/01_revenue_analysis.sql` contains 12 business analysis queries.

### Revenue Analysis

- Monthly delivered revenue
- Revenue by product category
- Revenue by payment method
- Average order value (AOV)
- Revenue by customer segment
- Revenue by brand
- Revenue by state

### Customer Analysis

- Order counts by status
- Monthly delivered-order counts
- Top 10 customers by delivered revenue

### Product Analysis

- Top 10 products by delivered revenue
- Top 10 products by quantity sold

Revenue-related queries filter for `Delivered` orders where appropriate. The order-status analysis includes all statuses to support the examination of returns and cancellations.

The SQL scripts and Tableau dashboard are separate analytical deliverables. Their outputs should not be assumed to match unless their data sources, reporting periods, and metric definitions have been verified.

---

## Dashboard Preview

![TrendCart Growth Intelligence Dashboard](images/dashboard.png)

*Note: The current dashboard screenshot displays gross sales metrics, including approximately ₹358.08M in revenue and 37,698 orders. These are not delivered-order figures. The SQL analysis separately calculates delivered-order metrics, so the figures should not be compared directly without aligning their definitions.*

---

## Tableau Public Dashboard

**[View the interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/kamala.govindaraju/viz/trendcart/Dashboard2)**

*If the dashboard is unavailable, verify the published URL and its public-access settings.*

---

## Key Business Insights

### 1. Order Performance
- **Total orders:** 50,000
- **Delivered orders:** 33,263
- **Delivery rate:** 66.53%
- **Delivered order amount:** 208,525,300.68 in the dataset's recorded currency units

### 2. Order Status Analysis
- **Delivered:** 33,263 orders
- **Returned:** 8,485 orders
- **Cancelled:** 8,252 orders

Returned and cancelled orders represent a substantial share of order volume and warrant further investigation.

### 3. Payment Method Analysis
- Net Banking had the highest observed delivery rate at 66.97%.
- Debit Card had the lowest observed delivery rate at 66.00%.
- The difference was 0.97 percentage points. Further analysis is needed before attributing delivery outcomes to payment method.

### 4. Customer Retention
The initial customer order-frequency query returned 9,620 repeat customers and 313 one-time customers. These counts should be validated before using the repeat-customer rate as a final KPI.

### 5. Product Performance
Product-level and category-level sales analyses are available in `sql/03_product_analysis.sql`. Results should be validated in BigQuery before publishing specific product rankings or category-level claims.

---

## Business Recommendations

- **Review returns and cancellations:** Investigate the reasons for returned and cancelled orders before recommending operational changes.
- **Monitor category performance:** Track Men's Fashion and Women's Fashion as major contributors to delivered revenue.
- **Evaluate retention initiatives:** Explore loyalty campaigns and repeat-purchase incentives, then measure their effectiveness using defined KPIs or controlled experiments.
- **Compare complete reporting periods:** Use full months for trend comparisons and clearly label June 2025 as a partial month.
- **Validate before acting:** Treat patterns in simulated data as analytical exercises, not confirmed evidence of real customer preferences, payment behaviour, or market demand.

---

## Repository Structure

```text

trendcart-growth-intelligence-platform/
├── dashboards/
├── data/
├── images/
│   ├── dashboard.png
│   └── README.md
├── sql/
│   ├── 01_revenue_analysis.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_product_analysis.sql
│   └── 04_growth_kpis.sql
├── .gitignore
├── LICENSE
└── README.md


*This structure reflects the documented project layout. Verify that each listed file exists in the repository before treating the tree as a complete inventory.*

---

## Dataset Disclaimer

This project uses synthetic e-commerce data created for educational and portfolio demonstration purposes. The dataset does not represent actual customer transactions or the performance of a real business. Business insights are illustrative and are intended to demonstrate SQL-based analysis, KPI development, and growth analytics techniques.
## Author

**Kamala Govindaraju**

Growth Analytics | SQL | Google BigQuery | Tableau Public | Marketing Analytics

- **GitHub:** [View my projects](https://github.com/kamalagovindaraju1)
- **LinkedIn:** [Connect with me](https://www.linkedin.com/in/kamalagovindaraju/)
- **Substack:** [Read my case studies](https://kamalagovindaraju.substack.com/)
- **Tableau Public:** [Explore my dashboards](https://public.tableau.com/app/profile/kamala.govindaraju)
