create table products(
	product_id int primary key,
    product_name varchar(150),
    price decimal(10,2),
    category varchar(100)
);
create table orders(
	order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);
-- 1.Sử dụng GROUP BY (Cơ bản):
	select category, count(*) as number_of_products
    from products
    group by category;
-- 2. Sử dụng GROUP BY với SUM:
	select customer_id, sum(total_amount) as total_spent
    from orders
    group by customer_id;
-- 3. Kết hợp nhiều hàm tổng hợp với GROUP BY:
	select category,count(product_id) as product_count, avg(price) as avg_price, max(price) as max_price, min(price) as min_price
    from products
    group by category;
-- 4. Sử dụng HAVING để lọc nhóm:
	select customer_id, sum(total_amount) as total_spent
    from orders
    group by customer_id
    having total_spent > 1000;
-- 5. Sử dụng HAVING với COUNT:
	select category, count(product_id) as product_count
    from products
    group by category
    having product_count > 5;
-- 6. Kết hợp GROUP BY, ORDER BY và LIMIT:
	select customer_id, sum(total_amount) as total_spent
    from orders
    group by customer_id
    order by total_spent DESC
    limit 3;