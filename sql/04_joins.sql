-- 13. Đơn hàng + tên khách hàng + email (INNER JOIN)
SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    c.customer_name,
    c.email
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 14. Tất cả khách hàng và số đơn hàng (LEFT JOIN)
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 15. Tất cả sản phẩm và số lượng đã bán (LEFT JOIN)
SELECT
    p.product_name,
    COALESCE(SUM(oi.quantity), 0) AS total_sold
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- 16. Tất cả danh mục và số sản phẩm
SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_name = p.category
GROUP BY c.category_id, c.category_name;
