# SQL_advanced
# Advanced SQL Sample Queries

This repository contains a set of advanced SQL queries demonstrating proficiency in complex data analysis techniques using SQL.

## What’s Included

1. **Ranking customers by total sales**  
   Uses window functions (`RANK() OVER`) to rank customers based on their sales performance.

2. **Identifying customers with above-average sales**  
   Utilizes Common Table Expressions (CTEs) to calculate average sales and filter customers exceeding that average.

3. **Calculating running totals of sales by date**  
   Demonstrates the use of window functions to compute cumulative sums ordered by date.

4. **Finding customers who purchased all products in a category**  
   Applies aggregation and subqueries to identify customers who bought every product in a specific category.

5. **Listing top 3 products by sales within each category**  
   Uses window functions and partitioning (`ROW_NUMBER() OVER (PARTITION BY ...)`) to rank products within categories.

---

## How to Use

- The SQL queries are written for standard SQL and may require minor adjustments depending on your database system (e.g., PostgreSQL, MySQL, SQL Server).
- Each query is commented to explain its purpose and logic.
- You can run these queries on sample datasets with tables like `sales`, `customers`, `products`, and `orders`.

---

## Contact

Feel free to reach out if you have any questions or want to see additional examples!

---

*Created by [Your Name]*  
*GitHub: [https://github.com/yourusername](https://github.com/yourusername)*
