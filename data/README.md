# Data Documentation

## Dataset Overview

TrendCart uses a simulated e-commerce sales dataset for SQL and business analytics practice. The data represents illustrative customer transactions and does not describe verified real-world retail behaviour.

## Data Contents

The project uses related tables for:

- **Orders:** order identifiers, customer identifiers, order dates, order status, and payment method.
- **Order items:** product identifiers, selling price, and quantity.
- **Customers:** customer identifiers, customer segments, and state.
- **Products:** product identifiers, product names, categories, and brands.

## Data Source and Limitations

The dataset is simulated. The original generator or source attribution should be documented here if known; it has not been independently verified.

Revenue calculations in the SQL analysis use selling price multiplied by quantity and filter to delivered orders where applicable. These calculations do not necessarily account for refunds or partial returns.

Do not interpret the dataset's patterns as evidence of actual customer preferences or market behaviour.
