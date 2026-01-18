-- 1. Danh sách sản phẩm với ALIAS
SELECT
    p.product_name AS "Tên SP",
    p.price AS "Đơn giá"
FROM products p;

-- 2. Tổng số khách hàng theo từng thành phố
SELECT
    c.city,
    COUNT(c.customer_id) AS total_customers
FROM customers c
GROUP BY c.city;

-- 3. Giá cao nhất, thấp nhất, trung bình theo danh mục
SELECT
    p.category,
    MAX(p.price) AS max_price,
    MIN(p.price) AS min_price,
    AVG(p.price) AS avg_price
FROM products p
GROUP BY p.category;

-- 4. Đếm số đơn hàng theo trạng thái
SELECT
    o.status,
    COUNT(o.order_id) AS order_count
FROM orders o
GROUP BY o.status;
