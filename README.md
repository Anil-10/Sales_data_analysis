# Retail Sales Analysis (SQL Project)

A beginner-to-intermediate SQL project analyzing a retail sales dataset using MySQL. The project covers database/table creation, data cleaning, and a series of business-driven queries — from simple filters to window functions.

## Project Overview

**Database:** `sql_project_p1`
**Table:** `retails_sales`

The dataset contains individual retail transactions, including customer demographics, product category, quantity sold, pricing, and total sale value.

## Table Schema

| Column | Type | Description |
|---|---|---|
| `transactions_id` | INT (Primary Key) | Unique transaction identifier |
| `sale_date` | DATE | Date of the sale |
| `sale_time` | TIME | Time of the sale |
| `customer_id` | INT | Unique customer identifier |
| `gender` | VARCHAR(10) | Customer gender |
| `age` | INT | Customer age |
| `category` | VARCHAR(20) | Product category (e.g., Clothing, Beauty, Electronics) |
| `quantiy` | INT | Quantity of items purchased *(note: retained as originally spelled)* |
| `price_per_unit` | FLOAT | Price per unit sold |
| `cogs` | INT | Cost of goods sold |
| `total_sale` | INT | Total value of the transaction |

## Data Cleaning

Before analysis, the dataset was checked for and cleaned of null values across all critical columns (`sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantiy`, `price_per_unit`, `cogs`, `total_sale`).

```sql
DELETE FROM retails_sales 
WHERE total_sale IS NULL OR sale_date IS NULL OR sale_time IS NULL 
OR customer_id IS NULL OR gender IS NULL OR age IS NULL 
OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL 
OR cogs IS NULL OR total_sale IS NULL;
```

## Business Questions Answered

1. **Total number of sales** in the dataset.
2. **Total number of unique customers.**
3. **Number of unique product categories.**
4. Retrieve all sales made **after a specific date**.
5. Retrieve **Clothing** transactions with **quantity > 3** during **November 2022**.
6. Calculate **total sales for each category**.
7. Find the **average age of customers** who purchased from the **Beauty** category.
8. Find all transactions where **total sale > 1000**.
9. Find the **total number of transactions per gender, per category**.
10. Calculate the **average sale per month** and identify the **best-selling month of each year** (using a window function).
11. Find the **top 5 customers** by total spending.
12. Find the **number of unique customers per category**.
13. Categorize sales into **shifts** (Morning / Afternoon / Evening) based on the hour of sale.

## Key SQL Concepts Used

- `CREATE DATABASE` / `CREATE TABLE`
- Data cleaning with `DELETE` and multi-column `NULL` checks
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- `GROUP BY` (single and multiple columns)
- `ORDER BY` and `LIMIT` for top-N queries
- Date/time functions: `YEAR()`, `MONTH()`, `EXTRACT()`, `DATE_FORMAT()`
- Window functions: `RANK() OVER (PARTITION BY ... ORDER BY ...)`
- Conditional logic with `CASE WHEN`
- Subqueries

## How to Run

1. Open the `.sql` file in MySQL Workbench (or any MySQL client).
2. Run the `CREATE DATABASE` and `CREATE TABLE` statements first.
3. Import your transaction data into the `retails_sales` table (via the Table Data Import Wizard or `LOAD DATA INFILE`).
4. Run the data cleaning step to remove incomplete rows.
5. Run each analysis query individually to explore the results.

## Notes

- The column `quantiy` is a typo carried over from the original table creation and intentionally left as-is to match the working dataset. It can be renamed with:
  ```sql
  ALTER TABLE retails_sales RENAME COLUMN quantiy TO quantity;
  ```
