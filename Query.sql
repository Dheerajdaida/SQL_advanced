-- Advanced SQL Queries Demonstrating Complex Concepts

-- 1. Rank customers by their total sales, showing their sales and rank
SELECT 
    customer_id,
    SUM(sales_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM sales
GROUP BY customer_id
ORDER BY sales_rank;

-- 2. Find customers whose total sales are above the average sales
WITH customer_sales AS (
    SELECT customer_id, SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY customer_id
),
average_sales AS (
    SELECT AVG(total_sales) AS avg_sales FROM customer_sales
)
SELECT cs.customer_id, cs.total_sales
FROM customer_sales cs, average_sales a
WHERE cs.total_sales > a.avg_sales
ORDER BY cs.total_sales DESC;

-- 3. Calculate cumulative sales amount ordered by date (running total)
SELECT 
    order_date,
    SUM(sales_amount) AS daily_sales,
    SUM(SUM(sales_amount)) OVER (ORDER BY order_date) AS running_total
FROM sales
GROUP BY order_date
ORDER BY order_date;

-- 4. Find customers who bought every product in the 'Electronics' category
SELECT customer_id
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY customer_id
HAVING COUNT(DISTINCT p.product_id) = (
    SELECT COUNT(*) FROM products WHERE category = 'Electronics'
);

-- 5. Show top 3 products by sales amount in each category
SELECT category, product_id, total_sales
FROM (
    SELECT 
        p.category,
        s.product_id,
        SUM(s.sales_amount) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(s.sales_amount) DESC) AS rank
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category, s.product_id
) ranked_sales
WHERE rank <= 3
ORDER BY category, total_sales DESC;
