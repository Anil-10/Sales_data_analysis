# 🛍️ Retail Sales Analysis — SQL Project

A SQL-based exploratory data analysis (EDA) project on a retail sales dataset, covering database design, data cleaning, and business-driven analysis using MySQL.

## 📌 Project Overview

This project analyzes transaction-level retail sales data to uncover patterns in customer behavior, category performance, and sales trends over time. It demonstrates core SQL skills used in real-world data analysis: database creation, data cleaning, aggregation, window functions, and conditional logic.

**Database:** `sql_project_p1`
**Table:** `retails_sales`
**Tool:** MySQL Workbench
**Dataset Source:** Kaggle

---

## 🎯 Objectives

- Set up a retail sales database and clean it for analysis.
- Explore customer demographics and purchasing behavior.
- Identify top-performing categories, customers, and time periods.
- Practice core-to-advanced SQL techniques (aggregation, window functions, `CASE` logic).

---

## 🗂️ Dataset Schema

| Column | Type | Description |
|---|---|---|
| `transactions_id` | INT (PK) | Unique transaction identifier |
| `sale_date` | DATE | Date of the sale |
| `sale_time` | TIME | Time of the sale |
| `customer_id` | INT | Unique customer identifier |
| `gender` | VARCHAR(10) | Customer gender |
| `age` | INT | Customer age |
| `category` | VARCHAR(20) | Product category (Clothing, Beauty, Electronics) |
| `quantiy` | INT | Quantity of items purchased |
| `price_per_unit` | FLOAT | Price per unit sold |
| `cogs` | INT | Cost of goods sold |
| `total_sale` | INT | Total value of the transaction |

> **Note:** The `quantiy` column name is a typo retained from the original schema to match the working dataset. It can be corrected with:
> ```sql
> ALTER TABLE retails_sales RENAME COLUMN quantiy TO quantity;
> ```

---

## 🧹 Data Cleaning

Before analysis, all rows with missing/null values in any critical column were identified and removed to ensure accurate results:

```sql
DELETE FROM retails_sales 
WHERE total_sale IS NULL OR sale_date IS NULL OR sale_time IS NULL 
OR customer_id IS NULL OR gender IS NULL OR age IS NULL 
OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL 
OR cogs IS NULL OR total_sale IS NULL;
```

---

## 🔍 Business Questions & Analysis

| # | Question |
|---|---|
| 1 | How many total sales transactions are there? |
| 2 | How many unique customers made purchases? |
| 3 | How many unique product categories are there? |
| 4 | Retrieve all sales made after a specific date. |
| 5 | Find Clothing transactions with quantity > 3 in November 2022. |
| 6 | Calculate total sales for each category. |
| 7 | Find the average age of customers who purchased Beauty products. |
| 8 | Find all transactions where total sale exceeds 1000. |
| 9 | Find total transactions per gender, per category. |
| 10 | Find the average sale per month and the best-selling month of each year. |
| 11 | Find the top 5 customers by total spending. |
| 12 | Find the number of unique customers per category. |
| 13 | Categorize each transaction into a sales shift (Morning / Afternoon / Evening). |

Full queries are available in [`sql_project.sql`](./sql_project.sql).

---

## 📊 Key Findings

> Fill in each `[ ]` below with your actual query results, then delete this note.

- **Total Transactions:** `[ ]`
- **Unique Customers:** `[ ]`
- **Unique Categories:** `[ ]`
- **Top Category by Revenue:** `[ ]` — Total sales: `[ ]`
- **Top Customer by Spend:** Customer ID `[ ]` — Total spend: `[ ]`
- **Best-Selling Month (per year):** `[ ]`
- **Busiest Sales Shift:** `[ ]`

---

## 🛠️ SQL Concepts Used

- `CREATE DATABASE` / `CREATE TABLE`
- Data cleaning with `DELETE` and multi-column `NULL` checks
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `ROUND()`
- `GROUP BY` (single & multi-column)
- `ORDER BY` + `LIMIT` for top-N analysis
- Date/time functions: `YEAR()`, `MONTH()`, `EXTRACT()`, `DATE_FORMAT()`
- Window functions: `RANK() OVER (PARTITION BY ... ORDER BY ...)`
- Conditional logic: `CASE WHEN`
- Subqueries

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
2. Open `sql_project.sql` in MySQL Workbench (or any MySQL client).
3. Run the `CREATE DATABASE` and `CREATE TABLE` statements.
4. Import the dataset into the `retails_sales` table using the Table Data Import Wizard.
5. Run the data cleaning block to remove incomplete records.
6. Execute each analysis query individually to explore the results.

---

## 📈 Future Improvements

- Build a dashboard (Power BI / Tableau / Python) to visualize these findings.
- Automate the data cleaning and reporting pipeline.
- Expand the dataset with more years of data for stronger trend analysis.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
