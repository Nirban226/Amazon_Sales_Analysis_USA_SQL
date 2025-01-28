-- SQL Project --
--category table(Primary table)--

CREATE TABLE category
(
category_id INT PRIMARY KEY,
category_name VARCHAR(25)
);

--customers table(primary table)--

CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
state VARCHAR(30),
address VARCHAR(5) DEFAULT('XXXXX')
);

--sellers table(primary table)--
CREATE TABLE sellers
(
seller_id INT PRIMARY KEY,
seller_name VARCHAR(30),
origin VARCHAR(5)
);

--updating data types--
ALTER TABLE sellers
ALTER COLUMN origin TYPE VARCHAR(10);
--products table--
CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(60),
price FLOAT,
cogs FLOAT,
category_id INT, --fk--
CONSTRAINT product_fk_category FOREIGN KEY(category_id) REFERENCES category(category_id) 
);

--order table--
CREATE TABLE orders
(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT, --fk--
seller_id INT, --fk
order_status VARCHAR(20),
CONSTRAINT orders_fk_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(seller_id)
);

--order items--
CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT, --fk--
product_id INT, --fk--
quantity INT,
price_per_unit FLOAT,
CONSTRAINT order_items_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
CONSTRAINT order_items_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id)
);

--payment Table--
CREATE TABLE payments
(
payment_id INT PRIMARY KEY, 
order_id INT,--fk--
payment_date DATE,
payment_status VARCHAR(30),
CONSTRAINT payments_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

--shipping table--
CREATE TABLE shippings
(
shipping_id INT PRIMARY KEY,
order_id INT, --fk--
shipping_date DATE,
return_date DATE,
shipping_providers VARCHAR(20),
delivery_status VARCHAR(20),
CONSTRAINT shippings_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

--inventory table--

CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,
product_id INT, --fk--
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT inventory_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id)
);

--END OF SCHEMA--