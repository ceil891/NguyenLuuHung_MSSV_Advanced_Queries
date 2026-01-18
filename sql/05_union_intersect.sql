-- 17. Gộp email customers và email marketing
SELECT email FROM customers
UNION
SELECT email FROM marketing_emails;

-- 18. Khách hàng mua cả Electronics và Books
SELECT customer_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
INTERSECT
SELECT customer_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Books';

-- 19. So sánh sản phẩm bán chạy tháng này và tháng trước
SELECT product_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE DATE_TRUNC('month', o.order_date) = DATE_TRUNC('month', CURRENT_DATE)
INTERSECT
SELECT product_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE DATE_TRUNC('month', o.order_date) =
      DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month');

-- 20. Khách hàng ở cả Hà Nội và TP.HCM
SELECT customer_id
FROM customer_addresses
WHERE city = 'Hà Nội'
INTERSECT
SELECT customer_id
FROM customer_addresses
WHERE city = 'TP.HCM';
