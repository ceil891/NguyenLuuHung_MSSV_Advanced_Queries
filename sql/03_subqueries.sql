-- 9. Khách hàng có tổng giá trị đơn hàng cao nhất
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_total)
    FROM (
        SELECT customer_id, SUM(total_amount) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) t
);

-- 10. Sản phẩm chưa từng được bán
SELECT
    p.product_name
FROM products p
WHERE p.product_id NOT IN (
    SELECT DISTINCT product_id FROM order_items
);

-- 11. Khách hàng có đơn hàng đầu tiên trong tháng hiện tại
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = (
    SELECT MIN(o2.order_date)
    FROM orders o2
    WHERE o2.customer_id = c.customer_id
)
AND DATE_TRUNC('month', o.order_date) = DATE_TRUNC('month', CURRENT_DATE);

-- 12. Sản phẩm có giá cao hơn giá trung bình của danh mục
SELECT
    p.product_name,
    p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p.category
);
