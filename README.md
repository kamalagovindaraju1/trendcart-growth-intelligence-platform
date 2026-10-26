# TrendCart Growth Intelligence Platform

## Project Summary

The TrendCart Growth Intelligence Platform is an end-to-end e-commerce analytics project developed using **Google BigQuery, SQL, Tableau Public, and GitHub**. The project analyzes over **55,000 customer transactions** to uncover revenue trends, customer purchasing behavior, product performance, and payment preferences. An executive dashboard was created to help business stakeholders monitor key performance indicators (KPIs) and support data-driven decision-making.

---

## Business Problem

TrendCart, a growing e-commerce retailer, has experienced fluctuations in revenue despite increasing customer activity. The business requires a centralized analytics solution to:

- Monitor revenue performance
- Understand customer purchasing behavior
- Identify high-performing products and categories
- Analyze payment preferences
- Support executive decision-making

---

## Objectives

- Analyze monthly revenue trends
- Calculate Total Revenue, Total Orders, Total Customers, and Average Order Value (AOV)
- Identify top-performing product categories
- Analyze payment method performance
- Identify the top 10 products
- Identify the top 10 customers
- Build an executive Tableau dashboard

---

## Dataset

The project uses a simulated e-commerce dataset containing:

| Table | Description |
|-------|-------------|
| Customers | Customer information |
| Orders | Order details |
| Order Items | Product-level sales |
| Products | Product catalog |

**Dataset Size:** 55,219+ transactions

---

## Tools & Technologies

- Google BigQuery
- SQL
- Tableau Public
- GitHub

---

## SQL Analysis

The following business questions were solved using SQL:

### Revenue Analysis
- Monthly Revenue Trend
- Revenue by Category
- Revenue by Payment Method

### Customer Analysis
- Total Customers
- Average Order Value (AOV)
- Top 10 Customers

### Product Analysis
- Top 10 Products
- Revenue by Product Category

---

## Dashboard Preview

<img width="1512" height="982" alt="Screenshot 2026-07-10 at 12 50 39 PM" src="https://github.com/user-attachments/assets/e28a0cfa-4456-4475-8191-e9a6613ebcc2" />


```markdown
![TrendCart Dashboard](images/dashboard.png)
```

---

## Tableau Public Dashboard

**Interactive Dashboard:**

```
https://public.tableau.com/app/profile/kamala.govindaraju/viz/trendcart/Dashboard2
```

---

## Key Business Insights

*The following findings are based on the TrendCart simulated dataset. Revenue figures refer to delivered orders unless otherwise specified.*

1. **Returns and cancellations:** The dataset reports 17.0% returned orders and 16.5% cancelled orders. These statuses represent a substantial share of recorded orders. Investigate return reasons and cancellation causes before recommending operational changes.

2. **Category contribution:** Men's Fashion contributes approximately 37% and Women's Fashion approximately 32% of delivered revenue. Together, these categories account for around 69% of delivered revenue, making them important categories to monitor.

3. **Repeat purchasing:** Approximately 78% of customers placed more than one order, averaging 2.7 orders per customer. This suggests repeat purchasing is worth examining further, although the simulated data cannot establish real-world retention behaviour.

4. **Revenue concentration:** The top 20% of customers account for approximately 41% of delivered revenue. Revenue is not overwhelmingly concentrated among a small customer group, so loyalty strategies should be evaluated rather than assuming a VIP-only approach is sufficient.

5. **Order value and trends:** Delivered average order value is approximately ₹9,485. Monthly revenue should be compared across complete months; June 2025 is partial because the dataset ends on June 19, 2025.

**Data limitation:** TrendCart uses simulated sales data. Patterns in payment methods, customer segments, returns, and purchasing behaviour are illustrative and should not be interpreted as evidence about actual customers or the wider retail market.
---

## Business Recommendations

- Increase marketing investment in high-performing product categories.
- Launch customer loyalty campaigns for top customers.
- Optimize low-performing product categories.
- Monitor monthly revenue trends to identify seasonal patterns.
- Continue tracking payment preferences to improve customer experience.

---

## Repository Structure

```
trendcart-growth-intelligence-platform/
│
├── sql/
│   ├── 01_revenue_analysis.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_product_analysis.sql
│
├── dashboards/
│   └── trendcart_dashboard.twb
│
├── images/
│   └── dashboard.png
│
├── data/
│   └── README.md
│
└── README.md
```

---

## Author

**Kamala Govindaraju**

Growth Analytics | SQL | Google BigQuery | Tableau Public | Marketing Analytics
