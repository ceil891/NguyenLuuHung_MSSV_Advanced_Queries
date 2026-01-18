-- 5. Khách hàng có từ 3 đơn hàng trở lên
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 3;

-- 6. Danh mục có tổng tồn kho > 100
SELECT
    p.category,
    SUM(p.stock_quantity) AS total_stock
FROM products p
GROUP BY p.category
HAVING SUM(p.stock_quantity) > 100;

-- 7. Thành phố có >= 5 khách hàng
SELECT
    c.city,
    COUNT(*) AS total_customers
FROM customers c
GROUP BY c.city
HAVING COUNT(*) >= 5;

-- 8. Sản phẩm có tổng số lượng bán > 50
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) > 50;
